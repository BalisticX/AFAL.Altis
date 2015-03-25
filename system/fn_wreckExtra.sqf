/*
	File: fn_wreckExtra.sqf
	Author: Ballistic
	
	Description:
	Function for additional decoration and objects for wreck spawns in After Altis
	
	Parameters:
	0 : STRING Classname of initial wreck object
	
	Returns:
	ARRAY Decortaional objects to place around the initial wreck
*/

private ["_class", "_array"];

_class = [ _this, 0, "", [""]] call bis_fnc_param;
	if (_class == "") exitWith {};
_array = [];

switch (_class) do {
	case "Fishing" : {
		_array = _array + [
			"Land_CrabCages_F",
			"Land_FishingGear_01_F",
			"Land_FishingGear_02_F",
			"Land_Cages_F",
			"Land_CratesPlastic_F"
		];	
	};
	case "Container" : {
		_array = _array + [
			"Land_Cargo20_blue_F",
			"Land_Cargo20_brick_red_F",
			"Land_Cargo20_cyan_F",
			"Land_Cargo20_light_blue_F",
			"Land_Cargo20_light_green_F",
			"Land_Cargo20_orange_F",
			"Land_Cargo20_red_F",
			"Land_Cargo20_white_F",
			"Land_Cargo20_yellow_F",
			"Land_Cargo20_color_V1_ruins_F",
			"Land_Cargo20_color_V2_ruins_F",
			"Land_Cargo20_color_V3_ruins_F",
			"Land_Cargo20_china_color_V2_ruins_F"
		];	
	};
	case "Ruins" : {
		_array = _array + [
			"Land_Stone_HouseBig_V1_ruins_F",
			"Land_Stone_Shed_V1_ruins_F",
			"Land_Stone_HouseSmall_V1_ruins_F",
			"Land_Castle_01_house_ruin_F",
			"Land_Castle_01_tower_ruins_F"
		];	
	};
	case "Garbage" : {
		_array = _array + [
			"Land_ChairPlastic_F",
			"Land_CratesPlastic_F",
			"Land_Tyre_F",
			"Land_JunkPile_F",
			"Land_Pallet_F",
			"Land_Pallet_vertical_F",
			"Land_Pallets_F",
			"Land_Coil_F",
			"Land_ConcretePipe_F",
			"Land_WheelCart_F",
			"Land_MetalBarrel_F",
			"Land_GarbageBarrel_01_F"
		];
	};
};

_array
