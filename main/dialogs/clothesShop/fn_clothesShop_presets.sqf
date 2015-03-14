/*
	File: fn_clothesShop_presets.sqf
	Author: Ballistic
	
	Description:
	Function for determining the presets for the clothes shops for After Altis
	
	Paramters:
	0: STRING Name of preset outfit
	
	Returns:
	ARRAY The uniform, vest, headgear and facewear associated with the preset outift
*/

private ["_preset", "_array"];

_preset = [ _this, 0, "", [""]] call BIS_fnc_param;

if (_preset == "") exitWith {};

_array = [];

switch (_preset) do {
	
	case "PresetScubaBlack" : {
		_array = _array + [
			["Black Wetsuit", 5000, "U_B_Wetsuit"],
			["Black Rebreather", 8000, "V_RebreatherB"],
			["", 0, ""],
			["Black Scuba Goggles", 2600, "G_B_Diving"]
		];
	};
	
	case "PresetScubaGreen" : {
		_array = _array + [
			["Green Wetsuit", 5100, "U_I_Wetsuit"],
			["Green Rebreather", 8100, "V_RebreatherIA"],
			["", 0, ""],
			["Green Scuba Goggles", 2700, "G_I_Diving", "$2800"]
		];
	};
			
	case "PresetScubaCamo" : {
		_array = _array + [
			["Camo Wetsuit", 5250, "U_O_Wetsuit"],
			["Camo Rebreather", 8250, "V_RebreatherIR"],
			["", 0, ""],
			["Camo Scuba Goggles", 2850, "G_O_Diving", "$2800"]
		];
	};
	
	case "PresetFisherman" : {
		_array = _array + [
			["Fisherman's Clothes", 1250, "U_C_Poor_1"],
			["", 0, ""],
			["Fisherman's Hat", 1250, "H_StrawHat"],
			["Aviators", 1700, "G_Aviator"]		
		];
	};
	
	case "PresetBrownJacket" : {
		_array = _array + [
			["Brown Jacket", 9500, "U_OG_Guerilla3_1"],
			["Olive Bandolier", 15000, "V_BandollierB_oli"],
			["Cool Hat Tan", 1500, "H_Hat_tan"],
			["Aviators", 1700, "G_Aviator"]		
		];	
	};
	
	case "PresetGreenCargo" : {
		_array = _array + [
			["Green Cargo Pants", 6000, "U_BG_Guerilla2_3"],
			["Olive Chestring", 20000, "V_Chestrig_oli"],
			["Boonie Olive", 1500, "H_Booniehat_oli"],
			["Green Sports", 2500, "G_Sport_Greenblack"]		
		];	
	};
	
	case "PresetWorker" : {
		_array = _array + [
			["Grey Coveralls", 3500, "U_C_WorkerCoveralls"],
			["Black Bandolier", 16500, "V_BandollierB_blk"],
			["Bandana Grey", 1250, "H_Bandanna_gry"],
			["", 0, ""]
		];	
	};
	
	case "PresetPress" : {
		_array = _array + [
			["Journalist Uniform", 10500, "U_C_Journalist"],
			["Press Vest", 15250, "V_Press_F"],
			["Press Cap", 1500, "H_Cap_press"],
			["Aviators", 1700, "G_Aviator"]
		];	
	};
};

_array
