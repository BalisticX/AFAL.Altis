/*
	File: fn_gunShop_inventory.sqf
	Author: Ballistic
	
	Description:
	Function for determining the available weapons for the gun shops for After Altis
	
	Paramters:
	0: STRING Type of gun shop. Civ, police, blackmarket etc
	
	Returns:
	ARRAY Available weapons depending on shop type
*/

private ["_type","_array"];

_type = [ _this, 0, "", [""]] call BIS_fnc_param;

_array = [];

switch (_type) do {
	
	case "Civ" : {
		_array = _array + [
			[ "P-07", 2500, "hgun_P07_F", "$2500", "\A3\weapons_F\Pistols\P07\data\UI\gear_p07_x_ca.paa"],
			[ "Zubr", 3700, "hgun_Pistol_heavy_02_F", "$3700", "\A3\Weapons_F_EPA\Pistols\Pistol_Heavy_02\data\UI\gear_Pistol_heavy_02_X_CA.paa"],
			[ "ACP-C2", 4200, "hgun_ACPC2_F", "$4200", "\A3\Weapons_F_Beta\Pistols\ACPC2\Data\UI\gear_Acpc2_X_CA.paa"],
			[ "4-five .45", 4500, "hgun_Pistol_heavy_01_F", "$4500", "\A3\Weapons_F_EPA\Pistols\Pistol_Heavy_01\data\UI\gear_pistol_heavy_01_X_ca.paa"],
			["PDW 2000", 22250, "hgun_PDW2000_F", "$22250", "\A3\Weapons_F_gamma\Smgs\pdw2000\data\UI\gear_pdw2X_X_CA.paa"]
		];
		if (side player == west) then {
			_array = _array + [
			["Vermin SMG", 25500, "SMG_01_F", "$25500", "\A3\Weapons_F_beta\Smgs\SMG_01\data\UI\gear_SMG_01_X_CA.paa"],
			["MX Carbine", 28500, "arifle_MXC_F", "$28500", "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_cqc_X_CA.paa"],
			["MX Rifle", 30000, "arifle_MX_F", "$30000", "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_rifle_X_CA.paa"]
			];
		};
	};
	
	case "Blackmarket" : {
		_array = _array + [
			[ "P-07", 2000, "hgun_P07_F", "16Rnd 9x21mm", "\A3\weapons_F\Pistols\P07\data\UI\gear_p07_x_ca.paa"],
			[ "Zubr", 3700, "hgun_Pistol_heavy_02_F", "6Rnd .45 ACP", "\A3\Weapons_F_EPA\Pistols\Pistol_Heavy_02\data\UI\gear_Pistol_heavy_02_X_CA.paa"],
			[ "ACP-C2", 4100, "hgun_ACPC2_F", "9Rnd .45 ACP", "\A3\Weapons_F_Beta\Pistols\ACPC2\Data\UI\gear_Acpc2_X_CA.paa"],
			["Sting SMG", 24500, "SMG_02_F", "30Rnd 9x21mm"],
			["TRG-20", 32000, "arifle_TRG20_F", "30Rnd 5.56x45mm"],
			["TRG-21", 33500, "arifle_TRG21_F", "30Rnd 5.56x45mm"],
			["Mk.20 Carbine", 29500, "arifle_Mk20C_F", "30Rnd 5.56x45mm"],
			["Mk.20 Rifle", 31500, "arifle_Mk20_F", "30Rnd 5.56x45mm"],
		];
		if (side player == east) then {
			_array = _array + [
				["TRG-21 UGL", 40000, "arifle_TRG21_GL_F", "30Rnd 5.56x45mm + 40mm"],
				["Mk.20 UGL", 36000, "arifle_Mk20_GL_F", "30Rnd 5.56x45mm + 40mm"]
				["Katiba Carbine", 28500, "arifle_Katiba_C_F", "30Rnd 6.5x39mm"],
				["Katiba Rifle", 30000, "arifle_Katiba_F", "30Rnd 6.5x39mm"],
				["Katiba UGL", 35000, "arifle_Katiba_GL_F", "30Rnd 6.5x39mm + 40mm"],
				["Rahim DMR", 74550, "srifle_DMR_01_F", "7.65x51mm"],
				["GM6 Lynx", 125750, "srifle_GM6_SOS_F", "12.7x108mm", "\A3\weapons_F\longrangerifles\GM6\data\UI\gear_gm6_X_CA.paa"],
				["RPG-42", 110250, "launch_RPG32_F", "RPG-HE", "\A3\weapons_F\launchers\rpg32\data\UI\gear_rpg32_X_CA.paa"]
			];
		};
	};
	
	case "Police" : {
		_array = _array + [
			["Taser Pistol", 3000, "hgun_Rook40_snds_F", "$3000", "tazer.paa"],
			["4-five .45", 4500, "hgun_Pistol_heavy_01_F", "$4500", "\A3\Weapons_F_EPA\Pistols\Pistol_Heavy_01\data\UI\gear_pistol_heavy_01_X_ca.paa"],
			["Vermin SMG", 25500, "SMG_01_F", "$25500", "\A3\Weapons_F_beta\Smgs\SMG_01\data\UI\gear_SMG_01_X_CA.paa"],
			["MX Carbine", 28500, "arifle_MXC_F", "$28500", "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_cqc_X_CA.paa"],
			["MX Rifle", 30000, "arifle_MX_F", "$30000", "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_rifle_X_CA.paa"],
			["MX UGL", 35000, "arifle_MX_GL_F", "$35000", "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_rifle_gl_X_CA.paa"],
			["MX Marksman", 40000, "arifle_MXM_F", "$40000", "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_dmr_X_CA.paa"],
			["MX LMG", 42000, "arifle_MX_SW_F", "$42000", "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_lmg_X_CA.paa"],
			["Mk.18 ABR", 75550, "srifle_EBR_F", "$75550", "\A3\weapons_F\longrangerifles\ebr\data\UI\gear_ebr_X_CA.paa"],
			["M320 LRR", 150500, "srifle_LRR_F", "$150500", "\A3\weapons_F\longrangerifles\M320\data\UI\gear_m320_lrr_X_CA.paa"]
		];
	};
};

_array;
