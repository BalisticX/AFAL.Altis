/*
	File: fn_newEquip.sqf
	Author: Ballistic 
	
	Description:
	Free equipment for the police and paramedics
*/

private ["_type"];

_type = [ _this, 0, "", [""]] call BIS_fnc_param;

if (_type == "") exitWith {};

switch (_type) do {
	
	case "Police" : {
		player forceAddUniform "U_Marshal";
			player setObjectTextureGlobal [0, "images\AFAL_police.paa"];
		player addVest "V_Rangemaster_belt";
		player addWeapon "hgun_Rook40_snds_F";
		player addMagazineCargo ["16Rnd_9x21_Mag", 2];
	};
	
	case "Medic" : {
		player forceAddUniform "U_C_Scientist";
		player addVest "V_HarnessOSpec_brn";
	};
	
	case "Mayor" : {
		player forceAddUniform "U_NikosAgedBody";
	};
};
