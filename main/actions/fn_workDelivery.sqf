/*
	File: fn_workDelivery.sqf
	Author: Ballistic 
	
	Description:
	Sets up the delivery job destination, goods and award
	
	Parameters:
	0 : OBJECT The starting point for the delivery mission
	1 : STRING Type of delivery mission
*/

private ["_start", "_type", "_canStart", "_list", "_typePay", "_vehicle", "_vehiclePay", "_go"];

_start = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
_type = [ _this, 1, "", [""]] call BIS_fnc_param;
	
_go = false;	

_list = [];
switch (_type) do {
	case "Civ" : 		{		_list = ["C_Offroad_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F"]; _typePay = 1;		};
	case "Illegal" : 	{		_list = ["C_Van_01_transport_F", "C_Van_01_box_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F"]; _typePay = 1.5;		};
};	
_list;

systemChat "0";

_vehicle = getPos _start nearestObject "Car";
_truck = typeOf _vehicle;

if (_truck in _list) then {
	if (_start distance _vehicle > 5) then {
		systemChat "You need to move a delivery vehicle closer to the start position";
	} else {
		_go = true;
	};
} else {
	systemChat "You need a valid delivery vehicle to begin a delivery job";
};

systemChat "1";

switch (_truck) do {
	case "C_Offroad_01_F" : 		{		_vehiclePay = 1			};
	case "C_Van_01_transport_F" : 	{		_vehiclePay = 2			};
	case "C_Van_01_box_F" : 		{		_vehiclePay = 3			};
	case "C_Van_01_fuel_F" : 		{		_vehiclePay = 4			};
};
_vehiclePay;

systemChat "2";

if (_go) then {

systemChat "3";

	private ["_dialog", "_map", "_startCtrl", "_finishCtrl", "_distanceCtrl", "_payCtrl", "_locationList", "_finish", "_distance", "_pay", "_markerStart", "_markerFinish", "_commence", "_waypoint"];
	
systemChat "4";	

	disableSerialization;
	if (!dialog) then {		createdialog "AFAL_delivery"	};
	
	_dialog = findDisplay 1800;
	_map = _dialog displayCtrl 1801;
	_startCtrl = _dialog displayCtrl 1802;
	_finishCtrl = _dialog displayCtrl 1803;
	_distanceCtrl = _dialog displayCtrl 1804;
	_payCtrl = _dialog displayCtrl 1805;
	
	_locationList = [TestDelivery1, TestDelivery2, TestDelivery3, TestDelivery4, TestDelivery5, TestDelivery6] - [_start];
	_finish = _locationList call BIS_fnc_selectRandom;

	_distance = round (_start distance _finish);
	_pay = (_distance * _vehiclePay) * _typePay;
	
	_startCtrl ctrlSetText format ["%1", _start];
	_finishCtrl ctrlSetText format ["%1", _finish];
	_distanceCtrl ctrlSetText format ["%1", _distance];
	_payCtrl ctrlSetText format ["$ %1", _pay];
	
	_markerStart = createMarkerLocal ["START",[getPos _start select 0, getPos _start select 1]];
		_markerStart setMarkerShapeLocal "ICON";
		_markerStart setMarkerTypeLocal "mil_start";
		"START" setMarkerColorLocal "ColorGreen";
	_markerFinish = createMarkerLocal ["FINISH",[getPos _finish select 0, getPos _finish select 1]];
		_markerFinish setMarkerShapeLocal "ICON";
		_markerFinish setMarkerTypeLocal "mil_end";
		"FINISH" setMarkerColorLocal "ColorRed";
		
	waitUntil {		isNull _dialog		};
	
	deleteMarkerLocal "START";
	deleteMarkerLocal "FINISH";
	
	if (isDelivery) then {
		_waypoint = (group player) addWaypoint [_finish, 0, 1, "Delivery - Finish"];
		(group player) setCurrentWaypoint _waypoint;
		
		waitUntil {		_vehicle distance _finish < 3 && speed _vehicle = 0	};
		
		systemChat format ["You have reached your destination and been paid $ %1", _pay];
		AFAL_money = AFAL_money + _pay;
		deleteWaypoint [(group player), 1];
	};
};
