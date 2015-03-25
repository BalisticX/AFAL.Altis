/*
	File: fn_wreckSpawn.sqf
	Author: Ballistic
	
	Description:
	Spawns underwater wrecks and valuable lootable boxes
*/

private ["_buoyList", "_count", "_underwaterList", "_wreckRandom", "_object", "_type", "_wreck"];

_buoyList = nearestObjects [(getMarkerPos "KavalaCenter"), ["Land_BuoyBig_F"], 4250]; //// Should return 20

_underwaterList = [		
	["Land_Wreck_Traw_F", "Trawler"], ["Land_Wreck_Traw_F", "Trawler"],	["Land_Wreck_Traw_F", "Trawler"],
	["Land_Wreck_Plane_Transport_01_F",	"Military"], ["Land_UWreck_MV22_F", "Military"], ["Land_UWreck_Heli_Attack_02_F", "Military"],
	["Land_UWreck_FishingBoat_F", "Fishing"], ["Land_UWreck_FishingBoat_F", "Fishing"],
	["Land_Cargo20_red_F", "Container"],
	["Land_Tank_rust_F", "Garbage"],
	["Land_Castle_01_wall_01_F", "Ruins"], ["Land_Castle_01_wall_01_F", "Ruins"], ["Land_Castle_01_wall_01_F", "Ruins"], ["Land_Castle_01_wall_01_F", "Ruins"]	
	];
{	
	_wreckRandom = _underwaterList select floor random count _underwaterList;
			
	_object = [ _wreckRandom, 0, "", [""]] call bis_fnc_param;
	_type = [ _wreckRandom, 1, "", [""]] call bis_fnc_param;
		
	_wreck = createVehicle [_object, getPosATL _x , [], 250, "NONE"];
		_wreck setDir (floor (random 360));
		_wreck setPosATL [getPosATL _wreck select 0, getPosATL _wreck select 1, 0];
		
	switch (_type) do {
		case "Trawler" : {
			_wreckHalf = "Land_Wreck_Traw2_F" createVehicle (_wreck modelToWorld [0,-35,0]);
			_wreckHalf setDir getDir _wreck;
			_wreckHalf setPosATL [getPosATL _wreckHalf select 0, getPosATL _wreckHalf select 1, 0];
		};
		case "Fishing" : {
			private ["_extras", "_random", "_gear"];
			_extras = [_type] call AFAL_fnc_wreckExtra;
			for "_a" from 0 to 2 do {
				_random = _extras select floor random count _extras;
				_gear = createVehicle [_random, (getPosATL _wreck), [], 20, "NONE"];
				_gear setDir (floor (random 360));
				_gear setPosATL [getPosATL _gear select 0, getPosATL _gear select 1, 0];
			};
		};
		case "Garbage" : {
			private ["_extras", "_random", "_garbage"];
			_extras = [_type] call AFAL_fnc_wreckExtra;
			for "_a" from 0 to 4 do {
				_random = _extras select floor random count _extras;
				_garbage = createVehicle [_random, (getPosATL _wreck), [], 50, "NONE"];
				_garbage setDir (floor (random 360));
				_garbage setPosATL [getPosATL _garbage select 0, getPosATL _garbage select 1, 0];
			};
		};
		case "Container" : {
			private ["_extras", "_random", "_container"];
			_extras = [_type] call AFAL_fnc_wreckExtra;
			for "_a" from 0 to 7 do {
				_random = _extras select floor random count _extras;
				_container = createVehicle [_random, (getPosATL _wreck), [], 40, "NONE"];
				_container setDir (floor (random 360));
				_container setPosATL [getPosATL _container select 0, getPosATL _container select 1, 0];
				_container enableSimulation false;
				_container setVectorUp [(floor (random 0.5)),(floor (random 0.5)),1];
			};
		};
		case "Military" : {
			for "_m" from 0 to 3 do {
				_military = createVehicle ["Box_NATO_WpsSpecial_F", (getPosATL _wreck), [], 40, "NONE"];
					_military enableSimulation false;
					_military setPosATL [getPosATL _military select 0, getPosATL _military select 1, 0];
					clearWeaponCargoGlobal _military;
					clearMagazineCargoGlobal _military;
					clearItemCargoGlobal _military;
					_military setDir (floor (random 360));
				_military addAction ["Recover military gear", {		[(_this select 0), "AFAL_relicMilitary"] spawn AFAL_fnc_recover	},"", 0, false, true, "", "_this distance _target < 7"];
			};
		};
		case "Ruins" : {
			_extras = [_type] call AFAL_fnc_wreckExtra;
			_castle1 = createVehicle [ "Land_Castle_01_wall_03_F", (_wreck modelToWorld [-35, 30, 0]), [], 0, "NONE"];
				_castle1 setDir (getDir _wreck - 92);
			_castle2 = createVehicle [ "Land_Castle_01_wall_14_F", (_wreck modelToWorld [50, -20, 0]), [], 0, "NONE"];
				_castle2 setDir (getDir _wreck + 90);
			_castle3 = createVehicle [ "Land_Castle_01_wall_09_F", (_wreck modelToWorld [-40, -30, 0]), [], 0, "NONE"];
				_castle3 setDir (getDir _wreck);
			_random1 = _extras select floor random count _extras;
			_house1 = createVehicle [ _random1 , (_wreck modelToWorld [55, 30, 0]), [], 0, "NONE"];
			_random2 = _extras select floor random count _extras;
			_house2 = createVehicle [ _random2 , (_wreck modelToWorld [15, 50, 0]), [], 0, "NONE"];
			_random3 = _extras select floor random count _extras;
			_house3 = createVehicle [ _random3 , (_wreck modelToWorld [5, -55, 0]), [], 0, "NONE"];
			{				_x setPosATL [getPosATL _x select 0, getPosATL _x select 1, 0];			} forEach [_castle1, _castle2, _castle3, _house1, _house2, _house3];
			{				_x setDir (floor (random 360));			} forEach [_house1, _house2, _house3];
		};
		default {};
	};
	
	if (_type in ["Military", "Garbage"]) then {} else {
		private ["_loot", "_relic", "_illegal"];
		_loot = ["AFAL_relicBox", "AFAL_relicIllegal"] call BIS_fnc_selectRandom;
		if (_type == "Ruins") then {_loot = "AFAL_relicBox"};
		switch (_loot) do {
			case "AFAL_relicBox" : {
				for "_r" from 0 to 5 do {
					_relic = createVehicle ["Land_WoodenBox_F", (getPosATL _wreck), [], 40, "NONE"];
						_relic enableSimulation false;
						_relic setPosATL [getPosATL _relic select 0, getPosATL _relic select 1, 0];
						_relic setDir (floor (random 360));
					_relic addAction ["Recover ancient relics", {		[(_this select 0), "AFAL_relicBox"] spawn AFAL_fnc_recover	},"", 0, false, true, "", "_this distance _target < 7"];
				};
			};
			case "AFAL_relicIllegal" : {
				for "_i" from 0 to 2 do {
					_illegal = createVehicle ["Land_PlasticCase_01_large_F", (getPosATL _wreck), [], 40, "NONE"];
						_illegal enableSimulation false;
						_illegal setPosATL [getPosATL _illegal select 0, getPosATL _illegal select 1, 0];
						_illegal setDir (floor (random 360));
					_illegal addAction ["Recover lost contraband", {		[(_this select 0), "AFAL_relicIllegal"] spawn AFAL_fnc_recover	},"", 0, false, true, "", "_this distance _target < 7"];
				};
			};
		};
	};
} forEach _buoyList;
