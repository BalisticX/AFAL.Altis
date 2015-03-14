/*
	File: AFAL_gunShop.sqf
	Author: Ballistic
	
	Description:
	Creates gun shop dialog and sets available weapons for After Altis
*/

shopLocation = _this select 0;
_type = [ _this, 1, "", [""]] call BIS_fnc_param;
systemChat format["%1%2",_type,shopLocation];
if (!dialog) then {createdialog "gunShop";};

disableSerialization;

_dialog = findDisplay 3000;
_weaponList = _dialog displayCtrl 3017;
_extraList = _dialog displayCtrl 3015;
_priceValue = _dialog displayCtrl 3001;

shopHolder = objNull;
extraHolder = objNull;
shopPivot = objNull;
shopValue = 0;

_weaponArray = [_type] call AFAL_fnc_gunShop_inventory;

_priceValue ctrlSetText "$ 0";

{

	_weaponIndex = _weaponList lbAdd format[ "%1", (_x select 0)];
	_weaponList lbSetValue [_weaponIndex, (_x select 1)];	
	_weaponList lbSetData [_weaponIndex, (_x select 2)];
	_weaponList lbSetToolTip [_weaponIndex, (_x select 3)];
	_weaponList lbSetPicture [_weaponIndex, (_x select 4)];
	_weaponList lbSetPictureColor [_weaponIndex, [1, 1, 1, 1]];

} forEach _weaponArray;

_weaponList ctrlSetEventHandler [ "LBSelChanged", "[_this] call AFAL_fnc_gunShop_select"];

_shopCam = "camera" camCreate (shopLocation modelToWorld [ 2.5, -1, 2]);
_shopCam camSetTarget (shopLocation modelToWorld [ 0, 0, 1]);
_shopCam cameraEffect ["internal", "back"];
_shopCam camPrepareFov 0.7;
_shopCam camCommitPrepared 0;

shopPivot = "Land_Tyre_F" createVehicleLocal [0,0,0];
hideObject shopPivot;
shopPivot setPosATL [getPosATLVisual shopLocation select 0, getPosATLVisual shopLocation select 1, (getPosATLVisual shopLocation select 2)];
shopPivot allowDamage false;
_dir = getDir shopPivot;
waitUntil
{
	_dir = _dir + (
	if (_dir > 360) then [{-360},{1.25}]
	);
	shopPivot setDir _dir;
	isNull _dialog
};

player cameraEffect ["terminate","back"];
camDestroy _shopCam;

shopSelect = nil;
shopValue = nil;
shopLocation = nil;
magCount = nil;
{deleteVehicle _x} forEach [shopHolder, extraHolder, shopPivot];
