param([string]$Src, [string]$Dst)
$ErrorActionPreference = 'Stop'
$ICON_REL = "assets/guis/dlcs/mods/textures/pd2/blackmarket/icons/mods"
$P = "wpn_fps_upg_a_"
$utf8 = New-Object System.Text.UTF8Encoding($false)
$inv = [Globalization.CultureInfo]::InvariantCulture

# base = baseline EFT flesh damage, scale = PD2 damage-stat points per +100% EFT damage
$CAL = [ordered]@{
  "556x45"  = @{ball=31; label="5.56x45mm"; base=54; scale=50}
  "545x39"  = @{ball=28; label="5.45x39mm"; base=56; scale=50}
  "762x39"  = @{ball=35; label="7.62x39mm"; base=57; scale=50}
  "762x51"  = @{ball=41; label="7.62x51mm"; base=80; scale=40}
  "762x54r" = @{ball=28; label="7.62x54mmR"; base=81; scale=40}
  "9x39"    = @{ball=28; label="9x39mm"; base=58; scale=50}
  "9x19"    = @{ball=20; label="9x19mm"; base=54; scale=50}
  "9x18"    = @{ball=18; label="9x18mm"; base=50; scale=50}
  "45acp"   = @{ball=25; label=".45 ACP"; base=72; scale=50}
  "357"     = @{ball=26; label=".357 Magnum"; base=79; scale=50}
  "46x30"   = @{ball=24; label="4.6x30mm"; base=35; scale=50}
  "57x28"   = @{ball=30; label="5.7x28mm"; base=45; scale=50}
  "338"     = @{ball=50; label=".338 Lapua Magnum"; base=115; scale=35}
  "762x25"  = @{ball=27; label="7.62x25mm TT"; base=58; scale=50}
  "127x55"  = @{ball=28; label="12.7x55mm"; base=115; scale=35}
  "12ga"    = @{ball=0; label="12/70"; base=0; scale=0}
  "23x75"   = @{ball=0; label="23x75mm"; base=0; scale=0}
  "300blk"  = @{ball=30; label=".300 Blackout"; base=60; scale=50}
  "58x42"   = @{ball=39; label="5.8x42mm"; base=53; scale=50}
  "366tkm"  = @{ball=23; label=".366 TKM"; base=98; scale=40}
  "68x51"   = @{ball=36; label="6.8x51mm"; base=80; scale=40}
  "93x64"   = @{ball=44; label="9.3x64mm"; base=115; scale=40}
  "9x21"    = @{ball=22; label="9x21mm"; base=59; scale=50}
  "50ae"    = @{ball=40; label=".50 AE"; base=85; scale=40}
  "50bmg"   = @{ball=56; label=".50 BMG"; base=190; scale=35}
  "127x108" = @{ball=60; label="12.7x108mm"; base=182; scale=35}
  "20ga"    = @{ball=0; label="20/70"; base=0; scale=0}
}
function RoleSet($fmj,$ap,$hp,$tracer,$inc,$sub,$frag){ @{fmj=$fmj;ap=$ap;hp=$hp;tracer=$tracer;inc=$inc;sub=$sub;frag=$frag} }
$pistolIcons = RoleSet "lap9mm" "ap9mm" "hv9mm" "lap9mm" "7h31" "lap9mm" "7h21"
$lcIcons     = RoleSet "45lc_fmj" "45lc_jsp" "45lc_jhp" "45lc_fmj" "45lc_jsp" "45lc_fmj" "45lc_jhp"
$ICONS = @{
  "556x45"  = RoleSet "556x45_m855" "556x45_m995" "556x45_mk262" "556x45_m196" "556x45_xm778" "556x45_m855a1" "556x45_mk318"
  "545x39"  = RoleSet "545x39_7n6" "545x39_7n22" "545x39_7n6m" "545x39_7n10" "545x39_7n24" "545x39_7u1" "545x39_7n10"
  "762x39"  = RoleSet "762x39_t56fmj" "762x39_m67" "762x39_hp" "762x39_m78" "762x39_bz" "762x39_tsr" "762x39_hv"
  "762x51"  = RoleSet "762x51_m80" "762x51_m993" "762x51_m118lr" "762x51_m62" "762x51_m61" "762x51_m948" "762x51_m198"
  "762x54r" = RoleSet "762x54r_7n1" "762x54r_7bz3" "762x54r_7n14" "762x54r_t46" "762x54r_7bt1" "762x54r_73p2" "762x54r_7n13"
  "9x39"    = RoleSet "9x39_sp5" "9x39_sp6" "9x39_pab9" "9x39_spp" "9x39_bp" "9x39_sp5" "9x39_pab9"
  "9x19"=$pistolIcons; "9x18"=$pistolIcons; "46x30"=$pistolIcons; "57x28"=$pistolIcons
  "45acp"=$lcIcons; "357"=$lcIcons
  "762x25"=$pistolIcons; "127x55" = RoleSet "762x51_m80" "762x51_xm115" "762x51_m118lr" "762x51_m62" "762x51_m61" "762x51_m948" "762x51_m198"
  "338"     = RoleSet "762x51_m80" "762x51_xm115" "762x51_m118lr" "762x51_m62" "762x51_m61" "762x51_m948" "762x51_m198"
  "300blk"  = RoleSet "556x45_m855" "556x45_m995" "556x45_mk262" "556x45_m196" "556x45_xm778" "556x45_m855a1" "556x45_mk318"
  "58x42"   = RoleSet "556x45_m855" "556x45_m995" "556x45_mk262" "556x45_m196" "556x45_xm778" "556x45_m855a1" "556x45_mk318"
  "366tkm"  = RoleSet "762x39_t56fmj" "762x39_m67" "762x39_hp" "762x39_m78" "762x39_bz" "762x39_tsr" "762x39_hv"
  "68x51"   = RoleSet "762x51_m80" "762x51_m993" "762x51_m118lr" "762x51_m62" "762x51_m61" "762x51_m948" "762x51_m198"
  "93x64"   = RoleSet "762x54r_7n1" "762x54r_7bz3" "762x54r_7n14" "762x54r_t46" "762x54r_7bt1" "762x54r_73p2" "762x54r_7n13"
  "9x21"=$pistolIcons; "50ae"=$lcIcons
  "50bmg"   = RoleSet "762x51_m80" "762x51_xm115" "762x51_m118lr" "762x51_m62" "762x51_m61" "762x51_m948" "762x51_m198"
  "127x108" = RoleSet "762x51_m80" "762x51_xm115" "762x51_m118lr" "762x51_m62" "762x51_m61" "762x51_m948" "762x51_m198"
}

# ---- non-shotgun table: cal, key, name, EFT dmg, EFT pen, accuracy%, recoil%, tags
$R = New-Object System.Collections.ArrayList
function A($cal,$key,$name,$d,$p,$acc,$rec,$tags){ [void]$R.Add(@{cal=$cal;key=$key;name=$name;d=$d;p=$p;acc=$acc;rec=$rec;tags=@($tags -split ' ' | ?{$_})}) }
A "556x45" "hp" "55 HP" 79 9 0 0 "hp"
A "556x45" "fmj" "55 FMJ" 54 23 0 0 "fmj"
A "556x45" "m855" "M855" 54 31 0 0 ""
A "556x45" "m855a1" "M855A1" 49 44 0 0 ""
A "556x45" "m856" "M856" 60 18 0 0 "tracer"
A "556x45" "m856a1" "M856A1" 48 38 0 0 "tracer"
A "556x45" "m995" "M995" 42 53 4 5 ""
A "556x45" "ssa_ap" "SSA AP" 37 57 0 -5 ""
A "556x45" "warmage" "Warmage" 57 26 0 0 "frag"
A "556x45" "mk255" "MK 255 Mod 0 (RRLP)" 72 20 0 0 "hp"
A "556x45" "mk318" "MK 318 Mod 0 (SOST)" 53 33 0 0 "frag"
A "545x39" "fmj" "FMJ" 50 21 0 0 "fmj"
A "545x39" "hp" "HP" 72 7 0 0 "hp"
A "545x39" "pp" "PP gs" 53 28 0 0 ""
A "545x39" "ps" "PS gs" 51 28 0 0 ""
A "545x39" "us" "US gs" 42 18 -25 -35 "sub"
A "545x39" "t" "T gs" 60 22 0 0 "tracer"
A "545x39" "prs" "PRS gs" 48 34 0 0 ""
A "545x39" "bp" "BP gs" 46 42 0 3 ""
A "545x39" "bt" "BT gs" 54 37 0 0 "inc tracer"
A "545x39" "bs" "BS gs" 37 56 0 -8 ""
A "545x39" "igolnik" "7N39 Igolnik" 53 62 0 8 ""
A "762x39" "hp" "HP" 87 9 0 0 "hp"
A "762x39" "us" "US gs" 47 20 -25 -30 "sub"
A "762x39" "ps" "PS gs" 57 35 0 0 ""
A "762x39" "t45" "T-45M1 gs" 65 30 0 0 ""
A "762x39" "bp" "BP gs" 58 47 0 2 ""
A "762x39" "mai_ap" "MAI AP" 47 58 0 -5 ""
A "762x39" "fmj" "FMJ" 57 24 0 0 "fmj"
A "762x51" "m80" "M80" 80 41 0 0 "fmj"
A "762x51" "m61" "M61" 70 64 0 10 ""
A "762x51" "m62" "M62 Tracer" 79 44 0 0 "tracer"
A "762x51" "m993" "M993" 70 67 0 12 ""
A "762x51" "bpz" "BPZ FMJ" 80 44 0 4 ""
A "762x51" "ultra" "Ultra Nosler" 87 26 0 0 "hp"
A "762x51" "tpz" "TPZ SP" 95 25 0 0 "hp"
A "762x51" "m948" "M948 SSA AP" 75 62 0 8 "sub"
A "762x54r" "lps" "LPS Gzh" 81 28 0 0 "fmj"
A "762x54r" "t46m" "T-46M gzh" 77 33 0 0 "tracer"
A "762x54r" "snb" "SNB gzh" 75 62 0 8 ""
A "762x54r" "bt" "BT gzh" 80 50 0 5 "inc tracer"
A "762x54r" "bs" "BS gs" 68 70 0 10 ""
A "762x54r" "7n1" "7N1 Sniper" 84 40 0 0 ""
A "762x54r" "7n37" "7N37 Sniper" 78 72 0 10 ""
A "9x39" "sp5" "SP-5 gs" 60 28 0 0 "sub"
A "9x39" "sp6" "SP-6 gs" 55 43 0 3 "sub"
A "9x39" "pab9" "PAB-9 gs" 52 52 0 5 "sub"
A "9x39" "bp" "BP gs" 54 54 0 6 "sub"
A "9x39" "7n12" "7N12 BP gs" 50 57 0 10 "sub"
A "9x19" "fmj" "FMJ M882" 52 18 0 0 "fmj"
A "9x19" "luger" "Luger CCI" 56 15 0 0 "fmj"
A "9x19" "pst" "Pst gzh" 54 20 0 0 ""
A "9x19" "rip" "RIP" 102 1 -10 12 "hp"
A "9x19" "quake" "QuakeMaker" 79 10 0 0 "hp"
A "9x19" "green" "Green Tracer" 50 15 0 0 "tracer"
A "9x19" "ap63" "AP 6.3" 52 30 0 8 ""
A "9x19" "7n21" "7N21" 58 40 0 8 ""
A "9x19" "7n31" "7N31" 58 44 -5 12 ""
A "9x18" "sp7" "PM SP7 gzh" 60 10 0 0 "hp"
A "9x18" "sp8" "SP8 gzh" 55 14 0 0 ""
A "9x18" "ps" "PS gs PP" 50 18 0 0 "fmj"
A "9x18" "prs" "PRS gs" 58 11 0 5 "hp"
A "9x18" "ppe" "PPe gzh" 53 32 0 5 ""
A "9x18" "ppt" "PPT gzh" 48 28 0 3 ""
A "45acp" "fmj" "FMJ" 72 25 0 0 "fmj"
A "45acp" "lasermatch" "Lasermatch FMJ" 68 23 5 0 "fmj"
A "45acp" "hydra" "Hydra-Shok" 90 8 0 0 "hp"
A "45acp" "rip" "RIP" 102 5 0 12 "hp"
A "45acp" "ap" "AP" 66 38 0 5 ""
A "357" "fmj" "FMJ" 79 26 0 0 "fmj"
A "357" "hp" "HP" 107 7 0 8 "hp"
A "357" "jhp" "JHP" 95 15 0 5 "hp"
A "357" "sp" "SP" 90 12 0 3 "hp"
A "46x30" "fmj" "FMJ SX" 35 24 0 0 "fmj"
A "46x30" "ap" "AP SX" 35 40 0 5 ""
A "46x30" "action" "Action SX" 52 12 0 5 "hp"
A "46x30" "jsp" "JSP SX" 44 15 0 0 "hp"
A "46x30" "sub" "Subsonic SX" 32 15 -15 -25 "sub"
A "57x28" "ss190" "SS190" 37 30 0 0 ""
A "57x28" "l191" "L191" 49 14 0 5 "inc tracer"
A "57x28" "ss197" "SS197SR" 62 18 0 5 "hp"
A "57x28" "ss198" "SS198LF" 41 11 0 0 "fmj"
A "57x28" "r37f" "R37.F" 54 20 0 5 "frag"
A "57x28" "r37x" "R37.X" 58 15 0 5 "hp"
A "57x28" "sb193" "SB193" 47 33 0 3 ""
A "762x25" "lrn" "LRN" 58 15 0 0 "fmj"
A "762x25" "fmj43" "FMJ43" 60 25 0 0 "fmj"
A "762x25" "pgl" "P gl" 55 20 0 0 ""
A "762x25" "lrnpc" "LRNPC" 62 12 0 0 "hp"
A "762x25" "akbs" "AKBS" 51 35 0 3 ""
A "762x25" "pst" "Pst gzh" 57 28 0 0 ""
A "127x55" "ps12" "PS12" 115 28 0 0 "fmj"
A "127x55" "ps12a" "PS12A" 165 12 0 5 "hp"
A "127x55" "ps12b" "PS12B" 102 51 0 5 ""
A "338" "fmj" "FMJ" 115 79 0 0 "fmj"
A "338" "ap" "AP" 105 81 0 5 ""
A "338" "tac" "TAC-X" 122 68 0 0 "hp"
A "338" "ucw" "UCW" 127 60 0 0 "hp"


# ---- added from the EFT wiki caliber pages (rounds that were missing)
A "545x39" "7n40" "7N40" 55 42 0 -10 ""
A "545x39" "sp" "SP" 67 15 5 -5 "hp"
A "762x39" "pp" "PP gzh" 59 41 -1 5 ""
A "762x39" "sp" "SP" 68 20 5 -5 "hp"
A "762x51" "ll" "Ball 11 Long Range" 95 63 15 15 ""
A "762x51" "m80a1" "M80A1" 75 55 -5 4 ""
A "762x54r" "fmj" "FMJ" 84 36 0 0 "fmj"
A "762x54r" "hpbt" "HP BT" 102 26 10 0 "hp"
A "762x54r" "ps" "PS gzh" 84 45 10 8 ""
A "762x54r" "spbt" "SP BT" 92 31 7 0 "hp"
A "762x54r" "twc" "Tungsten Carbide AP" 98 66 10 10 ""
A "9x39" "fmj" "FMJ" 75 17 5 -5 "sub fmj"
A "9x39" "spp" "SPP gs" 68 35 10 7 "sub"
A "9x19" "pbp" "PBP gzh" 44 39 5 5 ""
A "9x19" "pso" "PSO gzh" 59 10 0 0 "sub"
A "9x18" "bzht" "BZhT gzh" 53 18 0 0 "sub"
A "9x18" "p" "P gzh" 50 5 0 0 "sub"
A "9x18" "pbm" "PBM gzh" 40 28 0 4 ""
A "9x18" "pso" "PSO gzh" 54 5 10 0 "sub"
A "9x18" "pst" "Pst gzh" 50 12 0 0 "sub"
A "9x18" "psv" "PSV" 69 3 0 0 "sub hp"
A "9x18" "rg028" "RG028 gzh" 65 13 0 0 "sub"
A "9x18" "pstm" "PMM PstM gzh" 58 24 0 5 ""
A "762x25" "m855a1" "M855A1" 34 31 0 0 ""
A "762x25" "m856a1" "M856A1" 36 27 0 0 "tracer"
A "762x25" "m995" "M995" 32 37 0 0 ""
A "762x25" "pt" "PT gzh" 55 18 -10 0 "tracer"


# ---- calibers added from the EFT wiki; guns come from EFT_ALSO below (existing guns of a related caliber)
A "300blk" "ap" "AP" 51 48 0 3 ""
A "300blk" "fmj" "BCP FMJ" 60 30 0 0 "fmj"
A "300blk" "cbj" "CBJ" 58 43 0 5 ""
A "300blk" "m62" "M62 Tracer" 54 36 0 1 "tracer"
A "300blk" "vmax" "V-Max" 72 20 30 -10 "hp"
A "300blk" "whisper" "Whisper" 90 14 5 -5 "hp"
A "58x42" "dbp191" "DBP191" 53 39 0 -3 ""
A "58x42" "dbx95" "DBX95" 57 33 -3 -5 "tracer"
A "58x42" "dvc12" "DVC12" 46 52 -5 12 ""
A "58x42" "dvx12" "DVX12" 48 47 -8 9 "tracer"
A "366tkm" "apm" "AP-M" 90 42 -22 35 ""
A "366tkm" "eko" "EKO" 73 30 -10 -15 ""
A "366tkm" "fmj" "FMJ" 98 23 0 10 "fmj"
A "366tkm" "geksa" "Geksa" 110 14 0 0 "hp"
A "68x51" "fmj" "SIG FMJ" 80 36 0 0 "fmj"
A "68x51" "hybrid" "SIG Hybrid" 72 47 3 10 ""
A "93x64" "7n33" "7N33" 108 56 -5 20 ""
A "93x64" "fmj" "FMJ" 115 44 15 0 "fmj"
A "93x64" "sp" "SP" 129 37 0 -20 "hp"
A "9x21" "zubilo" "7N42 Zubilo" 49 38 -3 10 ""
A "9x21" "7u4" "7U4" 53 27 0 0 "sub"
A "9x21" "bt" "BT gzh" 52 32 -5 0 "tracer"
A "9x21" "p" "P gzh" 65 18 0 0 ""
A "9x21" "pe" "PE gzh" 80 15 3 -5 ""
A "9x21" "ps" "PS gzh" 59 22 1 -3 ""
A "50ae" "copper" "Copper Solid" 94 33 5 8 ""
A "50ae" "fmj" "FMJ" 85 40 0 10 "fmj"
A "50ae" "hawk" "Hawk JSP" 122 26 -5 2 "hp"
A "50ae" "jhp" "JHP" 147 12 -10 5 "hp"
A "50bmg" "hp" "HP" 260 34 15 15 "hp"
A "50bmg" "m21" "M21 Tracer" 220 45 0 20 "tracer"
A "50bmg" "m33" "M33" 190 56 -5 25 ""
A "50bmg" "slap" "M903 SLAP" 160 115 -10 28 ""
A "127x108" "b32" "B-32" 182 88 0 0 ""
A "127x108" "bzt" "BZT-44M" 199 80 0 0 "tracer"

# ---- shotgun / special ammo (hand written: ray counts, near/far mults)
$SG = New-Object System.Collections.ArrayList
function S($cal,$key,$name,$stats,$cs,$icon,$desc,$subtype="ammo_slug",$fire=$null){ [void]$SG.Add(@{cal=$cal;key=$key;name=$name;stats=$stats;cs=$cs;icon=$icon;desc=$desc;subtype=$subtype;fire=$fire}) }
function O { param([hashtable]$h) $o=[ordered]@{}; foreach($k in $h.Keys | Sort-Object){ $o[$k]=$h[$k] }; $o }
S "12ga" "7mm" "7mm Buckshot" ([ordered]@{total_ammo_mod=0;damage=5;spread=-2;moving_spread=-2;recoil=0}) ([ordered]@{rays=8;damage_near_mul=1.0;damage_far_mul=0.9}) "minibuck" "Heavier pellets than the standard shell, fewer of them."
S "12ga" "65exp" "6.5mm Express Buckshot" ([ordered]@{total_ammo_mod=2;damage=-5;spread=-3;moving_spread=-3;recoil=1}) ([ordered]@{rays=12;damage_near_mul=0.9;damage_far_mul=0.9}) "minibuck" "Many small pellets. Wide spread, forgiving at close range."
S "12ga" "85mag" "8.5mm Magnum Buckshot" ([ordered]@{total_ammo_mod=-2;damage=20;spread=-4;moving_spread=-4;recoil=-2}) ([ordered]@{rays=6;damage_near_mul=1.1;damage_far_mul=0.8}) "minibuck" "Big magnum pellets. Hits hard up close, falls off quickly."
S "12ga" "525" '5.25mm Buckshot "Piranha"' ([ordered]@{total_ammo_mod=-1;damage=-10;spread=-5;moving_spread=-5;recoil=-1}) ([ordered]@{rays=20;damage_near_mul=0.85;damage_far_mul=0.7}) "12_bird" "A cloud of light pellets. Great for crowds, poor against armor."
S "12ga" "shr10" "Shrapnel-10" ([ordered]@{total_ammo_mod=-3;damage=10;spread=-6;moving_spread=-6;recoil=-2}) ([ordered]@{rays=10;damage_near_mul=1.1;damage_far_mul=0.7;armor_piercing_add=0.49}) "12_hfrag12" "Improvised shrapnel load. Decent against armor, very wide."
S "12ga" "shr25" "Shrapnel-25" ([ordered]@{total_ammo_mod=-4;damage=15;spread=-7;moving_spread=-7;recoil=-2}) ([ordered]@{rays=6;damage_near_mul=1.2;damage_far_mul=0.6;armor_piercing_add=1}) "12_frag12" "Large shrapnel pieces. Punches through armor at point-blank range."
S "12ga" "flech" "AP-20 Flechette" ([ordered]@{total_ammo_mod=-5;damage=-5;spread=-2;moving_spread=-2;recoil=-1}) ([ordered]@{rays=6;damage_near_mul=1.0;damage_far_mul=1.0;armor_piercing_add=1;can_shoot_through_enemy=$true}) "12_slsabot" "Steel flechettes. Pierce armor and the enemy behind it."
S "12ga" "lead" "Lead Slug" ([ordered]@{total_ammo_mod=3;damage=0;spread=3;moving_spread=0;recoil=0}) ([ordered]@{rays=1;damage_near_mul=1.4;damage_far_mul=1.4}) "minislug" "Plain lead slug. Cheap, accurate enough, no armor penetration."
S "12ga" "ftx" "FTX Custom Lite Slug" ([ordered]@{total_ammo_mod=-1;damage=10;spread=4;moving_spread=1;recoil=-1}) ([ordered]@{rays=1;damage_near_mul=1.5;damage_far_mul=1.5}) "minislug" "Light hollow-point slug. Devastating on flesh, useless on armor."
S "12ga" "hexagon" "Hexagon Slug" ([ordered]@{total_ammo_mod=-2;damage=15;spread=2;moving_spread=0;recoil=-2}) ([ordered]@{rays=1;damage_near_mul=1.5;damage_far_mul=1.5;armor_piercing_add=0.49}) "12_hsabot" "Heavy hexagonal slug. Hits hard and chews partial armor."
S "12ga" "poleva3" "Poleva-3 Slug" ([ordered]@{total_ammo_mod=0;damage=5;spread=1;moving_spread=0;recoil=-1}) ([ordered]@{rays=1;damage_near_mul=1.4;damage_far_mul=1.4;armor_piercing_add=0.49}) "12_sabot" "Soviet-era slug. Reliable and a little armor-biting."
S "12ga" "poleva6u" "Poleva-6u Slug" ([ordered]@{total_ammo_mod=-1;damage=8;spread=0;moving_spread=-1;recoil=-1}) ([ordered]@{rays=1;damage_near_mul=1.45;damage_far_mul=1.3;armor_piercing_add=0.49}) "12_sabot" "Heavier Poleva load with a bigger kick."
S "12ga" "superf" "SuperFormance HP Slug" ([ordered]@{total_ammo_mod=-3;damage=25;spread=3;moving_spread=0;recoil=-3}) ([ordered]@{rays=1;damage_near_mul=1.6;damage_far_mul=1.6}) "12_hsabot" "High-velocity hollow-point slug. Maximum flesh damage, no penetration."
S "12ga" "grizzly" "Grizzly 40 Slug" ([ordered]@{total_ammo_mod=-4;damage=12;spread=3;moving_spread=0;recoil=-2}) ([ordered]@{rays=1;damage_near_mul=1.5;damage_far_mul=1.5;armor_piercing_add=1;can_shoot_through_enemy=$true}) "12_du_slsabot" "Hardened slug. Pierces armor and the target behind it."
S "12ga" "dsabot" "Dual Sabot Slug" ([ordered]@{total_ammo_mod=-3;damage=0;spread=-1;moving_spread=-2;recoil=-2}) ([ordered]@{rays=2;damage_near_mul=1.4;damage_far_mul=1.3;armor_piercing_add=1}) "12_du_sabot" "Two sabot darts per shell. Armor piercing, both can hit."
S "12ga" "rip" "RIP Slug" ([ordered]@{total_ammo_mod=-4;damage=30;spread=1;moving_spread=-1;recoil=-4}) ([ordered]@{rays=1;damage_near_mul=1.6;damage_far_mul=1.2}) "12_slfrag12" "Active-expansion slug. Enormous wound channel, none of it through armor."
S "12ga" "ap20" "AP-20 Slug" ([ordered]@{total_ammo_mod=-4;damage=10;spread=1;moving_spread=0;recoil=-2}) ([ordered]@{rays=1;damage_near_mul=1.45;damage_far_mul=1.4;armor_piercing_add=1;can_shoot_through_enemy=$true}) "12_slsabot" "Armor-piercing slug. Pierces armor and the enemy behind it."
S "12ga" "csabot" "Copper Sabot Premier HP Slug" ([ordered]@{total_ammo_mod=-3;damage=22;spread=3;moving_spread=0;recoil=-3}) ([ordered]@{rays=1;damage_near_mul=1.6;damage_far_mul=1.6}) "12_hsabot" "Copper hollow-point sabot. Very high flesh damage, no penetration."
S "12ga" "bmg" "Makeshift .50 BMG Slug" ([ordered]@{total_ammo_mod=-3;damage=14;spread=2;moving_spread=0;recoil=-3}) ([ordered]@{rays=1;damage_near_mul=1.5;damage_far_mul=1.5;armor_piercing_add=0.49}) "12_hsabot" "Handmade heavy slug. Hits hard and bites through partial armor."
S "23x75" "barricade" "Barricade" ([ordered]@{total_ammo_mod=-2;damage=40;spread=2;moving_spread=0;recoil=-4}) ([ordered]@{rays=1;damage_near_mul=1.5;damage_far_mul=1.5;armor_piercing_add=1;can_shoot_through_enemy=$true;can_shoot_through_wall=$true}) "12_hsabot" "Door-breaching slug. Goes through walls and what stands behind them."
S "23x75" "shr10" "Shrapnel-10 (23mm)" ([ordered]@{total_ammo_mod=0;damage=10;spread=-5;moving_spread=-5;recoil=-2}) ([ordered]@{rays=14;damage_near_mul=1.1;damage_far_mul=0.7}) "12_hfrag12" "Big-bore buckshot spread."
S "23x75" "shr25" "Shrapnel-25 (23mm)" ([ordered]@{total_ammo_mod=-1;damage=15;spread=-6;moving_spread=-6;recoil=-3}) ([ordered]@{rays=8;damage_near_mul=1.2;damage_far_mul=0.6;armor_piercing_add=0.49}) "12_frag12" "Heavy shrapnel load with partial armor penetration."
S "23x75" "star" "Star Flare" ([ordered]@{total_ammo_mod=-3;damage=-20;spread=2;moving_spread=0;recoil=-1}) ([ordered]@{rays=1;damage_near_mul=1.0;damage_far_mul=1.0;bullet_class="FlameBulletBase"}) "12_inc_slug" "Signal flare round. Low damage, but sets targets on fire." "ammo_dragons_breath" ([ordered]@{dot_trigger_chance=100;dot_damage=10;dot_length=4;dot_trigger_max_distance=10000;dot_tick_period=0.5})

S "20ga" "56" "5.6mm Buckshot" ([ordered]@{total_ammo_mod=1;damage=-12;spread=-5;moving_spread=-5;recoil=1}) ([ordered]@{rays=16;damage_near_mul=0.85;damage_far_mul=0.7}) "12_bird" "Fine pellets. Wide cloud, weak against armor."
S "20ga" "62" "6.2mm Buckshot" ([ordered]@{total_ammo_mod=1;damage=-10;spread=-4;moving_spread=-4;recoil=1}) ([ordered]@{rays=14;damage_near_mul=0.9;damage_far_mul=0.75}) "minibuck" "Light 20-gauge buckshot."
S "20ga" "73" "7.3mm Buckshot" ([ordered]@{total_ammo_mod=0;damage=-4;spread=-3;moving_spread=-3;recoil=0}) ([ordered]@{rays=9;damage_near_mul=0.95;damage_far_mul=0.8}) "minibuck" "Heavier 20-gauge pellets, fewer of them."
S "20ga" "75" "7.5mm Buckshot" ([ordered]@{total_ammo_mod=0;damage=-4;spread=-3;moving_spread=-3;recoil=0}) ([ordered]@{rays=8;damage_near_mul=1.0;damage_far_mul=0.85}) "minibuck" "Large 20-gauge pellets. Tighter pattern."
S "20ga" "dgslug" "Dangerous Game Slug" ([ordered]@{total_ammo_mod=-2;damage=8;spread=3;moving_spread=0;recoil=-2}) ([ordered]@{rays=1;damage_near_mul=1.45;damage_far_mul=1.4;armor_piercing_add=0.49}) "12_sabot" "Heavy hunting slug. Hits hard and bites through partial armor."
S "20ga" "devastator" "Devastator Slug" ([ordered]@{total_ammo_mod=-2;damage=20;spread=3;moving_spread=0;recoil=-3}) ([ordered]@{rays=1;damage_near_mul=1.55;damage_far_mul=1.5}) "12_hsabot" "Expanding slug. Huge flesh damage, no penetration."
S "20ga" "flech" "Flechette" ([ordered]@{total_ammo_mod=-4;damage=-8;spread=-2;moving_spread=-2;recoil=-1}) ([ordered]@{rays=6;damage_near_mul=1.0;damage_far_mul=1.0;armor_piercing_add=0.49}) "12_slsabot" "Steel flechettes. Partly pierce armor."
S "20ga" "poleva3" "Poleva-3 Slug" ([ordered]@{total_ammo_mod=0;damage=2;spread=1;moving_spread=0;recoil=-1}) ([ordered]@{rays=1;damage_near_mul=1.35;damage_far_mul=1.35}) "12_sabot" "Light Soviet-era slug."
S "20ga" "poleva6u" "Poleva-6u Slug" ([ordered]@{total_ammo_mod=-1;damage=5;spread=0;moving_spread=-1;recoil=-1}) ([ordered]@{rays=1;damage_near_mul=1.4;damage_far_mul=1.25;armor_piercing_add=0.49}) "12_sabot" "Heavier Poleva load with a bigger kick."
S "20ga" "star" "Star Slug" ([ordered]@{total_ammo_mod=-1;damage=12;spread=3;moving_spread=0;recoil=-1}) ([ordered]@{rays=1;damage_near_mul=1.5;damage_far_mul=1.5}) "12_hsabot" "Accurate hollow-point style slug."
S "20ga" "tss" "TSS Armor Piercing Slug" ([ordered]@{total_ammo_mod=-4;damage=12;spread=2;moving_spread=0;recoil=-3}) ([ordered]@{rays=1;damage_near_mul=1.5;damage_far_mul=1.5;armor_piercing_add=1;can_shoot_through_enemy=$true}) "12_du_slsabot" "Tungsten slug. Pierces armor and the enemy behind it."

$WEAPONS = [ordered]@{
 "556x45"="wpn_fps_ass_m4 wpn_fps_ass_m16 wpn_fps_ass_amcar wpn_fps_ass_aug wpn_fps_ass_ak5 wpn_fps_ass_g36 wpn_fps_ass_s552 wpn_fps_ass_famas wpn_fps_ass_l85a2 wpn_fps_ass_vhs wpn_fps_ass_tecci wpn_fps_ass_corgi wpn_fps_ass_komodo wpn_fps_smg_olympic wpn_fps_smg_x_olympic wpn_fps_smg_hajk wpn_fps_smg_x_hajk wpn_fps_lmg_m249 wpn_fps_lmg_shuno"
 "762x51"="wpn_fps_ass_m14 wpn_fps_ass_scar wpn_fps_ass_galil wpn_fps_ass_contraband wpn_fps_ass_fal wpn_fps_ass_g3 wpn_fps_lmg_par wpn_fps_lmg_hk21 wpn_fps_snp_tti wpn_fps_snp_wa2000 wpn_fps_snp_model70 wpn_fps_snp_sbl"
 "762x39"="wpn_fps_ass_akm wpn_fps_ass_akm_gold wpn_fps_lmg_rpk wpn_fps_smg_akmsu wpn_fps_smg_x_akmsu"
 "545x39"="wpn_fps_ass_74 wpn_fps_ass_flint"
 "762x54r"="wpn_fps_snp_mosin wpn_fps_snp_siltstone"
 "9x39"="wpn_fps_ass_asval"
 "9x19"="wpn_fps_pis_g17 wpn_fps_pis_x_g17 wpn_fps_pis_beretta wpn_fps_x_b92fs wpn_fps_pis_g18c wpn_fps_pis_x_g18c wpn_fps_pis_g22c wpn_fps_pis_x_g22c wpn_fps_pis_g26 wpn_fps_jowi wpn_fps_pis_sparrow wpn_fps_pis_x_sparrow wpn_fps_pis_pl14 wpn_fps_pis_x_pl14 wpn_fps_pis_packrat wpn_fps_x_packrat wpn_fps_smg_mp5 wpn_fps_smg_x_mp5 wpn_fps_smg_mp9 wpn_fps_smg_x_mp9 wpn_fps_smg_m45 wpn_fps_smg_x_m45 wpn_fps_smg_tec9 wpn_fps_smg_x_tec9 wpn_fps_smg_uzi wpn_fps_smg_x_uzi wpn_fps_smg_sterling wpn_fps_smg_x_sterling wpn_fps_smg_cobray wpn_fps_smg_x_cobray wpn_fps_smg_baka wpn_fps_smg_x_baka wpn_fps_ass_sub2000 wpn_fps_smg_erma wpn_fps_smg_x_erma wpn_fps_pis_breech wpn_fps_pis_x_breech wpn_fps_pis_shrew wpn_fps_pis_x_shrew wpn_fps_pis_legacy wpn_fps_pis_x_legacy wpn_fps_pis_czech wpn_fps_pis_x_czech wpn_fps_pis_beer wpn_fps_pis_x_beer wpn_fps_smg_shepheard wpn_fps_smg_x_shepheard wpn_fps_smg_mp40 wpn_fps_smg_x_mp40 wpn_fps_pis_hs2000 wpn_fps_pis_x_hs2000 wpn_fps_pis_maxim9 wpn_fps_pis_x_maxim9 wpn_fps_pis_holt wpn_fps_pis_x_holt"
 "9x18"="wpn_fps_smg_coal wpn_fps_smg_x_coal wpn_fps_pis_stech wpn_fps_pis_x_stech"
 "45acp"="wpn_fps_pis_usp wpn_fps_pis_x_usp wpn_fps_pis_1911 wpn_fps_x_1911 wpn_fps_smg_thompson wpn_fps_smg_x_thompson wpn_fps_smg_schakal wpn_fps_smg_x_schakal wpn_fps_smg_polymer wpn_fps_smg_x_polymer wpn_fps_smg_mac10 wpn_fps_smg_x_mac10"
 "357"="wpn_fps_pis_2006m wpn_fps_pis_x_2006m"
 "762x25"="wpn_fps_pis_c96 wpn_fps_pis_x_c96 wpn_fps_pis_type54 wpn_fps_pis_x_type54"
 "127x55"="wpn_fps_pis_rsh12"
 "46x30"="wpn_fps_smg_mp7 wpn_fps_smg_x_mp7"
 "57x28"="wpn_fps_smg_p90 wpn_fps_smg_x_p90 wpn_fps_pis_lemming"
 "338"="wpn_fps_snp_msr wpn_fps_snp_r93 wpn_fps_snp_desertfox"
 "12ga"="wpn_fps_shot_r870 wpn_fps_shot_huntsman wpn_fps_shot_serbu wpn_fps_sho_striker wpn_fps_sho_ksg wpn_fps_pis_judge wpn_fps_shot_b682 wpn_fps_sho_boot wpn_fps_shot_m37 wpn_fps_sho_rota wpn_fps_sho_x_rota wpn_fps_sho_coach wpn_fps_sho_saiga wpn_fps_sho_spas12 wpn_fps_sho_aa12 wpn_fps_sho_ben wpn_fps_sho_basset"
 "23x75"="wpn_fps_shot_ks23"
}

# ---- extra weapons: Makarov/PPK/revolvers and vanilla gaps, plus custom weapons (calibers taken from the Custom Attachments mod's ammo tags).
# Ids that don't exist in the game are skipped by the hook. A weapon already listed above keeps its first caliber.
$EXTRA = [ordered]@{
 "545x39"="wpn_fps_ass_a545 wpn_fps_ass_aek971 wpn_fps_ass_ak12 wpn_fps_ass_akrocket wpn_fps_ass_fsbcustom wpn_fps_ass_sc26a wpn_fps_ass_sc30 wpn_fps_ass_tilt wpn_fps_lmg_puncle21 wpn_fps_pis_smolak wpn_fps_pis_x_smolak wpn_fps_smg_krinkov wpn_fps_smg_x_krinkov"
 "556x45"="wpn_fps_ass_acw wpn_fps_ass_acwr wpn_fps_ass_acwr2 wpn_fps_ass_adar wpn_fps_ass_ak556 wpn_fps_ass_ar160 wpn_fps_ass_ar18 wpn_fps_ass_bren2 wpn_fps_ass_c8sfw wpn_fps_ass_cinnamonroll wpn_fps_ass_coslo723 wpn_fps_ass_damsel wpn_fps_ass_dd_mk18 wpn_fps_ass_drongo wpn_fps_ass_f2000 wpn_fps_ass_flat wpn_fps_ass_fusil wpn_fps_ass_g36k wpn_fps_ass_galilace wpn_fps_ass_gameover wpn_fps_ass_gcar wpn_fps_ass_grayhound wpn_fps_ass_grotb wpn_fps_ass_hk33 wpn_fps_ass_hk416 wpn_fps_ass_hk416a5 wpn_fps_ass_hkg14976 wpn_fps_ass_hometown wpn_fps_ass_howa wpn_fps_ass_howl wpn_fps_ass_hugsforleon wpn_fps_ass_k2 wpn_fps_ass_kurisumasu wpn_fps_ass_l119a2 wpn_fps_ass_l403a1 wpn_fps_ass_lazy wpn_fps_ass_lkrifle wpn_fps_ass_m15mod0 wpn_fps_ass_m27gear wpn_fps_ass_m4_usasoc wpn_fps_ass_m416d wpn_fps_ass_m4bpre wpn_fps_ass_mike4 wpn_fps_ass_mikon wpn_fps_ass_mk18prim wpn_fps_ass_mk18s wpn_fps_ass_munmu wpn_fps_ass_noobtube_vg wpn_fps_ass_nova4 wpn_fps_ass_op68 wpn_fps_ass_qbz97b wpn_fps_ass_r6s_r4c wpn_fps_ass_rabbit wpn_fps_ass_raifu wpn_fps_ass_saigry wpn_fps_ass_scar_m203 wpn_fps_ass_scarl wpn_fps_ass_scsierra wpn_fps_ass_sg416 wpn_fps_ass_sg552 wpn_fps_ass_shieldgirl wpn_fps_ass_shitbucket wpn_fps_ass_shitbucketsec wpn_fps_ass_soppo wpn_fps_ass_sr16 wpn_fps_ass_stoy_556 wpn_fps_ass_tar21 wpn_fps_ass_tx15_mpc wpn_fps_ass_virtus wpn_fps_ass_x_hk416c wpn_fps_ass_x95 wpn_fps_ass_xm4_prim wpn_fps_ass_xm8 wpn_fps_ass_yayo wpn_fps_crb_enfieldl22 wpn_fps_lmg_beef wpn_fps_lmg_crayoneater wpn_fps_lmg_k3 wpn_fps_lmg_limamg wpn_fps_lmg_mg4 wpn_fps_lmg_mx63 wpn_fps_lmg_negev wpn_fps_lmg_scp_mg36 wpn_fps_lmg_sierrax wpn_fps_lmg_stoner63a wpn_fps_lmg_ultimax wpn_fps_lmg_ultimax100 wpn_fps_pdw_fckmyfingers wpn_fps_pis_raider wpn_fps_smg_m4cqb wpn_fps_smg_pdr wpn_fps_smg_xm4 wpn_fps_snp_b42"
 "762x39"="wpn_fps_ass_aku94 wpn_fps_ass_fakedefy wpn_fps_ass_rk62 wpn_fps_ass_sks wpn_fps_ass_skspug wpn_fps_ass_spike wpn_fps_lmg_rpd"
 "762x51"="wpn_fps_ass_br75 wpn_fps_ass_bulldoge wpn_fps_ass_fnar wpn_fps_ass_fusil_762 wpn_fps_ass_g3hk79 wpn_fps_ass_galilace762 wpn_fps_ass_l1a1 wpn_fps_ass_m14e2 wpn_fps_ass_ma40 wpn_fps_ass_mdr_308 wpn_fps_ass_mk17 wpn_fps_ass_obr7 wpn_fps_ass_owd_m1a wpn_fps_ass_recce wpn_fps_ass_rsass wpn_fps_ass_scharlie wpn_fps_ass_scharlie_sec wpn_fps_ass_sg510 wpn_fps_ass_spear308 wpn_fps_ass_vk78_commando wpn_fps_lmg_mg5 wpn_fps_lmg_sumitomo wpn_fps_lmg_volmer wpn_fps_snp_apairofmelons wpn_fps_snp_ballerina wpn_fps_snp_dvl10 wpn_fps_snp_kissesforleon wpn_fps_snp_kozak wpn_fps_snp_leet wpn_fps_snp_psg1 wpn_fps_snp_reachdmr wpn_fps_snp_sr25 wpn_fps_snp_t1000x5 wpn_fps_snp_wargoddess wpn_fps_snp_xm21 wpn_fps_snp_victor wpn_fps_lmg_mg42"
 "9x39"="wpn_fps_ass_nightgoddess wpn_fps_ass_ots_14_4a wpn_fps_ass_sr3m wpn_fps_ass_stealthy wpn_fps_ass_vsk94 wpn_fps_snp_vss"
 "9x19"="wpn_fps_ass_r0991 wpn_fps_mp_master wpn_fps_mp_peepee wpn_fps_pis_accushadow2 wpn_fps_pis_aps wpn_fps_pis_axewscope wpn_fps_pis_b93r wpn_fps_pis_cz wpn_fps_pis_cz75b wpn_fps_pis_czauto wpn_fps_pis_glawk wpn_fps_pis_grach wpn_fps_pis_gsh18 wpn_fps_pis_hipower wpn_fps_pis_hpb wpn_fps_pis_k5 wpn_fps_pis_lele wpn_fps_pis_m92fs wpn_fps_pis_m9butcool wpn_fps_pis_mp443 wpn_fps_pis_p80 wpn_fps_pis_p99 wpn_fps_pis_pkpsd9 wpn_fps_pis_rally wpn_fps_pis_rc_auto9 wpn_fps_pis_rusglock wpn_fps_pis_sammy wpn_fps_pis_sw659 wpn_fps_pis_tariq wpn_fps_pis_vp70 wpn_fps_pis_welrod wpn_fps_pis_wes92se wpn_fps_pis_x_cz wpn_fps_pis_x_cz75b wpn_fps_pis_x_czauto wpn_fps_pis_x_luger wpn_fps_pis_x_m92fs wpn_fps_pis_x_sw659 wpn_fps_pis_x_vp70 wpn_fps_smg_ak5s wpn_fps_smg_car9 wpn_fps_smg_cbjms wpn_fps_smg_chang6 wpn_fps_smg_czevo wpn_fps_smg_evo wpn_fps_smg_fikpc9 wpn_fps_smg_fmgnine wpn_fps_smg_glau wpn_fps_smg_js2 wpn_fps_smg_kurz_919 wpn_fps_smg_lugerwth wpn_fps_smg_m38a wpn_fps_smg_minebea wpn_fps_smg_mpapa5 wpn_fps_smg_mpx wpn_fps_smg_nya wpn_fps_smg_owen wpn_fps_smg_ppk20 wpn_fps_smg_secho wpn_fps_smg_secho_prim wpn_fps_smg_slap_919 wpn_fps_smg_spectre_m4 wpn_fps_smg_storm wpn_fps_smg_stoy_919 wpn_fps_smg_tribune32 wpn_fps_smg_tti_mpx wpn_fps_smg_x_car9 wpn_fps_smg_x_czevo wpn_fps_smg_x_fmgnine wpn_fps_smg_x_kafkamps wpn_fps_smg_x_minebea wpn_fps_smg_x_nya wpn_fps_smg_x_spectre_m4 wpn_fps_smg_x_tribune32 wpn_fps_x_gsh18 wpn_fps_smg_sr2 wpn_fps_smg_x_sr2 wpn_fps_pis_b92fs wpn_fps_pis_x_b92fs"
 "762x54r"="wpn_fps_lmg_dp28 wpn_fps_lmg_fg42 wpn_fps_lmg_mg34 wpn_fps_lmg_pecheneg wpn_fps_snp_fyjs wpn_fps_snp_g43 wpn_fps_snp_heartpiercer wpn_fps_snp_sv98 wpn_fps_snp_svd wpn_fps_snp_svu wpn_fps_snp_tkpd"
 "9x18"="wpn_fps_pis_pm wpn_fps_pis_seburo wpn_fps_pis_x_pm wpn_fps_pis_x_seburo wpn_fps_pis_xs_pm wpn_fps_pis_ppk wpn_fps_pis_x_ppk wpn_fps_x_ppk wpn_fps_smg_scorpion wpn_fps_smg_x_scorpion"
 "12ga"="wpn_fps_pis_toz81 wpn_fps_sho_bp12 wpn_fps_sho_dp12 wpn_fps_sho_haymaker wpn_fps_sho_usas12 wpn_fps_shot_aalpha12 wpn_fps_shot_ak12_76 wpn_fps_shot_akita wpn_fps_shot_amr12 wpn_fps_shot_auto5 wpn_fps_shot_beck wpn_fps_shot_candy wpn_fps_shot_dokkasho wpn_fps_shot_doot_eternal_shotgun wpn_fps_shot_f500 wpn_fps_shot_fpsix wpn_fps_shot_hawk12 wpn_fps_shot_m1216 wpn_fps_shot_mossberg590 wpn_fps_shot_mp153 wpn_fps_shot_mts255 wpn_fps_shot_novas wpn_fps_shot_prison wpn_fps_shot_qbs wpn_fps_shot_r870sawed wpn_fps_shot_romeo870 wpn_fps_shot_romeo870_sec wpn_fps_shot_s_mts255 wpn_fps_shot_sideload wpn_fps_shot_stf12 wpn_fps_shot_techno wpn_fps_shot_thorhammer wpn_fps_shot_toz106 wpn_fps_shot_toz194 wpn_fps_shot_toz66 wpn_fps_shot_trench wpn_fps_shot_tti_benelli_m2 wpn_fps_shot_tti_dracarys wpn_fps_shot_uncle12 wpn_fps_shot_vecho wpn_fps_shot_vepr12 wpn_fps_shot_x_aa12 wpn_fps_shot_x_akita wpn_fps_shot_x_mts255 wpn_fps_shot_x_striker wpn_fps_shot_x_techno"
 "338"="wpn_fps_snp_carpet wpn_fps_snp_hecate wpn_fps_snp_tac50"
 "357"="wpn_fps_snp_m1894 wpn_fps_snp_sbeta wpn_fps_pis_deagle wpn_fps_pis_x_deagle wpn_fps_x_deagle wpn_fps_pis_rage wpn_fps_pis_x_rage wpn_fps_x_rage wpn_fps_pis_chinchilla wpn_fps_pis_x_chinchilla wpn_fps_pis_rhino wpn_fps_pis_x_rhino wpn_fps_pis_sw27"
 "45acp"="wpn_fps_pis_peacemaker wpn_fps_pis_x_peacemaker wpn_fps_x_peacemaker wpn_fps_pis_fp45"
}
$seenW = @{}; foreach($k in $WEAPONS.Keys){ foreach($w in ($WEAPONS[$k] -split ' ')){ $seenW[$w] = $true } }
foreach($k in $EXTRA.Keys){
  $add = @($EXTRA[$k] -split ' ' | ?{ $_ -and -not $seenW[$_] })
  foreach($w in $add){ $seenW[$w] = $true }
  if($WEAPONS.Contains($k)){ $WEAPONS[$k] += ' ' + ($add -join ' ') } else { $WEAPONS[$k] = $add -join ' ' }
}

# ---- vanilla weapons by short id (the part after wpn_fps_<type>_). The hook resolves every factory id whose short id
# matches (also x_ akimbo variants), so the type prefix doesn't have to be right. Short ids come from the real-weapon-names list.
$SHORT = [ordered]@{
 "556x45"="m4 m16 amcar aug g36 s552 famas l85a2 vhs tecci corgi komodo olympic hajk m249 qbu88 m4_secondary"
 "762x51"="m14 scar galil fal g3 par hk21 tti contraband wa2000 model70 sbl r700 ching hk51b mg42 scout awp victor tkb hcar"
 "762x39"="akm akm_gold rpk akmsu"
 "545x39"="ak74 ak12 flint"
 "762x54r"="mosin siltstone"
 "9x39"="asval groza shak12"
 "9x19"="glock_17 g17 g22c glock_18c g18c g26 jowi b92fs hs2000 packrat sparrow pl14 breech legacy beer czech holt maxim9 p226 sub2000 mp5 mp9 tec9 uzi baka sterling cobray erma m45 shepheard sr2 vityaz pm9 fmg9 welrod"
 "9x18"="pmm ppk stech coal scorpion"
 "45acp"="usp colt_1911 m1911 1911 mac10 m1928 thompson schakal polymer shrew peacemaker model3"
 "357"="mateba 2006m raging_bull rage deagle chinchilla korth"
 "762x25"="c96 type54"
 "127x55"="rsh12"
 "46x30"="mp7"
 "57x28"="p90 lemming"
 "338"="msr r93 desertfox m95"
 "12ga"="spas12 b682 r870 saiga huntsman benelli ksg aa12 boot rota serbu striker m37 basset coach m1897 m590 judge supernova sko12 ultima bleckert"
 "23x75"="ks23"
}

# ---- calibers that reuse the guns of another group: new = @{from=<group>; only=<id substrings>; skip=<id substrings>}
# A gun keeps its own group's ammo and also gets these. No "only" means every gun of the source group.
$ALSO = [ordered]@{
 "300blk"  = @{from="556x45"; skip="_lmg_"}
 "58x42"   = @{from="556x45"; only="qbu88 qbz"}
 "366tkm"  = @{from="762x39"; skip="_lmg_"}
 "68x51"   = @{from="762x51"; skip="_lmg_ _snp_"}
 "93x64"   = @{from="762x54r"; skip="_lmg_"}
 "9x21"    = @{from="9x19"; only="_pis_ sr2 vityaz"}
 "50ae"    = @{from="357"; only="deagle"}
 "50bmg"   = @{from="338"; only="m95 hecate tac50"}
 "127x108" = @{from="338"; only="m95 hecate tac50"}
 "20ga"    = @{from="12ga"}
}

function Clamp($v,$lo,$hi){ [math]::Max($lo,[math]::Min($hi,$v)) }
function Tier($pen,$ball){ $rel=$pen-$ball; $i=0; foreach($lim in 3,10,17,23,31){ if($rel -lt $lim){ return $i }; $i++ }; return 5 }
function N($v){ if($v -is [bool]){ return $v.ToString().ToLower() }; if($v -is [string]){ return $v }; return ([double]$v).ToString($inv) }
function KV($h){ ($h.Keys | %{ '{0}="{1}"' -f $_, (N $h[$_]) }) -join ' ' }
function Esc($s){ [Security.SecurityElement]::Escape($s) }

$partsXml = New-Object System.Collections.ArrayList
$loc = [ordered]@{}
$iconMap = [ordered]@{}
$luaAmmo = [ordered]@{}
$luaPickup = [ordered]@{}

function Emit($calid,$key,$name,$stats,$cs,$fire,$subtype,$icon,$desc,$pickup){
  $pid_ = "{0}eft_{1}_{2}" -f $P,$calid,$key
  # damage boost: flat +4, plus 25% of any positive value, capped at 45
  $d0 = if($stats.Contains("damage")){ [int]$stats.damage } else { 0 }
  $stats.damage = [int][math]::Min(45, $d0 + 4 + [math]::Round([math]::Max($d0,0) * 0.25))
  $label = "{0} {1}" -f $CAL[$calid].label,$name
  $csx = "<custom_stats $(KV $cs)"
  if($fire){ $csx += ">`n`t`t`t<fire_dot_data $(KV $fire)/>`n`t`t</custom_stats>" } else { $csx += "/>" }
  [void]$partsXml.Add("`t<!-- $(Esc $label) -->`n`t<WeaponMod id=`"$pid_`" based_on=`"wpn_fps_upg_a_custom_free`" type=`"ammo`" has_description=`"true`" sub_type=`"$subtype`" unit=`"units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy`" drop=`"false`" texture_bundle_folder=`"mods`" is_a_unlockable=`"true`">`n`t`t<stats $(KV $stats)/>`n`t`t$csx`n`t`t<pcs/>`n`t</WeaponMod>`n")
  $loc["bm_wp_$pid_"] = $label
  $loc["bm_wp_${pid_}_desc"] = $desc
  $iconMap[$pid_] = $icon
  if(-not $luaAmmo.Contains($calid)){ $luaAmmo[$calid] = New-Object System.Collections.ArrayList }
  [void]$luaAmmo[$calid].Add($pid_)
  if($pickup){ $luaPickup[$pid_] = $pickup }
}

foreach($r in $R){
  $c = $CAL[$r.cal]; $tags = $r.tags
  $dmg = [int](Clamp ([math]::Round(($r.d / $c.base - 1) * $c.scale)) -15 20)
  if($tags -contains "frag"){ $dmg += 4 }
  $t = if($tags -contains "hp"){ 0 } else { Tier $r.p $c.ball }
  $stats = [ordered]@{}
  $ammo = -($(if($t -lt 5){$t}else{6})) - $(if($dmg -ge 15){1}else{0}) + $(if($dmg -le -8){1}else{0}) + $(if($tags -contains "fmj"){1}else{0})
  if($ammo){ $stats.total_ammo_mod = $ammo }
  if($dmg){ $stats.damage = $dmg }
  $spread = [int](Clamp (([math]::Round($r.acc / 4)) + $(if($t -ge 3){2}else{0})) -8 8)
  $recoil = [int](Clamp (-([math]::Round($r.rec / 4))) -8 8)
  if($tags -contains "sub"){ $stats.alert_size = 9; $stats.suppression = 4 }
  if($spread){ $stats.spread = $spread }
  if($recoil){ $stats.recoil = $recoil }
  $cs = [ordered]@{}
  $cs.armor_piercing_add = $(if($t -eq 0){0}elseif($t -eq 1){0.49}else{1})
  $cs.can_shoot_through_enemy = ($t -ge 3)
  $cs.can_shoot_through_shield = ($t -ge 4)
  $cs.can_shoot_through_wall = ($t -ge 5)
  $mul = @(1.0,0.85,0.65,0.5,0.35,0.25)[$t]
  if($dmg -ge 15){ $mul = [math]::Round($mul*0.9,2) }
  $cs.ammo_pickup_min_mul = $mul
  $cs.ammo_pickup_max_mul = $mul
  $fire = $null
  if($tags -contains "inc"){ $fire = [ordered]@{dot_trigger_chance=35;dot_damage=6;dot_length=3;dot_trigger_max_distance=60000;dot_tick_period=0.5} }
  elseif($tags -contains "tracer"){ $fire = [ordered]@{dot_trigger_chance=8;dot_damage=4;dot_length=3;dot_trigger_max_distance=11500;dot_tick_period=0.5} }
  if($fire){ $cs.bullet_class = "FlameBulletBase" }
  $role = if($tags -contains "inc"){"inc"}elseif($tags -contains "tracer"){"tracer"}elseif($tags -contains "sub"){"sub"}elseif($tags -contains "frag"){"frag"}elseif($tags -contains "hp"){"hp"}elseif($t -ge 3){"ap"}else{"fmj"}
  $subtype = if($fire){"ammo_dragons_breath"}else{"ammo_slug"}
  $bits = @()
  if($tags -contains "sub"){ $bits += "Subsonic: quieter, smaller alert radius" }
  if($tags -contains "inc"){ $bits += "Incendiary: good chance to ignite enemies" } elseif($tags -contains "tracer"){ $bits += "Tracer: small chance to ignite enemies" }
  if($tags -contains "frag"){ $bits += "Fragments on impact" }
  if($tags -contains "hp"){ $bits += "Expanding bullet, extra flesh damage, no penetration" }
  else { $bits += @("No armor penetration","Partially pierces body armor","Pierces body armor","Pierces body armor and enemies","Pierces armor, enemies and shields","Pierces armor, enemies, shields and walls")[$t] }
  $bits += "EFT: $($r.d) dmg / $($r.p) pen"
  Emit $r.cal $r.key $r.name $stats $cs $fire $subtype $ICONS[$r.cal][$role] (($bits -join ". ") + ".") $null
}
foreach($s in $SG){
  $cs = $s.cs
  if(-not $cs.Contains("armor_piercing_add")){ $cs.armor_piercing_add = 0 }
  foreach($f in "can_shoot_through_enemy","can_shoot_through_shield","can_shoot_through_wall"){ if(-not $cs.Contains($f)){ $cs[$f] = $false } }
  Emit $s.cal $s.key $s.name $s.stats $cs $s.fire $s.subtype $s.icon $s.desc $null
}

# ---- write main.xml
$xml = New-Object System.Collections.ArrayList
[void]$xml.Add('<table name="EFTAmmoTypes">')
[void]$xml.Add("`t<Localization directory=`"Localization`" default=`"english.txt`">`n`t</Localization>`n")
$partsXml | %{ [void]$xml.Add($_) }
[void]$xml.Add("`t<AddFiles directory=`"assets`">")
foreach($id in $iconMap.Keys){ [void]$xml.Add("`t`t<texture path=`"guis/dlcs/mods/textures/pd2/blackmarket/icons/mods/$id`"/>") }
[void]$xml.Add("`t</AddFiles>`n")
[void]$xml.Add("`t<Hooks directory=`"Hooks`">`n`t`t<hook file=`"weaponfactorytweakdata.lua`" source_file=`"lib/tweak_data/weaponfactorytweakdata`"/>`n`t</Hooks>`n</table>`n")
New-Item -ItemType Directory -Force "$Dst/Localization","$Dst/Hooks","$Dst/$ICON_REL" | Out-Null
[IO.File]::WriteAllText("$Dst/main.xml", ($xml -join "`n"), $utf8)

# ---- localization (valid JSON)
$loc["bm_menu_eft_note"] = "Escape from Tarkov ammo"
$json = "{`n" + (($loc.Keys | %{ ' {0} : {1}' -f (ConvertTo-Json $_ -Compress), (ConvertTo-Json $loc[$_] -Compress) }) -join ",`n") + "`n}`n"
[IO.File]::WriteAllText("$Dst/Localization/english.txt", $json, $utf8)

# ---- placeholder icons
$missing = @()
foreach($id in $iconMap.Keys){
  $f = "$Src/$ICON_REL/$P$($iconMap[$id]).texture"
  if(Test-Path $f){ Copy-Item $f "$Dst/$ICON_REL/$id.texture" -Force } else { $missing += "$id <- $($iconMap[$id])" }
}
"missing icons: $($missing -join '; ')"

# ---- lua hook
function LL($items){ ($items | %{ "`t`t`"$_`"" }) -join ",`n" }
$lua = New-Object System.Collections.ArrayList
[void]$lua.Add("-- GENERATED by gen_eft.ps1. Rebalance in main.xml (stats) or the tables below (weapon lists).`nlocal EFT_WEAPONS = {")
foreach($k in $WEAPONS.Keys){ [void]$lua.Add("`t[`"$k`"] = {`n$(LL ($WEAPONS[$k] -split ' '))`n`t},") }
[void]$lua.Add("}`n`nlocal EFT_SHORT = {")
foreach($k in $SHORT.Keys){ [void]$lua.Add("`t[`"$k`"] = {`n$(LL ($SHORT[$k] -split ' '))`n`t},") }
[void]$lua.Add("}`n`nlocal EFT_AMMO = {")
foreach($k in $luaAmmo.Keys){ [void]$lua.Add("`t[`"$k`"] = {`n$(LL $luaAmmo[$k])`n`t},") }
[void]$lua.Add("}`n`nlocal EFT_ALSO = {")
foreach($k in $ALSO.Keys){ $a = $ALSO[$k]; $o = if($a.only){ ", only = {" + ((($a.only -split " ") | %{ "`"$_`"" }) -join ", ") + "}" } else { "" }; $s = if($a.skip){ ", skip = {" + ((($a.skip -split " ") | %{ "`"$_`"" }) -join ", ") + "}" } else { "" }; [void]$lua.Add("`t[`"$k`"] = {from = `"$($a.from)`"$o$s},") }
[void]$lua.Add("}`n`nlocal EFT_SHOTGUN = {[`"12ga`"] = true, [`"20ga`"] = true, [`"23x75`"] = true}`n")
[void]$lua.Add([IO.File]::ReadAllText("$PSScriptRoot/eft_hook_template.lua"))
[IO.File]::WriteAllText("$Dst/Hooks/weaponfactorytweakdata.lua", ($lua -join "`n"), $utf8)
"ammo types: $($iconMap.Count)"
