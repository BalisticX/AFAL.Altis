/*
	File: fn_itemShop_qty.sqf
	Author: Nuke
*/

disableSerialization;

_menuText = [_this,0,0,[0]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;
_menu = [_this,2,0,[0]] call BIS_fnc_param;
_data = [_this,3,0,[0]] call BIS_fnc_param;
_total = [_this,4,0,[0]] call BIS_fnc_param;

_dialog = findDisplay _menu;
_number = _dialog displayCtrl _menuText;
_money = _dialog displayCtrl _total;
_selectedAmount = ctrlText _menuText;
_selectedAmount = parseNumber (_selectedAmount);

_itemCost = lbValue [_data,lbCurSel _data];

switch (_type) do {
	case "Add": {
		_selectedAmount = _selectedAmount + 1;
		_number ctrlSetText format [ "%1", _selectedAmount];
		_money ctrlSetText format [ "$ %1", (_itemCost * _selectedAmount)];
	};
	
	case "Sub" : {
		if(_selectedAmount < 2) exitWIth {};
		_selectedAmount = _selectedAmount - 1;
		_number ctrlSetText format [ "%1", _selectedAmount];
		_money ctrlSetText format [ "$ %1", (_selectedAmount * _itemCost)];
	};
};
