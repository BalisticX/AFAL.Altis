/*
	File: fn_vehicleShop.sqf
	Author: Ballistic
	
	Description:
	Creates vehicle shop dialog and sets available vehicles for After Altis
*/

private ["_type", "_dialog", "_vehicles", "_vehicleArray", "_shopCam", "_dir"];

shopPivot = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
_type = [ _this, 1, "", [""]] call BIS_fnc_param;
shopDir = [ _this, 2, 0, [0]] call BIS_fnc_param;

if (!dialog) then {createdialog "vehicleShop";};

disableSerialization;

_dialog = findDisplay 2000;
_vehicles = _dialog displayCtrl 2017;

shopVehicle = objNull;

_vehicleArray = [_type] call AFAL_fnc_vehicleShop_inventory;

{

	_index = _vehicles lbAdd format[ "%1", (_x select 0)];
	_vehicles lbSetValue [_index, (_x select 1)];	
	_vehicles lbSetData [_index, (_x select 2)];
	_vehicles lbSetToolTip [_index, (_x select 3)];

} forEach _vehicleArray;

_vehicles ctrlSetEventHandler [ "LBSelChanged", "deleteVehicle shopVehicle; [_this] call AFAL_fnc_vehicleShop_select"];

if (_type in ["Scrapyard", "Boatyard", "PoliceCar", "MedicCar", "GangCar"]) then {
	_dir = getDir shopPivot;
	shopPivot setDir shopDir;	
	_shopCam = "camera" camCreate (shopPivot modelToWorld [ 0, 12, 6]);
		_shopCam camSetTarget (shopPivot modelToWorld [ 0, 0, 4]);
		_shopCam cameraEffect ["internal", "back"];
		_shopCam camPrepareFov 0.7;
		_shopCam camCommitPrepared 0;
	shopPivot setDir _dir;
} else {
	_dir = getDir shopPivot;
	shopPivot setDir shopDir;	
	_shopCam = "camera" camCreate (shopPivot modelToWorld [ 0, 16, 6]);
		_shopCam camSetTarget (shopPivot modelToWorld [ 0, 0, 4]);
		_shopCam cameraEffect ["internal", "back"];
		_shopCam camPrepareFov 1;
		_shopCam camCommitPrepared 0;
	shopPivot setDir _dir;
};

waitUntil {isNull _dialog};

deleteVehicle shopVehicle;

player cameraEffect ["terminate","back"];
camDestroy _shopCam;

shopPivot = nil;
shopDir = nil;
