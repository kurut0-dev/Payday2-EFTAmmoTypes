-- Snipers and a few pistols are natively armor piercing (armor_piercing_chance = 1). armor_piercing_add is
-- additive, so on these guns every round's value is shifted by -1: "no AP" (0) becomes -1 and removes the
-- built-in piercing, 0.49 leaves 49%, and full AP (1) stays full. (Same trick Ammo Types for All uses.)
local EFT_NATIVE_AP = {"_snp_", "_pis_lemming", "_pis_rsh12"}
local EFT_CUSTOM_NATIVE_AP = {}

local function eft_is_native_ap(factory_id)
	for _, tag in ipairs(EFT_NATIVE_AP) do
		if string.find(factory_id, tag, 1, true) then
			return true
		end
	end
	return false
end

-- Runs twice: after the factory init (vanilla weapons) and after BeardLib has created its custom weapons.
-- Each ammo is only added once per weapon, so the second pass just picks up the newly registered ones.
local function eft_add_part(list, ammo_id)
	for _, id in ipairs(list) do
		if id == ammo_id then
			return false
		end
	end
	table.insert(list, ammo_id)
	return true
end

local function eft_apply(self)
	-- caliber -> list of factory ids (explicit list + add-on weapons resolved through BeardLib's based_on)
	local weapons = {}
	for caliber, list in pairs(EFT_WEAPONS) do
		weapons[caliber] = {}
		for _, fac_id in ipairs(list) do
			weapons[caliber][#weapons[caliber] + 1] = fac_id
		end
	end

	-- vanilla weapons by short id: wpn_fps_<type>_<short>, wpn_fps_<type>_x_<short> and wpn_fps_x_<short>
	do
		local short_to_cal = {}
		for caliber, list in pairs(EFT_SHORT) do
			for _, short in ipairs(list) do
				short_to_cal[short] = short_to_cal[short] or caliber
			end
		end
		for fac_id, data in pairs(self) do
			if type(fac_id) == "string" and type(data) == "table" and data.uses_parts and string.sub(fac_id, 1, 8) == "wpn_fps_" then
				local short = string.match(fac_id, "^wpn_fps_%a+_(.+)$")
				short = short and (string.match(short, "^x_(.+)$") or short)
				local caliber = short and short_to_cal[short]
				if caliber then
					table.insert(weapons[caliber], fac_id)
				end
			end
		end
	end

	do
		local custom_base, custom_factory = {}, {}
		if BeardLib and BeardLib.Frameworks then
			for _, framework in pairs(BeardLib.Frameworks) do
				for _, mod in pairs(framework._loaded_mods or {}) do
					for _, module in pairs(mod._modules or {}) do
						local cfg = module._config
						if cfg and type(cfg.weapon) == "table" and type(cfg.factory) == "table" and cfg.weapon.id then
							custom_base[cfg.weapon.id] = cfg.weapon.based_on
							custom_factory[cfg.weapon.id] = cfg.factory.id or ("wpn_fps_" .. cfg.weapon.id)
						end
					end
				end
			end
		end

		local weapon_alias = {new_m4 = "m4", new_mp5 = "mp5", new_raging_bull = "raging_bull"}

		-- walk custom -> custom -> vanilla until a weapon with a known caliber is found
		local function find_caliber(weapon_id, depth)
			if not weapon_id or depth > 8 then
				return nil
			end
			for caliber, list in pairs(EFT_WEAPONS) do
				for _, fac_id in ipairs(list) do
					if string.match(fac_id, "^wpn_fps_%a+_(.+)$") == (weapon_alias[weapon_id] or weapon_id) then
						return caliber, fac_id
					end
				end
			end
			return find_caliber(custom_base[weapon_id], depth + 1)
		end

		for weapon_id, fac_id in pairs(custom_factory) do
			local caliber, root_fac_id = find_caliber(custom_base[weapon_id], 0)
			if caliber and self[fac_id] then
				table.insert(weapons[caliber], fac_id)
				if eft_is_native_ap(root_fac_id) then
					EFT_CUSTOM_NATIVE_AP[fac_id] = true
				end
			end
		end
	end

	-- groups that reuse the guns of another group (.300 BLK on 5.56 rifles, 20/70 on 12/70 shotguns, ...)
	local function matches_any(fac_id, patterns)
		for _, pattern in ipairs(patterns) do
			if string.find(fac_id, pattern, 1, true) then
				return true
			end
		end
		return false
	end

	for caliber, also in pairs(EFT_ALSO) do
		weapons[caliber] = weapons[caliber] or {}
		for _, fac_id in ipairs(weapons[also.from] or {}) do
			if (not also.only or matches_any(fac_id, also.only)) and not (also.skip and matches_any(fac_id, also.skip)) then
				table.insert(weapons[caliber], fac_id)
			end
		end
	end

	for caliber, ammo_ids in pairs(EFT_AMMO) do
		for _, ammo_id in ipairs(ammo_ids) do
			local part = self.parts[ammo_id]
			if part then
				-- non-shotgun rounds inherit the shotgun ray count from their parent part, so force a single ray
				if not EFT_SHOTGUN[caliber] then
					part.custom_stats = part.custom_stats or {}
					part.custom_stats.rays = 1
				end

				for _, fac_id in ipairs(weapons[caliber] or {}) do
					local wpn = self[fac_id]
					if wpn and wpn.uses_parts then
						eft_add_part(wpn.uses_parts, ammo_id)
						local npc = self[fac_id .. "_npc"]
						if npc and npc.uses_parts then
							eft_add_part(npc.uses_parts, ammo_id)
						end
						if (eft_is_native_ap(fac_id) or EFT_CUSTOM_NATIVE_AP[fac_id])
							and part.custom_stats and part.custom_stats.armor_piercing_add ~= nil then
							local stats = deep_clone(part.custom_stats)
							stats.armor_piercing_add = stats.armor_piercing_add - 1
							wpn.override = wpn.override or {}
							wpn.override[ammo_id] = {custom_stats = stats}
						end
					end
				end
			end
		end
	end
end

Hooks:PostHook(WeaponFactoryTweakData, "init", "EFTAmmoTypesInit", eft_apply)

-- BeardLib registers custom weapons after init; run again once they exist (same trigger Ammo Types for All uses).
Hooks:PostHook(Hooks, "Call", "EFTAmmoTypesBeardLibWeapons", function(hk, hook_id, self)
	if hook_id == "BeardLibCreateCustomWeaponMods" and self and self.parts then
		eft_apply(self)
	end
end)
