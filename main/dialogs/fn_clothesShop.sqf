/*
	File: fn_clothesShop.sqf
	Author: Ballistic
	
	Description:
	Creates the clothes shop dialog and sets the inventory for After Altis
*/

private ["_dialog", "_clothesList", "_selectList", "_price", "_inventory", "_dir"];

shopPivot = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
shopType = [ _this, 1, "", [""]] call BIS_fnc_param;
shopDir = [ _this, 2, 0, [0]] call BIS_fnc_param;

shopSelect = [	["", 0, "", [ 1, 0.5, 0.14, 0.8]], 
	["", 0, "", [ 0.855, 0.647, 0.125,0.8]], 
	["", 0, "", [ 0.42, 0.557, 0.137, 0.8]], 
	["", 0, "", [ 0.275, 0.51, 0.706, 0.8]], 
	["", 0, "", [ 0.365, 0.278, 0.545, 0.8]],
	0	];

if (!dialog) then {		createdialog "clothesShop"	};

disableSerialization;

_dialog = findDisplay 4000;
_clothesList = _dialog displayCtrl 4017;
_selectList = _dialog displayCtrl 4015;
_price = _dialog displayCtrl 4001;

_price ctrlSetText format ["$ %1", shopSelect select 5];

_inventory = [shopType, "Uniforms"] call AFAL_fnc_clothesShop_inventory;

{
	_selectIndex = _selectList lbAdd format ["%1", (_x select 0)];
	_selectList lbSetValue [_selectIndex, (_x select 1)];
	_selectList lbSetData [_selectIndex, (_x select 2)];
	_selectList lbSetColor [_selectIndex, (_x select 3)];
} forEach [shopSelect select 0, shopSelect select 1, shopSelect select 2, shopSelect select 3, shopSelect select 4];

{
	_index = _clothesList lbAdd format[ "%1", (_x select 0)];
	_clothesList lbSetValue [_index, (_x select 1)];	
	_clothesList lbSetData [_index, (_x select 2)];
	_clothesList lbSetToolTip [_index, (_x select 3)];
	_clothesList lbSetPicture [_index, (_x select 4)];
	_clothesList lbSetPictureColor [_index, [1, 1, 1, 1]];
} forEach _inventory;

_clothesList ctrlSetEventHandler [ "LBSelChanged", "[_this] spawn AFAL_fnc_clothesShop_select"];

_dir = getDir shopPivot;
shopPivot setDir shopDir;
shopCam = "camera" camCreate (shopPivot modelToWorld [ 0, 3, 1.5]);
	shopCam camSetTarget (shopPivot modelToWorld [ 0, 0, 1]);
	shopCam cameraEffect ["internal", "back"];
	shopCam camPrepareFov 0.9;
	shopCam camCommitPrepared 0;
shopPivot setDir _dir;

shopMannequin =  "C_Soldier_VR_F" createVehicleLocal [0,0,0];
	shopMannequin attachTo [shopPivot, [0, 0, 0.4]];
	shopMannequin switchMove "Campaign_Base";
	
waitUntil {isNull _dialog};

shopPivot = nil;
shopType = nil;
shopDir = nil;
shopSelect = nil;

deleteVehicle shopMannequin;

player cameraEffect ["terminate","back"];
camDestroy shopCam;
