/*
	File: fn_clothesShop.sqf
	Author: Ballistic
	
	Description:
	Creates the clothes shop dialog and sets the inventory for After Altis
*/

_location = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
_type = [ _this, 1, "", [""]] call BIS_fnc_param;

systemChat format ["%1", _type];

shopType = _type;
shopValue = 0;
shopSelect = [
	["", 0, "", [ 1, 0.5, 0.14, 0.8]], 
	["", 0, "", [ 0.855, 0.647, 0.125,0.8]], 
	["", 0, "", [ 0.42, 0.557, 0.137, 0.8]], 
	["", 0, "", [ 0.275, 0.51, 0.706, 0.8]], 
	["", 0, "", [ 0.365, 0.278, 0.545, 0.8]]
	];

if (!dialog) then {createdialog "clothesShop";};

disableSerialization;

_dialog = findDisplay 4000;
_clothesList = _dialog displayCtrl 4017;
_selectList = _dialog displayCtrl 4015;
_price = _dialog displayCtrl 4001;

_price ctrlSetText format ["$ %1", shopValue];

_inventory = [_type, "Uniforms"] call AFAL_fnc_clothesShop_inventory;

{

	_selectIndex = _selectList lbAdd format ["%1", (_x select 0)];
	_selectList lbSetValue [_selectIndex, (_x select 1)];
	_selectList lbSetData [_selectIndex, (_x select 2)];
	_selectList lbSetColor [_selectIndex, (_x select 3)];

} forEach shopSelect;

{

	_index = _clothesList lbAdd format[ "%1", (_x select 0)];
	_clothesList lbSetValue [_index, (_x select 1)];	
	_clothesList lbSetData [_index, (_x select 2)];
	_clothesList lbSetToolTip [_index, (_x select 3)];

} forEach _inventory;

_clothesList ctrlSetEventHandler [ "LBSelChanged", "[_this] spawn AFAL_fnc_clothesShop_select"];

_pivot = "Land_Tyre_F" createVehicleLocal [0,0,0];
hideObject _pivot;
_pivot setPosATL [getPosATLVisual _location select 0, getPosATLVisual _location select 1, getPosATLVisual _location select 2];
_pivot allowDamage false;

shopMannequin =  "C_Soldier_VR_F" createVehicleLocal [0,0,0];
shopMannequin attachTo [_pivot, [0, 0, 0.4]];
shopMannequin switchMove "Campaign_Base";

_shopCam = "camera" camCreate (_location modelToWorld [ 0, 3, 1.5]);
_shopCam camSetTarget (_location modelToWorld [ 0, 0, 1]);
_shopCam cameraEffect ["internal", "back"];
_shopCam camPrepareFov 0.9;
_shopCam camCommitPrepared 0;

_dir = getDir _pivot;

waitUntil {

	_dir = _dir + (
		if (_dir > 360) then [{-360},{1.25}]
	);
	_pivot setDir _dir;

	isNull (findDisplay 4000);
};

shopType = nil;
shopValue = nil;
shopSelect = nil;

{deleteVehicle _x} forEach [_pivot, shopMannequin];

player cameraEffect ["terminate","back"];
camDestroy _shopCam;
