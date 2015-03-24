/*
	File: fn_gunShop_gun.sqf
	Author: Ballistic
	
	Description:
	Executes when you remove your selected weapon at the gun shop for After Altis
*/

disableSerialization;

_dialog = findDisplay 3000;
_weaponList = _dialog displayCtrl 3017;
_price = _dialog displayCtrl 3001;
	_index = lbCurSel _weaponList;
	_text = _weaponList lbText _index;
	_value = _weaponList lbValue _index;
	_class = _weaponList lbData _index;
	
if ((shopSelect select 3) == _class) then {
	shopSelect set [ 3, ""];
	shopSelect set [ 4, (shopSelect select 4) - _value];
	_price ctrlSetText format ["%1", shopSelect select 4];
};

deleteVehicle shopHolder;
