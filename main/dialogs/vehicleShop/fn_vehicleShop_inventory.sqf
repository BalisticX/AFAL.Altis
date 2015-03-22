/*
	File: fn_vehicleShop_inventory.sqf
	Author: Ballistic
	
	Description:
	Determines available vehicles for each shop type for After Altis
	
	Parameters:
	0: STRING Type of vehicle shop
	
	Returns:
	ARRAY Inventory of type of vehicle shop
*/

private ["_type", "_array"];

_type = [ _this, 0, "", [""]] call BIS_fnc_param;

if (_type == "") exitWith {};

_array = [];

switch (_type) do {
	case "Scrapyard" : {
		_array = _array + [
			["Quadbike", 7890, "C_Quadbike_01_F", "$7890"],
			["Hatchback", 15490, "C_Hatchback_01_F", "$15490"],
			["Offroad", 22990, "C_Offroad_01_F", "$22990"],
			["SUV", 38250, "C_SUV_01_F", "$38250"],
			["Truck", 32150, "C_Van_01_transport_F", "$32150"]
		];
		if (side player == civilian ) then {
			_array = _array + [
			["Fuel Truck", 34250, "C_Van_01_fuel_F", "$34250"],
			["Box Truck", 37990, "C_Van_01_box_F", "$37990"],
			["Sports Car", 26850, "C_Hatchback_01_sport_F", "$29950"]
			];
		};
	};
	
	case "Boatyard" : {
		_array = _array + [
			["Rubber Boat", 5590, "C_Rubberboat", "$5590"],
			["Resuce Boat", 6250, "B_Lifeboat", "$6250"],
			["Motor Boat", 14990, "C_Boat_Civil_01_F", "$14990"],
			["Resuce Motor Boat", 16990, "C_Boat_Civil_01_rescue_F", "$16990"],
			["SDV Submersible", 22550, "B_SDV_01_F", "$22550"]
		];
	};
	
	case "PoliceCar" : {		
		_array = _array + [
			["Police Quadbike", 5890, "B_Quadbike_01_F", "$5890"],
//		["Patrol Car", 18990, "C_Offroad_01_F", "$18990"],			// Removed until vehicle shop sorted
			["Police Intercepter", 58750, "B_MRAP_01_F", "$58750"],
			["Heavy Mover", 45690, "B_Truck_01_mover_F", "$45690"],
			["Police Transport", 48750, "B_Truck_01_covered_F", "$48750"],
			["Mobile HQ", 62500, "B_Truck_01_box_F", "$62500"]
		];	
	};
	
	case "PoliceHeli" : {
		_array = _array + [
			["Helibird", 105250, "B_Heli_Light_01_F", "$105250"],
			["Scout Chopper", 120500, "B_Heli_Attack_01_F", "$120500"],
			["Police Transport", 135200, "B_Heli_Transport_01_F", "$135200"],
			["Heavy Lifter", 150000, "B_Heli_Transport_03_unarmed_F", "$150000"]
		];	
	};
	
	case "MedicCar" : {		
		_array = _array + [
			["Medic Quadbike", 5090, "I_Quadbike_01_F", "$5090"],
			["Ambulance", 50250, "I_MRAP_03_F", "$50250"],
			["Medical Truck", 42200, "I_Truck_02_medical_F", "$42200"]
		];	
	};
	
	case "MedicHeli" : {
		_array = _array + [
			["Light Medivac", 102500, "I_Heli_light_03_unarmed_F", "$102500"],
			["Medic Transport", 145050, "I_Heli_Transport_02_F", "$145050"]
		];	
	};
	
	case "GangCar" : {
		_array = _array + [
			["Gang Quadbike", 8120, "O_Quadbike_01_F", "$8120"],
			["Camo Quadbike", 8220, "O_G_Quadbike_01_F", "$8220"],
			["Camo Offroad", 24990, "O_G_Offroad_01_F", "$24990"],
			["Armed Offroad", 75800, "O_G_Offroad_01_armed_F", "$75800"],
			["SUV", 40250, "C_SUV_01_F", "$40250"],
			["The Renegade", 65750, "O_MRAP_02_F", "$65750"],
			["Gang Transport", 47190, "O_Truck_02_transport_F", "$47190"],
			["Gang Mover", 50190, "O_Truck_02_covered_F", "$50190"]
		];
	};
	
	case "GangHeli" : {
		_array = _array + [
			["Insurgency Light", 118250, "O_Heli_Light_02_F", "$118250"],
			["Air-Strike IV", 133500, "O_Heli_Attack_02_F", "$133500"]
		];	
	};
};

_array
