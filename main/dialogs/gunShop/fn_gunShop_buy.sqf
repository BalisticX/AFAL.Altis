/*
	File: fn_gunShop_buy.sqf
	Author: Ballistic
	
	Description:
	Executes when you buy the selected items at the gun shop for After Altis
*/

disableSerialization;

_dialog = findDisplay 3000;
_gunList = _dialog displayCtrl 3017;
_extraList = _dialog displayCtrl 3015;

_index = lbCurSel _gunList;
_text = _gunList lbText _index;
_class = _gunList lbData _index;

if ( AFAL_money < shopValue) exitWith { closeDialog 3000; systemChat "Get rich chump"};

_selection = [(shopSelect select 1) select 2, (shopSelect select 0) select 2, (shopSelect select 2) select 2, _class];

_gunHolder = "WeaponHolder_Single_F" createVehicleLocal [0,0,0];
_gunHolder setPosATL [getPosATLVisual shopLocation select 0, getPosATLVisual shopLocation select 1, (getPosATLVisual shopLocation select 2) + 1.08];
 
{
	_gunHolder addItemCargo [_x, 1];
} forEach _selection;

_gunHolder addMagazineCargo [(_extraList lbData 0), magCount];

AFAL_money = AFAL_money - shopValue;

closeDialog 3000;
