/*
	File: AFAL_itemShop.sqf
	Author: Ballistic
	
	Description:
	Creates item shop dialog and sets available inventory for After Altis
*/

private["_location","_type","_dialog","_shopList","_playerList","_price","_value","_itemArray","_items","_index","_shopCam","_dir"];

_location = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
_type = [ _this, 1, "", [""]] call BIS_fnc_param;

if (!isNull shopObject || !isNull shopPivot) then {{deletevehicle _x} foreach [ shopObject, shopPivot]};

shopLocation = _location;
shopType = _type;
shopObject = objNull;
shopReturn = false;

if (!dialog) then {createdialog "itemShop";};

disableSerialization;

_dialog = findDisplay 5000;
_shopList = _dialog displayCtrl 5017;
_playerList = _dialog displayCtrl 5015;
_price = _dialog displayCtrl 5001;
_value = _dialog displayCtrl 5004;

lbClear _shopList;
lbClear _playerList;

_itemArray = [_type] call AFAL_fnc_itemShop_inventory;

if (_type in ["Evidence", "Muesum"]) then {	_itemArray = []	};

_itemArray;
{
	_items = [_x] call AFAL_fnc_items;
	_index = _shopList lbAdd format[ "%1", (_items select 1)];
	_shopList lbSetValue [_index, (_items select 2)];	
	_shopList lbSetData [_index, _x];
	_shopList lbSetToolTip [_index, (_items select 3)];
	_shopList lbSetColor [_index, (_items select 6)];

} forEach _itemArray;

{
	_item = [_x] call afal_fnc_items;
	_amount = missionNamespace getVariable _x;
	if(_amount > 0) then {
		_indexItem = _playerList lbAdd format[ "%2x %1",(_item select 1),_amount];
		_playerList lbSetValue [_indexItem, (_item select 4)];	
		_playerList lbSetData [_indexItem, _x];
		_playerList lbSetToolTip [_indexItem, (_item select 5)];
		_playerList lbSetColor [_indexItem, (_item select 6)];
	};
}foreach _itemArray;

_shopCam = "camera" camCreate (_location modelToWorld [ -2.5, -1, 2]);
	_shopCam camSetTarget (_location modelToWorld [ 0, 0, 1]);
	_shopCam cameraEffect ["internal", "back"];
	_shopCam camPrepareFov 0.7;
	_shopCam camCommitPrepared 0;

shopPivot = "Land_Tyre_F" createVehicleLocal [0,0,0];
hideObject shopPivot;
shopPivot setPosATL [(getPosATLVisual _location select 0) , getPosATLVisual _location select 1, getPosATLVisual _location select 2];
shopPivot allowDamage false;
_dir = getDir shopPivot;

waitUntil {

	_dir = _dir + (
		if (_dir > 360) then [{-360},{1.25}]
	);
	shopPivot setDir _dir;

	isNull (findDisplay 5000);
};

player cameraEffect ["terminate","back"];
camDestroy _shopCam;
{deleteVehicle _x} forEach [shopPivot, shopObject];
