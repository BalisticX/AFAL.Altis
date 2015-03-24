/*
	File: fn_vehicleShop.sqf
	Author: Ballistic
	
	Description:
	Creates vehicle shop dialog and sets available vehicles for After Altis
*/

_location = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
_type = [ _this, 1, "", [""]] call BIS_fnc_param;
_dir = [ _this, 2, 0, [0]] call BIS_fnc_param;

if (!dialog) then {createdialog "vehicleShop";};

disableSerialization;

_dialog = findDisplay 2000;
_vehicles = _dialog displayCtrl 2017;

shopVehicle = objNull;
shopLocation = _location;
shopDir = _dir;

_vehicleArray = [_type] call AFAL_fnc_vehicleShop_inventory;

{

	_index = _vehicles lbAdd format[ "%1", (_x select 0)];
	_vehicles lbSetValue [_index, (_x select 1)];	
	_vehicles lbSetData [_index, (_x select 2)];
	_vehicles lbSetToolTip [_index, (_x select 3)];

} forEach _vehicleArray;

_vehicles ctrlSetEventHandler [ "LBSelChanged", "deleteVehicle shopVehicle; [_this] call AFAL_fnc_vehicleShop_select"];

shopPivot = "Land_Tyre_F" createVehicleLocal [0,0,0];
hideObject shopPivot;
shopPivot setPosATL [getPosATL _location select 0, getPosATL _location select 1, getPosATL _location select 2];
shopPivot allowDamage false;

if (_type in ["Scrapyard", "Boatyard", "PoliceCar", "MedicCar", "GangCar"]) then {
	_shopCam = "camera" camCreate (_location modelToWorld [ 10, 0, 7]);
		_shopCam camSetTarget (_location modelToWorld [ 0, 0, 4]);
		_shopCam cameraEffect ["internal", "back"];
		_shopCam camPrepareFov 0.7;
		_shopCam camCommitPrepared 0;
} else {
	_shopCam = "camera" camCreate (_location modelToWorld [ 14, 0, 4]);
		_shopCam camSetTarget (_location modelToWorld [ 0, 0, 4]);
		_shopCam cameraEffect ["internal", "back"];
		_shopCam camPrepareFov 1;
		_shopCam camCommitPrepared 0;
};

_dir = getDir shopPivot;

waitUntil {
	_dir = _dir + (
		if (_dir > 360) then [{-360},{0.9}]
	);
	shopPivot setDir _dir;

	isNull _dialog;
};

{deleteVehicle _x} forEach [shopVehicle, shopPivot];

player cameraEffect ["terminate","back"];
camDestroy _shopCam;

shopLocation = nil;
shopDir = nil;
