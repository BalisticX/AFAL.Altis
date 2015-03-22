/*
	File: fn_vehicleShop_select.sqf
	Author: Ballistic
	
	Description:
	Executes when you select an option at the vehicle shop for After Altis
*/

disableSerialization;

_selection = [ _this, 0, [], [[]]] call BIS_fnc_param;

_dialog = findDisplay 2000;
_price = _dialog displayCtrl 2001;

_vehicles = _selection select 0;
_index = _selection select 1;

_text = _vehicles lbText _index;
_value = _vehicles lbValue _index;
_class = _vehicles lbData _index;

_price ctrlSetText format ["$ %1", _value];

shopVehicle = _class createVehicleLocal [0,0,0];
	shopVehicle enableSimulation false;
	shopVehicle attachTo [shopPivot, [ 0, 0, 5]];

switch (_class) do {

	case "B_SDV_01_F" : {
		shopVehicle setObjectTexture [0, "#(argb,8,8,3)color( 0.9, 0.45, 0.15, 1)"];
	};

	default {};
};
