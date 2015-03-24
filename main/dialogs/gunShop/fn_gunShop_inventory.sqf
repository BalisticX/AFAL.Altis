/*
	File: fn_gunShop_inventory.sqf
	Author: Ballistic
	
	Description:
	Function for determining the available weapons for the gun shops for After Altis
	
	Paramters:
	0: STRING Type of gun shop
	
	Returns:
	ARRAY Available weapons and information
*/

private ["_type","_array"];

_type = [ _this, 0, "", [""]] call BIS_fnc_param;
	if (_type == "") exitWith {};

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
		if (	side player == west		) then {
			_array = _array + [
				["Vermin SMG", 25500, "SMG_01_F", "$25500", "\A3\Weapons_F_beta\Smgs\SMG_01\data\UI\gear_SMG_01_X_CA.paa"],
				["MX Carbine", 28500, "arifle_MXC_F", "$28500", "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_cqc_X_CA.paa"],
				["MX Rifle", 30000, "arifle_MX_F", "$30000", "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_rifle_X_CA.paa"]
			];
		};
	};
	case "Illegal" : {
		_array = _array + [
			[ "P-07", 2000, "hgun_P07_F", "$2300", "\A3\weapons_F\Pistols\P07\data\UI\gear_p07_x_ca.paa"],
			[ "Zubr", 3700, "hgun_Pistol_heavy_02_F", "$3600", "\A3\Weapons_F_EPA\Pistols\Pistol_Heavy_02\data\UI\gear_Pistol_heavy_02_X_CA.paa"],
			[ "ACP-C2", 4100, "hgun_ACPC2_F", "$4100", "\A3\Weapons_F_Beta\Pistols\ACPC2\Data\UI\gear_Acpc2_X_CA.paa"],
			["Sting SMG", 24500, "SMG_02_F", "$24500", "\A3\Weapons_F_beta\Smgs\SMG_02\Data\UI\gear_smg_02_X_CA.paa"],
			["TRG-20", 32000, "arifle_TRG20_F", "$32000", "\A3\weapons_F\Rifles\Trg20\Data\UI\gear_TRG20_X_CA.paa"],
			["TRG-21", 33500, "arifle_TRG21_F", "$33500", "\A3\weapons_F\Rifles\Trg20\Data\UI\gear_TRG21_X_CA.paa"],
			["TRG-21 UGL", 40000, "arifle_TRG21_GL_F", "$40000", "\A3\weapons_F\Rifles\Trg20\Data\UI\gear_TRG21_X_CA.paa"],
			["Mk.20 Carbine", 29500, "arifle_Mk20C_plain_F", "$29500", "\A3\Weapons_F_beta\Rifles\MK20\Data\UI\gear_Mk20_C_X_CA.paa"],
			["Mk.20 Rifle", 31500, "arifle_Mk20_plain_F", "$31500", "\A3\Weapons_F_beta\Rifles\MK20\Data\UI\gear_Mk20_X_CA.paa"],
			["Mk.20 UGL", 38500, "arifle_Mk20_GL_plain_F", "$38500", "\A3\Weapons_F_beta\Rifles\MK20\Data\UI\gear_Mk20_X_CA.paa"]
		];
		if (	side player == east		) then {
			_array = _array + [
				["Katiba Carbine", 28500, "arifle_Katiba_C_F", "$28500", "\A3\weapons_F\Rifles\Khaybar\Data\UI\gear_KhaybarC_X_CA.paa"],
				["Katiba Rifle", 30000, "arifle_Katiba_F", "$30000", "\A3\weapons_F\Rifles\Khaybar\Data\UI\gear_Khaybar_X_CA.paa"],
				["Katiba UGL", 37500, "arifle_Katiba_GL_F", "$37500", "\A3\weapons_F\Rifles\Khaybar\Data\UI\gear_Khaybar_X_CA.paa"],
				["Zafir", 68750, "LMG_Zafir_F", "$58750", "\A3\Weapons_F_Beta\Machineguns\Zafir\Data\UI\gear_Zafir_X_CA.paa"],
				["Rahim DMR", 74550, "srifle_DMR_01_F", "$74550", "\A3\Weapons_F_EPA\LongRangeRifles\DMR_01\Data\UI\gear_DMR_01_X_CA.paa"],
				["GM6 Lynx", 125750, "srifle_GM6_F", "$125750", "\A3\weapons_F\longrangerifles\GM6\data\UI\gear_gm6_X_CA.paa"],
				["RPG-42", 110250, "launch_RPG32_F", "$110250", "\A3\weapons_F\launchers\rpg32\data\UI\gear_rpg32_X_CA.paa"]
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
			["MX UGL", 38000, "arifle_MX_GL_F", "$38000", "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_rifle_X_CA.paa"],
			["MX Marksman", 40000, "arifle_MXM_F", "$40000", "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_dmr_X_CA.paa"],
			["MX LMG", 42000, "arifle_MX_SW_F", "$42000", "\A3\weapons_F\Rifles\MX\data\UI\gear_mx_lmg_X_CA.paa"],
			["Mk. 2000", 63500, "LMG_Mk200_F", "$53500", "\A3\weapons_F\Machineguns\M200\Data\UI\gear_m200_X_CA.paa"],
			["Mk.18 ABR", 75550, "srifle_EBR_F", "$75550", "\A3\weapons_F\longrangerifles\ebr\data\UI\gear_ebr_X_CA.paa"],
			["M320 LRR", 150500, "srifle_LRR_F", "$150500", "\A3\weapons_F\longrangerifles\M320\data\UI\gear_m320_lrr_X_CA.paa"]
		];
	};
};

_array
