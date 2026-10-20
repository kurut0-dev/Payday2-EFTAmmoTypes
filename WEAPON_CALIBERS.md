# Vanilla weapon to EFT caliber map

Which EFT ammo group each vanilla weapon gets. Names come from the real-weapon-names list (VanillaHUD Plus); the short id is the part after `wpn_fps_<type>_`.
Akimbo versions (`x_<id>`) use the same caliber as the single gun.
"Approx." means the real caliber has no EFT equivalent and the closest group is used.
This table is a snapshot of `EFT_SHORT` in `tools_gen_eft.ps1`, which is the source of truth: change it there and regenerate.

## Assault rifles

| Weapon | Short id | EFT group | Note |
|---|---|---|---|
| Colt M4A1 | m4 | 5.56x45 | |
| Colt M16A4 | m16 | 5.56x45 | |
| Colt M733 | amcar | 5.56x45 | |
| Steyr AUG A2 | aug | 5.56x45 | |
| H&K G36KV | g36 | 5.56x45 | |
| Swiss Arms SG 552-2 | s552 | 5.56x45 | |
| FAMAS F1 | famas | 5.56x45 | |
| Enfield L85A2 | l85a2 | 5.56x45 | |
| VHS-D2 | vhs | 5.56x45 | |
| H&K 416C | tecci | 5.56x45 | |
| FN F2000 | corgi | 5.56x45 | |
| IWI X95 | komodo | 5.56x45 | |
| Norinco QBU-88 | qbu88 | 5.56x45 | Approx. (5.8x42) |
| Bofors Ak 5 | ak5 | 5.56x45 | |
| Izhmash AKMS | akm | 7.62x39 | |
| Golden AKMS | akm_gold | 7.62x39 | |
| Izhmash AKS-74 | ak74 | 5.45x39 | |
| Izhmash AK-12 | ak12 | 5.45x39 | |
| Flint (AK-style) | flint | 5.45x39 | Not in the names list; guessed |
| FN SCAR-H STD | scar | 7.62x51 | |
| FN FAL | fal | 7.62x51 | |
| IMI Galil ARM | galil | 7.62x51 | |
| H&K G3A3 | g3 | 7.62x51 | |
| H&K 417 w/ M203 GL | contraband | 7.62x51 | |
| Springfield M1A SOCOM 16 | m14 | 7.62x51 | |
| Springfield M1 Garand | ching | 7.62x51 | Approx. (.30-06) |
| Vollmer HK51B | hk51b | 7.62x51 | |
| TKB-059 | tkb | 7.62x51 | Approx. |
| Ohio Ordnance HCAR | hcar | 7.62x51 | Approx. (.30-06) |
| AS VAL | asval | 9x39 | |
| OTs-14 Groza | groza | 9x39 | |
| ShAK-12 | shak12 | 9x39 | Approx. (real gun is 12.7x55) |
| Kel-Tec SUB-2000 | sub2000 | 9x19 | |

## Light machine guns

| Weapon | Short id | EFT group | Note |
|---|---|---|---|
| FN M249 Para | m249 | 5.56x45 | |
| Izhmash RPK | rpk | 7.62x39 | |
| H&K 21E | hk21 | 7.62x51 | |
| FN M240B | par | 7.62x51 | |
| MG-42 | mg42 | 7.62x51 | Approx. (7.92x57) |
| KAC ChainSAW | kacchainsaw | none | |
| M134 Minigun | m134 | none | |

## Sniper rifles and marksman rifles

| Weapon | Short id | EFT group | Note |
|---|---|---|---|
| KAC SR-25 | tti | 7.62x51 | |
| Walther WA 2000 | wa2000 | 7.62x51 | |
| Winchester Model 70 | model70 | 7.62x51 | |
| Marlin Model 1895 | sbl | 7.62x51 | Approx. (.45-70) |
| Remington Model 700P | r700 | 7.62x51 | |
| Steyr Scout | scout | 7.62x51 | |
| AT308 | awp | 7.62x51 | |
| Springfield SAINT Victor | victor | 7.62x51 | Approx. |
| Mosin-Nagant M1907 | mosin | 7.62x54R | |
| SVD Dragunov | siltstone | 7.62x54R | |
| Remington MSR | msr | .338 Lapua | |
| Blaser R93 LRS2 | r93 | .338 Lapua | |
| Desert Tech SRS-A1 | desertfox | .338 Lapua | |
| Barrett M95 | m95 | .338 Lapua | Approx. (.50 BMG) |
| Winchester Model 1873 | winchester1874 | none | Lever action, no matching EFT caliber |
| Thompson/Center Contender | contender | none | |

## Submachine guns

| Weapon | Short id | EFT group | Note |
|---|---|---|---|
| H&K MP5A4 | mp5 | 9x19 | |
| B&T MP9 | mp9 | 9x19 | |
| Minebea PM-9 | pm9 | 9x19 | |
| Intratec TEC-9 | tec9 | 9x19 | |
| IMI Uzi | uzi | 9x19 | |
| IMI Micro Uzi | baka | 9x19 | |
| Sterling L2A1 | sterling | 9x19 | |
| Cobray M11/9 | cobray | 9x19 | |
| Carl Gustav M/45 | m45 | 9x19 | |
| MP40 | erma | 9x19 | |
| SIG-Sauer MPX | shepheard | 9x19 | |
| SR-2M Veresk | sr2 | 9x19 | |
| PP-19 Vityaz-SN | vityaz | 9x19 | |
| Magpul FMG-9 | fmg9 | 9x19 | |
| Maxim 9 | maxim9 | 9x19 | |
| Ingram MAC-10 | mac10 | .45 ACP | |
| Thompson M1928A1 | m1928 | .45 ACP | |
| H&K UMP-45 | schakal | .45 ACP | |
| KRISS Vector | polymer | .45 ACP | |
| PP-19 Bizon | coal | 9x18 | |
| Scorpion vz.61 | scorpion | 9x18 | Approx. (.32 ACP) |
| H&K MP7A2 | mp7 | 4.6x30 | |
| FN P90 TR | p90 | 5.7x28 | |
| Olympic Arms K23B | olympic | 5.56x45 | |
| CZ 805 BREN A1 | hajk | 5.56x45 | |
| Izhmash AKMSU | akmsu | 7.62x39 | |

## Pistols

| Weapon | Short id | EFT group | Note |
|---|---|---|---|
| Makarov PM | pmm | 9x18 | |
| Walther PPK | ppk | 9x18 | Approx. (.380 ACP) |
| Stechkin Automatic Pistol | stech | 9x18 | |
| Glock 17 | glock_17 | 9x19 | |
| Glock 18C | glock_18c | 9x19 | |
| Glock 22C | g22c | 9x19 | Approx. (.40 S&W) |
| Glock 26 (jowi is the akimbo version) | jowi | 9x19 | |
| Beretta 92FS Centurion | b92fs | 9x19 | |
| Beretta 93R | beer | 9x19 | |
| Springfield XDM | hs2000 | 9x19 | |
| H&K P30L | packrat | 9x19 | |
| H&K P7M13 | legacy | 9x19 | |
| Jericho 941 RPL | sparrow | 9x19 | |
| PL-14 Lebedev | pl14 | 9x19 | |
| Luger P08 | breech | 9x19 | |
| CZ AccuShadow 2 | czech | 9x19 | |
| Hudson H9 | holt | 9x19 | |
| SIG-Sauer P226 | p226 | 9x19 | |
| Welrod Mark II | welrod | 9x19 | |
| H&K USP Tactical .45 | usp | .45 ACP | |
| M1911 Lightweight Operator | colt_1911 | .45 ACP | |
| Colt M1911 | m1911 | .45 ACP | |
| Colt Defender | shrew | .45 ACP | |
| Single Action Army Cavalry | peacemaker | .45 ACP | Approx. (.45 Colt) |
| S&W No. 3 Russian | model3 | .45 ACP | Approx. (.44 Russian) |
| Mateba 2006M | mateba | .357 | |
| Taurus Raging Bull .44 | raging_bull | .357 | Approx. (.44 Magnum) |
| IMI Desert Eagle Mk XIX | deagle | .357 | Approx. (.50 AE) |
| S&W Model 29 | chinchilla | .357 | Approx. (.44 Magnum) |
| Korth NXA/NXS | korth | .357 | |
| Mauser C96 | c96 | 7.62x25 | |
| Tokarev TT-33 | type54 | 7.62x25 | |
| KBP RSh-12 | rsh12 | 12.7x55 | |
| FN Five-seveN | lemming | 5.7x28 | |
| Taurus Judge | judge | 12/70 | Shotgun ammo |

## Shotguns

All of these get the 12/70 group.

| Weapon | Short id |
|---|---|
| Franchi SPAS-12 | spas12 |
| CZ Redhead Deluxe | b682 |
| Remington M870 | r870 |
| Remington M870 Short-Barreled | serbu |
| Izhmash Saiga-12K | saiga |
| Stoeger/IGA Coach | huntsman |
| Remington Exposed Hammer SxS | coach |
| Benelli M4 Super 90 | benelli |
| Benelli Supernova | supernova |
| Kel-Tec KSG | ksg |
| MPS AA-12 CQB | aa12 |
| Winchester Model 1887 | boot |
| Winchester Model 1897 | m1897 |
| Crye Precision SIX12 | rota |
| Sentinel Armsel Striker | striker |
| Ithaca 37 | m37 |
| CBRPS Saiga Spike X1S | basset |
| Mossberg 590 Compact Cruiser | m590 |
| SKO-12 | sko12 |
| Kalashnikov MP-155 Ultima | ultima |
| Schrotflinte System Becker | bleckert |
| KS-23 | ks23 (23x75 group) |

## Not covered

Grenade and rocket launchers (M79, MGL, China Lake, XM-25, M202, M320, RPG-7, Metal Storm), bows and crossbows, the flamethrower, the OVE9000 saw and the Pivot get no EFT ammo.
Custom (add-on) weapons are handled separately: through BeardLib's `based_on` chain, or the extra lists in `tools_gen_eft.ps1`.

## Extra groups (also)

These guns keep the group above and additionally get the groups below.

| Extra group | Which guns |
|---|---|
| .300 Blackout | every 5.56x45 gun except LMGs |
| 5.8x42 | QBU-88 and QBZ guns |
| .366 TKM | every 7.62x39 gun except LMGs |
| 6.8x51 | 7.62x51 rifles (no LMGs or snipers) |
| 9.3x64 | every 7.62x54R gun except LMGs |
| 9x21 | 9x19 pistols, SR-2M, Vityaz |
| .50 AE | Desert Eagle |
| .50 BMG, 12.7x108 | Barrett M95, Hecate, TAC-50 |
| 20/70 | every 12/70 shotgun |

Add-on weapons that resolve to one of these guns get the same extra groups.
