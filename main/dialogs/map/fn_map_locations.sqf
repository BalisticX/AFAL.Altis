/*
	File: fn_map_locations.sqf
	Author: Ballistic
	
	Description:
	List the available locations for the interactive County map for After Altis
	
	Parameters:
	0: STRING Location around Altis. Kavala, wasteland, Pyrgos etc.
	1: OBJECT the player
*/

private ["_location", "_caller", "_array"];

_location = [ _this, 0, "", [""]] call BIS_fnc_param;
_caller = [ _this, 1, player, [objNull]] call BIS_fnc_param;

_array = [];

switch (_location) do {

	case "Kavala" : {
		_array = _array + [ 
			["PLAYER", "You", 4, "\A3\ui_f\data\map\mapcontrol\waypoint_CA.paa"],
			["Police District", "KavalaPoliceGear", 2, "\A3\ui_f\data\map\Markers\NATO\n_hq.paa"],
			["Hospital", "KavalaMedicCars", 2, "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa"],
			["Port", "KavalaPort", 2, "\A3\ui_f\data\map\mapcontrol\quay_CA.paa"],
			["Scrapyard", "KavalaScrap", 1, "\A3\ui_f\data\map\Markers\NATO\c_car.paa"],
			["Clothes Shop", "KavalaClothes", 1, "\A3\ui_f\data\map\Markers\NATO\c_unknown.paa"],
			["Civ Gun Shop", "KavalaGuns", 1, "\A3\ui_f\data\map\Markers\NATO\n_installation.paa"],
			["General Store", "KavalaItems", 1, "\A3\ui_f\data\map\Markers\NATO\n_installation.paa"],
			["TV Studio", "KavalaStudio", 1, "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa"],
			["Museum", "KavalaMuseum", 1, "\A3\ui_f\data\map\Markers\NATO\n_installation.paa"],
			["Altis Embassy", "KavalaEmbassy", 1, "\A3\ui_f\data\map\Markers\NATO\n_med.paa"],
			["Power Plant", "KavalaPower", 2, "\A3\ui_f\data\map\mapcontrol\power_CA.paa"],
			["Sports Stadium", "KavalaStadium", 2, "\A3\ui_f\data\map\Markers\NATO\n_installation.paa"]
		];
		
		switch (side _caller) do {
		
			case west : {
				_array = _array + [
					["Police Gear", "KavalaPoliceGear", 1, "\A3\ui_f\data\map\Markers\NATO\n_plane.paa"],
					["Police Shop", "KavalaPoliceGuns", 1, "\A3\ui_f\data\map\Markers\NATO\n_mortar.paa"],
					["Police Vehicles", "KavalaPoliceCars", 1, "\A3\ui_f\data\map\Markers\NATO\c_car.paa"],
					["Police Aircraft", "KavalaPoliceAir", 1, "\A3\ui_f\data\map\Markers\NATO\c_air.paa"],
					["Command Center", "KavalaPoliceCommand", 1, "\A3\ui_f\data\map\Markers\NATO\n_hq.paa"],
					["HQ North Entry", "KavalaPoliceNorth", 1, "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa"],
					["HQ East Entry", "KavalaPoliceEast", 1, "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa"],
					["HQ South Entry", "KavalaPoliceSouth", 1, "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa"],
					["City Limits", "KavalaCityLimits", 1, "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa"]
				];
			};
			
			case east : {
			
			};
			
			case resistance : {
				_array = _array + [
					["Medic Gear", "KavalaMedicGear", 1, "\A3\ui_f\data\map\Markers\NATO\n_installation.paa"],	
					["Medic Vehicles", "KavalaMedicCars", 1, "\A3\ui_f\data\map\Markers\NATO\n_installation.paa"],
					["Medic Aircraft","KavalaMedicAir", 1, "\A3\ui_f\data\map\Markers\NATO\n_installation.paa"]
				];
			};
			
			case civilian : {
				_array = _array + [
					["Construction Site", "KavalaConstruction", 1, "\A3\ui_f\data\map\Markers\NATO\n_installation.paa"]
				];
			};
			
		};
	};
};

_array;
