/*
	File: fn_vehicleShop_buy.sqf
	Author: Ballistic
	
	Description:
	Executes when you purchase a vehicle for After Altis
*/

private [ "_dialog", "_list", "_index", "_location", "_dir", "_vehicle"];

disableSerialization;

_dialog = findDisplay 2000;
_list = _dialog displayCtrl 2017;
_index = lbCurSel 2017;

_class = _list lbData _index;
_name = _list lbText _index;
_value = _list lbValue _index;

_location = shopLocation;
_dir = shopDir;

if (AFAL_money >= _value) then {

	closeDialog 2000;

	_vehicle = _class createVehicle [0,0,0];
	_vehicle allowDamage false;
	_vehicle setPos getPosATL _location;
	_vehicle setDir _dir;
	_vehicle setVariable ["Owner", format ["%1", player], true];
		sleep 0.25;
	cutText [ format["You have purchased a %1 for $%2", _name, _value], "PLAIN DOWN", 3, false];
	switch (_class) do {
		case "B_SDV_01_F" : {
		  shopVehicle setObjectTexture [0, "#(argb,8,8,3)color( 0.9, 0.45, 0.15, 1)"];
		};
		default {};
	};
		sleep 4.75;
	_vehicle allowDamage true;
	cutText [" ", "PLAIN", 1];
	
} else { systemChat "You can't afford this chump!" };
