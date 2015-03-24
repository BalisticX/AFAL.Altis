/*
	File: AFAL_gunShop.sqf
	Author: Ballistic
	
	Description:
	Creates gun shop dialog and sets available weapons for After Altis
*/

private ["_location", "_type", "_dialog", "_weaponList", "_weaponArray", "_weaponIndex", "_shopCam", "_dir"];

_location = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
_type = [ _this, 1, "", [""]] call BIS_fnc_param;

if (!dialog) then {	createdialog "gunShop"	};

disableSerialization;

_dialog = findDisplay 3000;
_weaponList = _dialog displayCtrl 3017;

_availableWeapons = compile preprocessFile "scripts\dialogs\AFAL_gunShop_inventory.sqf";

_weaponArray = _type call _availableWeapons;

{
	_weaponIndex = _weaponList lbAdd format[ "%1", (_x select 0)];
	_weaponList lbSetValue [_weaponIndex, (_x select 1)];	
	_weaponList lbSetData [_weaponIndex, (_x select 2)];
	_weaponList lbSetToolTip [_weaponIndex, (_x select 3)];
	_weaponList lbSetPicture [_weaponIndex, (_x select 4)];
	_weaponList lbSetPictureColor [_weaponIndex, [1, 1, 1, 1]];

} forEach _weaponArray;

shopPivot = "Land_Tyre_F" createVehicleLocal [0,0,0];
hideObject shopPivot;
shopPivot setPosATL getPosATL _location;

shopHolder = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
	shopHolder attachTo [ shopPivot, [ 0, -0.63, 1.25]];
	shopHolder setVectorDirAndUp [[0,0,1],[0,-1,0]];
extraHolder = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
	extraHolder attachTo [ shopPivot, [ 0, 0, 1.5]];
	extraHolder setVectorDirAndUp [[0,1,0],[0,0,1]];

_weaponList ctrlSetEventHandler [ "LBSelChanged", "{	deleteVehicle _x	} forEach [shopHolder, extraHolder]; [_this] execVM 'scripts\dialogs\AFAL_gunShop_select.sqf'"];

_shopCam = "camera" camCreate (_location modelToWorld [ 2.5, -1, 2]);
	_shopCam camSetTarget (_location modelToWorld [ 0, 0, 1]);
	_shopCam cameraEffect ["internal", "back"];
	_shopCam camPrepareFov 0.7;
	_shopCam camCommitPrepared 0;

_dir = getDir shopPivot;

waitUntil {
	_dir = _dir + (
		if (_dir > 360) then [{-360},{0.75}]
	);
	shopPivot setDir _dir;

	isNull _dialog;
};

{deleteVehicle _x} forEach [shopHolder, extraHolder, shopPivot];

player cameraEffect ["terminate","back"];
camDestroy _shopCam;

magCount = nil;
shopSelect = nil;
