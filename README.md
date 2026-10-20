# EFT Ammo Types (PAYDAY 2, BeardLib)

197 Escape from Tarkov ammo types as weapon ammo mods, grouped by caliber.
Standalone: it only needs BeardLib and does not require MoreAmmoTypes (it can run alongside it).

Icons: black and white versions of the EFT item icons (EfTIcons repo and the tarkov.dev asset CDN).
Eight rounds are not on the current EFT wiki, so they borrow the nearest real round's icon:
`12ga_hexagon` (Copper Sabot), `12ga_shr10` and `12ga_shr25` (23x75 Shrapnel), `762x51_m948` (M993), `762x54r_7n1` (7N37), `9x19_7n21` (AP 6.3), `9x39_7n12` (BP gs).
`762x51_ll` and `762x54r_twc` exist on the wiki but have no image on the CDN yet; they use M80 and SNB.
The original colour icons are in `backup_icons_color/` (copy them back to undo the black and white style).
To replace one, overwrite `assets/guis/dlcs/mods/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_a_eft_<cal>_<key>.texture`.
Every ammo uses the dummy part unit, so there is no 3D model yet.

## Balance
- Damage stat = EFT flesh damage relative to the caliber's standard ball round, capped at -15 to +20.
- Armor piercing is scored against the caliber's ball round (same conventions as Ammo Types for All):
  - about the same as ball: `armor_piercing_add` 0
  - a little better: 0.49
  - clearly better: 1 (full AP)
  - better still: also through enemies, then shields
  - wall piercing only for the very top rounds (7N39, SNB, BS, 7N37, .338 AP, Barricade)
- Piercing and high damage cost total ammo and ammo pickup (vanilla `ammo_pickup_min/max_mul`: 1.0 for ball down to 0.25 for wall piercers).
- Snipers and the Lemming and RSh-12 pistols are natively armor piercing. On those guns the mod subtracts 1 from `armor_piercing_add`, so a non-AP round really removes the built-in piercing. Without that, every round would pierce on them.
- FMJ gets +1 ammo. Hollow points get big damage and no piercing.
- Subsonic rounds get a smaller alert size and more suppression.
- Tracer rounds have an 8% chance to ignite; incendiary tracers have 35%.
- The EFT damage and penetration figures come from memory, not from eft-ammo.com (its pages didn't expose stats). Check them against the site. Each ammo's description shows the numbers it was built from.

## Calibers
- Matched to vanilla guns: 5.56, 5.45, 7.62x39, 7.62x51, 7.62x54R, 9x39, 9x19, 9x18, .45 ACP, .357, 7.62x25, 4.6x30, 5.7x28, 12.7x55, .338, 12/70 and 23x75 (KS-23).
- The weapon IDs are from memory and some are guesses:
  - .357: Matever 2006M
  - 7.62x25: C96 and Type 54
  - 12.7x55: RSh-12
  - 5.7x28: P90 and Lemming
  - .338: MSR, R93 and Desert Fox
  - 7.62x51 snipers: WA2000, Model 70 and SBL
  - Edit `EFT_WEAPONS` in `Hooks/weaponfactorytweakdata.lua` to change any of these.
- Weapon IDs that don't exist in your game are skipped silently.
- .308 Marlin Express (ME and ME LOKT) has no PAYDAY 2 gun of its own. It is estimated on the Repeater 1874 and the TTI, WA2000, Model 70 and SBL rifles (`308me` in `EFT_ALSO`).
- Add-on weapons based on a mapped vanilla gun are detected through BeardLib and get the same ammo.
- Extra calibers reuse the guns of a related group (`$ALSO` in `tools_gen_eft.ps1`, `EFT_ALSO` in the hook), and those guns keep their own ammo too:
  - .300 BLK on all 5.56 guns except LMGs; 5.8x42 on the QBU-88 and QBZ guns
  - .366 TKM on 7.62x39 guns except LMGs; 6.8x51 on 7.62x51 rifles except LMGs and snipers
  - 9.3x64 on 7.62x54R guns except LMGs; 9x21 on 9x19 pistols plus the SR-2M and Vityaz
  - .50 AE on the Deagle; .50 BMG and 12.7x108 on the M95, Hecate and TAC-50; 20/70 on every 12/70 shotgun
  - Add-on weapons inherit these through the same lookup.
- Not included: 40x46, 40x53, 30x29 and 26x75 launcher rounds (they need projectile definitions), 20x1mm, and calibers EFT does not have (.44 Magnum, .45-70, .30-06, .380 ACP).

## Rebalancing
Edit `main.xml` directly (stats), or edit `tools_gen_eft.ps1` (it reads `eft_hook_template.lua`) and regenerate:
`powershell -File tools_gen_eft.ps1 -Src ..\MoreAmmoTypes -Dst .`
Regenerating overwrites main.xml and the hook, so hand edits are lost.
