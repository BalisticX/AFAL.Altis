/*
	File: fn_workDelivery.sqf
	Author: Ballistic 
	
	Description:
	Sets up the delivery job destination, goods and award
	
	Parameters:
	0 : OBJECT The starting point for the delivery mission
	1 : STRING Type of delivery mission
*/

private ["_start", "_type", "_go", "_list", "_locations", "_multiplier", "_vehicle", "_rate"];

_start = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
_type = [ _this, 1, "", [""]] call BIS_fnc_param;

_go = false;	

_list = [];
switch (_type) do {
	case "Civ" : 		{
		_list = ["C_Offroad_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F"];
		_locations = [KavalaDeliveryFactory1, KavalaDeliveryFactory2, KavalaDeliveryFactory3, KavalaDeliveryPower, KavalaDeliveryStadium, KavalaDeliveryPrison];
		_multiplier = 1;		
	};
	case "Valuable" :	{
		_list = ["C_Van_01_box_F"];
		_locations = [];
		_multiplier = 1.65;
	};
	case "Illegal" : 	{		
		_list = ["C_Van_01_transport_F", "C_Van_01_box_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F"]; 
		_locations = [KavalaDeliveryTopolia];
		_multiplier = 1.5;	
	};
};	
_list;

_vehicle = getPos _start nearestObject "Car";
_truck = typeOf _vehicle;

if (_truck in _list) then {
	if (_start distance _vehicle > 5) then {
		systemChat "Your delivery vehicle needs to be closer to the start position";
	} else {
		if (isDelivery) then {
			systemChat "You previous delivery job has been cancelled";
			isDelivery = false;
		} else {
			isDelivery = false;
			_go = true;
		};
	};
} else {
	systemChat "You need a delivery vehicle to begin a delivery job";
};

switch (_truck) do {
	case "C_Offroad_01_F" : 		{		_rate = 1			};
	case "C_Van_01_transport_F" : 	{		_rate = 1.5			};
	case "C_Van_01_box_F" : 		{		_rate = 2			};
	case "C_Van_01_fuel_F" : 		{		_rate = 3.5			};
};

if (_go) then {

	private ["_dialog", "_map", "_startCtrl", "_finishCtrl", "_distanceCtrl", "_payCtrl", "_finish", "_distance", "_pay", "_startName", "_finishName", "_markerStart", "_markerFinish", "_waypoint"];

	disableSerialization;
	if (!dialog) then {		createdialog "AFAL_delivery"	};
	
	_dialog = findDisplay 1800;
	_map = _dialog displayCtrl 1801;
	_startCtrl = _dialog displayCtrl 1802;
	_finishCtrl = _dialog displayCtrl 1803;
	_distanceCtrl = _dialog displayCtrl 1804;
	_payCtrl = _dialog displayCtrl 1805;
	
	_locations =  _locations - [_start];
	_finish = _locations call BIS_fnc_selectRandom;

	_distance = [(_start distance _finish), 100] call BIS_fnc_roundNum;
	_pay = ((_distance * 0.5) * _rate) * _multiplier;
	
	_startName = [_start] call AFAL_fnc_workDelivery_name;
	_finishName = [_finish] call AFAL_fnc_workDelivery_name;
	
	_startCtrl ctrlSetText format ["%1", _startName];
	_finishCtrl ctrlSetText format ["%1", _finishName];
	_distanceCtrl ctrlSetText format ["%1 m", _distance];
	_payCtrl ctrlSetText format ["$ %1", _pay];

	_markerStart = createMarkerLocal ["START", [getPos _start select 0, getPos _start select 1]];
		_markerStart setMarkerShapeLocal "ICON";
		_markerStart setMarkerTypeLocal "mil_start";
		"START" setMarkerColorLocal "ColorGreen";
	_markerFinish = createMarkerLocal ["FINISH", [getPos _finish select 0, getPos _finish select 1]];
		_markerFinish setMarkerShapeLocal "ICON";
		_markerFinish setMarkerTypeLocal "mil_end";
		"FINISH" setMarkerColorLocal "ColorRed";
	
	_map ctrlMapAnimAdd [0, 0.1, getPos _start];
		ctrlMapAnimCommit _map;
	_map ctrlMapAnimAdd [9, 0.1, getPos _finish];
		ctrlMapAnimCommit _map;
		
	waitUntil {		isNull _dialog		};
	
	systemChat format ["You have started a delivery job from %1 to %2. You can speak to the worker again to pay a $%3 fee and cancel the job", _startName, _finishName, _pay * 0.5];
	
	deleteMarker "START";
	deleteMarker "FINISH";
	
	if (isDelivery) then {
		_waypoint = (group player) addWaypoint [_finish, 0, 1, "Delivery - Finish"];
		(group player) setCurrentWaypoint _waypoint;
		
		waitUntil {		sleep 5; _vehicle distance _finish < 3 && speed _vehicle < 0.25 or !isDelivery	};
		
		if (isDelivery) then {		
			deleteWaypoint [(group player), 1];
				systemChat format ["Delivery route completed, you have been paid $%1, good job!", _pay];
			AFAL_money = AFAL_money + _pay;
			isDelivery = false;
		} else {
			deleteWaypoint [(group player), 1];
			systemChat format ["You have been charged $%1 for cancelling your job", _pay * 0.5];
			AFAL_money = AFAL_money - (_pay * 0.5);
		};
	};
};
