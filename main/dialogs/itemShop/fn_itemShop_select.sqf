/*
	File: fn_itemShop_select.sqf
	Author: Ballistic
	
	Description:
	Executes when you select an item option at the item shop for After Altis
*/

disableSerialization;

_dialog = findDisplay 5000;
_price = _dialog displayCtrl 5001;
_shopAmount = _dialog displayCtrl 5002;
_sell = _dialog displayCtrl 5004;

_shopQtyAmount = ctrlText 5002;
_shopQtyAmount = parseNumber (_shopQtyAmount);
_playerQtyAmount = ctrlText  5003;
_playerQtyAmount = parseNumber (_playerQtyAmount);

_shopValue = lbValue [5017, (lbCurSel 5017)];
_playerValue = lbValue [5015, (lbCurSel 5015)];

_item = lbData [5017, (lbCurSel 5017)];
_class = [_item] call AFAL_fnc_items;

_price ctrlSetText format ["$ %1", (_shopValue * _shopQtyAmount)];

_sell ctrlSetText format ["$ %1", (_playerValue * _playerQtyAmount)];

shopObject = (_class select 0) createVehicleLocal [0,0,0];
shopObject enableSimulation false;
shopObject attachTo [shopPivot, [ 0, 0, 1.2]]; 
