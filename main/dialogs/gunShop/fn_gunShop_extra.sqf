/*
	File: fn_gunShop_extra.sqf
	Author: Ballistic
	
	Description:
	Function for determining the available mags and attachments at the gun shops for After Altis
	
	Parameters:
	0: STRING classname of selected gun
	
	Returns :
	ARRAY Available magazine is always select 0, then attachments starting with suppressor, accessory lastly optics.
*/

private ["_gunClass","_extras"];

_gunClass = [ _this, 0, "", [""]] call BIS_fnc_param;

if (_gunClass == "") exitWith {};

_extras = [];

switch (_gunClass) do {
	
	case "hgun_P07_F" : {
		_extras = [
			["16Rnd 9x21mm", 800, "16Rnd_9x21_Mag", "$800", "\A3\weapons_F\data\UI\m_16rnd_9x21_CA.paa"],
			["Suppressor 9mm", 1600, "muzzle_snds_L", "$1600", "\A3\weapons_F\data\UI\gear_acca_snds_l_CA.paa"]	
		];
	};
	
	/// This part is neat. Wish I could do it for the player's inventory ////
	
	case "hgun_Rook40_snds_F" : {
		_extras = [
			["Tazer Battery", 0, "16Rnd_9x21_Mag", "Only need one", "\A3\Weapons_F\Data\UI\M_battery_CA.paa"]
		];
	};
	
	case "hgun_Pistol_heavy_02_F" : {
		_extras = [
			["6Rnd .45 ACP", 1200, "6Rnd_45ACP_Cylinder", "$1200", "\A3\Weapons_F_EPA\Data\ui\M_6Rnd_revolver_CA.paa"],
			["Yorris J2 1x", 2400, "optic_Yorris", "$2400", "\A3\Weapons_F_EPA\Acc\data\UI\gear_acco_yorris_CA.paa"]
		];
	};
	
	case "hgun_ACPC2_F" : {
		_extras = [ 
			["9Rnd .45 ACP", 1400, "9Rnd_45ACP_Mag", "$1400", "\A3\Weapons_F\Data\ui\m_7rnd_127x33_CA"],
			["Suppressor .45", 2500, "muzzle_snds_acp", "$2500", "\A3\weapons_F\data\UI\gear_acca_snds_l_CA.paa"]
		];
	};

	case "hgun_Pistol_heavy_01_F" : {
		_extras = [ 
			["11Rnd .45 ACP", 1600, "11Rnd_45ACP_Mag", "$1600", "\A3\weapons_F\data\UI\m_16rnd_9x21_CA.paa"],
			["Suppressor .45", 2500, "muzzle_snds_acp", "$2500", "\A3\weapons_F\data\UI\gear_acca_snds_l_CA.paa"],
			["MRD 1x", 2800, "optic_MRD", "$2800", "\A3\Weapons_F_EPA\Acc\data\UI\gear_acco_MRD_CA.paa"]
		];
	};
	
	case "hgun_PDW2000_F" : {
		_extras = [
			["30Rnd 9x21mm", 3500, "30Rnd_9x21_Mag", "$3500", "\A3\weapons_F\data\UI\m_30rnd_9x21_CA.paa"],
			["Suppressor 9mm", 4800, "muzzle_snds_L", "$4800", "\A3\weapons_F\data\UI\gear_acca_snds_l_CA.paa"],
			["SMG ACO Red", 5550, "optic_Aco_smg", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["SMG ACO Green", 5550, "optic_Aco_grn_smg", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["SMG Holosight", 6000, "optic_Holosight_smg", "$6000", "\A3\weapons_F\data\UI\gear_acco_eotxps3_CA.paa"]
		];	
	};
	
	case "SMG_01_F" : {
		_extras = [
			["30Rnd .45 ACP", 3750, "30Rnd_45ACP_Mag_SMG_01", "$3750", "\A3\weapons_F\data\UI\m_30rnd_45acp_CA.paa"],
			["Suppressor .45", 4950, "muzzle_snds_acp", "$2500", "\A3\weapons_F\data\UI\gear_acca_snds_l_CA.paa"],
			["Flashlight", 7500, "acc_flashlight", "$7500", "\A3\weapons_F\data\UI\gear_accv_flashlight_CA.paa"],
			["IR Laser", 7500, "acc_pointer_IR", "$7500", "\A3\weapons_F\data\UI\gear_accv_pointer_CA.paa"],
			["SMG ACO Red", 5550, "optic_Aco_smg", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["SMG ACO Green", 5550, "optic_Aco_grn_smg", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["SMG Holosight", 6000, "optic_Holosight_smg", "$6000", "\A3\weapons_F\data\UI\gear_acco_eotxps3_CA.paa"]
		];
	};
	
	case "SMG_02_F" : {
		_extras = [
			["30Rnd 9x21mm", 3500, "30Rnd_9x21_Mag", "$3500", "\A3\weapons_F\data\UI\m_30rnd_9x21_CA.paa"],
			["Suppressor 9mm", 4800, "muzzle_snds_L", "$4800", "\A3\weapons_F\data\UI\gear_acca_snds_l_CA.paa"],
			["Flashlight", 7500, "acc_flashlight", "$7500", "\A3\weapons_F\data\UI\gear_accv_flashlight_CA.paa"],
			["IR Laser", 7500, "acc_pointer_IR", "$7500", "\A3\weapons_F\data\UI\gear_accv_pointer_CA.paa"],
			["SMG ACO Red", 5550, "optic_Aco_smg", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["SMG ACO Green", 5550, "optic_Aco_grn_smg", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["SMG Holosight", 6000, "optic_Holosight_smg", "$6000", "\A3\weapons_F\data\UI\gear_acco_eotxps3_CA.paa"]
		];
	};
	
	case "arifle_MXC_F" : {
		_extras = [ 
			["30Rnd 6.5x39mm", 5000, "30Rnd_65x39_caseless_mag", "$5000", "\A3\weapons_F\data\UI\m_30stanag_caseless_CA.paa"],
			["Suppressor 6.5mm", 9500, "muzzle_snds_H", "$4800", "\A3\weapons_F\data\UI\gear_acca_snds_h_CA.paa"],
			["Flashlight", 7500, "acc_flashlight", "$7500", "\A3\weapons_F\data\UI\gear_accv_flashlight_CA.paa"],
			["IR Laser", 7500, "acc_pointer_IR", "$7500", "\A3\weapons_F\data\UI\gear_accv_pointer_CA.paa"],
			["ACO Red", 5550, "optic_Aco", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["ACO Green", 5550, "optic_Aco_grn", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["Holosight", 6000, "optic_Holosight", "$6000", "\A3\weapons_F\data\UI\gear_acco_eotxps3_CA.paa"]
		];
	};
	
	case "arifle_MX_F" : {
		_extras = [ 
			["30Rnd 6.5x39mm", 5000, "30Rnd_65x39_caseless_mag", "$5000", "\A3\weapons_F\data\UI\m_30stanag_caseless_CA.paa"],
			["Suppressor 6.5mm", 9500, "muzzle_snds_H", "$4800", "\A3\weapons_F\data\UI\gear_acca_snds_h_CA.paa"],
			["Flashlight", 7500, "acc_flashlight", "$7500", "\A3\weapons_F\data\UI\gear_accv_flashlight_CA.paa"],
			["IR Laser", 7500, "acc_pointer_IR", "$7500", "\A3\weapons_F\data\UI\gear_accv_pointer_CA.paa"],
			["ACO Red", 5550, "optic_Aco", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["ACO Green", 5550, "optic_Aco_grn", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["Holosight", 6000, "optic_Holosight", "$6000", "\A3\weapons_F\data\UI\gear_acco_eotxps3_CA.paa"]
		];
	};
	
	case "arifle_MX_GL_F" : {
		_extras = [ 
			["30Rnd 6.5x39mm", 5000, "30Rnd_65x39_caseless_mag", "$5000", "\A3\weapons_F\data\UI\m_30stanag_caseless_CA.paa"],
			["Suppressor 6.5mm", 9500, "muzzle_snds_H", "$4800", "\A3\weapons_F\data\UI\gear_acca_snds_h_CA.paa"],
			["Flashlight", 7500, "acc_flashlight", "$7500", "\A3\weapons_F\data\UI\gear_accv_flashlight_CA.paa"],
			["IR Laser", 7500, "acc_pointer_IR", "$7500", "\A3\weapons_F\data\UI\gear_accv_pointer_CA.paa"],
			["ACO Red", 5550, "optic_Aco", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["ACO Green", 5550, "optic_Aco_grn", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["Holosight", 6000, "optic_Holosight", "$6000", "\A3\weapons_F\data\UI\gear_acco_eotxps3_CA.paa"]
		];
	};
	
	case "arifle_MXM_F" : {
		_extras = [ 
			["30Rnd 6.5x39mm", 5000, "30Rnd_65x39_caseless_mag", "$5000", "\A3\weapons_F\data\UI\m_30stanag_caseless_CA.paa"],
			["Suppressor 6.5mm", 9500, "muzzle_snds_H", "$4800", "\A3\weapons_F\data\UI\gear_acca_snds_h_CA.paa"],
			["Flashlight", 7500, "acc_flashlight", "$7500", "\A3\weapons_F\data\UI\gear_accv_flashlight_CA.paa"],
			["IR Laser", 7500, "acc_pointer_IR", "$7500", "\A3\weapons_F\data\UI\gear_accv_pointer_CA.paa"],
			["ACO Red", 5550, "optic_Aco", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["ACO Green", 5550, "optic_Aco_grn", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["Holosight", 6000, "optic_Holosight", "$6000", "\A3\weapons_F\data\UI\gear_acco_eotxps3_CA.paa"],
			["ARCO", 8500, "optic_Arco", "$8500", "\A3\weapons_F\data\UI\gear_acco_arco_CA.paa"],
			["RCO", 8500, "optic_Hamr", "$8500", "\A3\weapons_F\data\UI\gear_acco_hamr_CA.paa"],
			["MRCO", 10250, "optic_MRCO", "$10250", "\A3\weapons_F_beta\Data\UI\gear_acco_MRCO_CA.paa"]
		];
	};
	
	case "arifle_MX_SW_F" : {
		_extras = [ 
			["100Rnd 6.5x39mm", 8000, "100Rnd_65x39_caseless_mag", "$8000", "\A3\weapons_F\data\UI\m_100rnd_65x39_CA.paa"],
			["Suppressor 6.5mm", 9500, "muzzle_snds_H_MG", "$6500", "\A3\weapons_F\data\UI\gear_acca_snds_h_mg.paa"],
			["Flashlight", 7500, "acc_flashlight", "$7500", "\A3\weapons_F\data\UI\gear_accv_flashlight_CA.paa"],
			["IR Laser", 7500, "acc_pointer_IR", "$7500", "\A3\weapons_F\data\UI\gear_accv_pointer_CA.paa"],
			["ACO Red", 5550, "optic_Aco", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["ACO Green", 5550, "optic_Aco_grn", "$5550", "\A3\weapons_F\data\UI\gear_acco_aco_CA.paa"],
			["Holosight", 6000, "optic_Holosight", "$6000", "\A3\weapons_F\data\UI\gear_acco_eotxps3_CA.paa"],
			["ARCO", 8500, "optic_Arco", "$8500", "\A3\weapons_F\data\UI\gear_acco_arco_CA.paa"],
			["RCO", 8500, "optic_Hamr", "$8500", "\A3\weapons_F\data\UI\gear_acco_hamr_CA.paa"]
		];
	};
	
	case "srifle_EBR_F" : {
		_extras = [ 
			["20Rnd 7.62x51mm", 8500, "20Rnd_762x51_Mag", "$8500", "\A3\weapons_F\data\UI\m_20rnd_762x51_CA.paa"],
			["Suppressor 7.62mm", 13000, "muzzle_snds_B", "$13000", "\A3\weapons_F\data\UI\gear_acca_snds_h_CA.paa"],
			["Flashlight", 7500, "acc_flashlight", "$7500", "\A3\weapons_F\data\UI\gear_accv_flashlight_CA.paa"],
			["IR Laser", 7500, "acc_pointer_IR", "$7500", "\A3\weapons_F\data\UI\gear_accv_pointer_CA.paa"],
			["ARCO", 8500, "optic_Arco", "$8500", "\A3\weapons_F\data\UI\gear_acco_arco_CA.paa"],
			["RCO", 8500, "optic_Hamr", "$8500", "\A3\weapons_F\data\UI\gear_acco_hamr_CA.paa"],
			["MRCO", 10250, "optic_MRCO", "$10250", "\A3\weapons_F_beta\Data\UI\gear_acco_MRCO_CA.paa"],
			["DMS", 21500, "optic_DMS", "$21500", "\A3\Weapons_F_EPA\Acc\data\UI\gear_acco_dms_CA.paa"]
		];
	};
	
	case "srifle_LRR_F" : {
		_extras = [ 
		["7Rnd .408", 15000, "7Rnd_408_Mag", "$15000", "\A3\weapons_f\data\UI\m_M24_CA.paa"],
		["DMS", 21500, "optic_DMS", "$21500", "\A3\Weapons_F_EPA\Acc\data\UI\gear_acco_dms_CA.paa"],
		["SOS", 25100, "optic_SOS", "$25100", "\A3\weapons_F\Data\UI\gear_acco_Sniper_CA.paa"],
		["LRPS", 28500, "optic_LRPS", "$28500", "\A3\Weapons_F_EPB\Acc\Data\UI\gear_acco_sniper02_CA.paa"]
		];
	};
	
	default {_extras = []};
};

_extras;
