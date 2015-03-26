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

_location = getPosATL shopPivot;
_dir = shopDir;

if (AFAL_money >= _value) then {

	closeDialog 2000;

	_vehicle = _class createVehicle [0,0,0];
	_vehicle allowDamage false;
	_vehicle setPos _location;
	_vehicle setDir _dir;
	_vehicle setVariable ["Owner", player, true];
	_vehicle setVehicleAmmo 0;
	clearItemCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
		sleep 0.25;
	systemChat format ["You have purchased a %1 for $%2", _name, _value];
		sleep 4.75;
	_vehicle allowDamage true;
	
	switch (_class) do {
		case "B_SDV_01_F" : {
			_vehicle setObjectTextureGlobal [0, "#(argb,8,8,3)color(0.9,0.6,0.15,1)"];
		};
		default {};
	};
} else {	systemChat "You can't afford this ride chump!" 	};
