/*
	File: AFAL_gunShop_select.sqf
	Author: Ballistic
	
	Description:
	Executes when you select a weapon option at the gun shop for After Altis
*/

private ["_selection", "_dialog", "_control", "_index", "_extraList", "_price", "_magAmount", "_value", "_class", "_extraArray"];

disableSerialization;

_selection = [ _this, 0, [], [[]]] call BIS_fnc_param;

_dialog = findDisplay 3000;
_control = _selection select 0;
_index = _selection select 1;
_extraList = _dialog displayCtrl 3015;
_price = _dialog displayCtrl 3001;
_magAmount = _dialog displayCtrl 3002;
	_text = _control lbText _index;
	_value = _control lbValue _index;
	_class = _control lbData _index;

magCount = 0;
shopSelect = [["", 0],["", 0],["", 0], "", 0, 0];
//// ShopSelect = [ [ 0: Muzzle "Class", Price], [ 1: Optic "Class", Price], [ 2: Accessory "Class", Price], 3: Weapon "Class", 4: Price, 5: Camo Variant ]	

shopSelect set [ 3, _class];
shopSelect set [ 4, _value];
shopSelect set [ 5, false];

_getExtras = compile preprocessFile "scripts\dialogs\AFAL_gunShop_extra.sqf";

_extraArray = _class call _getExtras;

lbClear _extraList;

{
	_extraIndex = _extraList lbAdd format[ "%1", (_x select 0)];
	_extraList lbSetValue [_extraIndex, (_x select 1)];	
	_extraList lbSetData [_extraIndex, (_x select 2)];
	_extraList lbSetToolTip [_extraIndex, (_x select 3)];
	_extraList lbSetPicture [_extraIndex, (_x select 4)];
	_extraList lbSetPictureColor [_extraIndex, [1, 1, 1, 1]];

} forEach _extraArray;

_price ctrlSetText format ["$ %1", shopSelect select 4];
_magAmount ctrlSetText format ["%1", magCount];

shopHolder = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
	shopHolder attachTo [ shopPivot, [ 0, -0.63, 1.3]];
	shopHolder setVectorDirAndUp [[0,0,1],[0,-1,0]];
	shopHolder addWeaponCargo [(shopSelect select 3), 1];
extraHolder = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
	extraHolder attachTo [ shopPivot, [ 0, -0.63, 1.1]];
	extraHolder setVectorDirAndUp [[0,1,0],[0,0,1]];
