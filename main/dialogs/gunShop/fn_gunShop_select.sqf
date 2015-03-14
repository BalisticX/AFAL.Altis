/*
	File: AFAL_gunShop_select.sqf
	Author: Ballistic
	
	Description:
	Executes when you select a weapon option at the gun shop for After Altis
*/

disableSerialization;

if ( !isNull shopHolder) then { deletevehicle shopHolder};
_selection = [ _this, 1, [], [[]]] call BIS_fnc_param;

_dialog = findDisplay 3000;
_control = _selection select 0;
_index = _selection select 1;
_extraList = _dialog displayCtrl 3015;
_price = _dialog displayCtrl 3001;
_magAmount = _dialog displayCtrl 3002;

_value = lbValue [3017,(lbCurSel 3017)];
_class = lbData[3017,(lbCurSel 3017)];

_extraArray = [_class] call AFAL_fnc_gunShop_extra;

lbClear _extraList;

{
	_extraIndex = _extraList lbAdd format[ "%1", (_x select 0)];
	_extraList lbSetValue [_extraIndex, (_x select 1)];	
	_extraList lbSetData [_extraIndex, (_x select 2)];
	_extraList lbSetToolTip [_extraIndex, (_x select 3)];
	_extraList lbSetPicture [_extraIndex, (_x select 4)];
	_extraList lbSetPictureColor [_extraIndex, [1, 1, 1, 1]];
} forEach _extraArray;

magCount = 0;
shopValue = _value;
shopSelect = [
	["", 0, ""],
	["", 0, ""],
	["", 0, ""]
	];

_price ctrlSetText format ["$ %1", shopValue];
_magAmount ctrlSetText format ["%1", magCount];

shopHolder = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
shopHolder addWeaponCargo [_class, 1];
shopHolder attachTo [shopPivot, [0, -0.63, 1.3]];
shopHolder setVectorDirAndUp [[0,0,1],[0,-1,0]];

extraHolder = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
extraHolder attachTo [shopLocation, [-0.025, 0, 1.08]];
