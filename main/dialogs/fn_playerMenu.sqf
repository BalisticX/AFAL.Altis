/*
	File: fn_playerMenu.sqf
	Author: Ballistic & Nuke
	
	Description:
	Brings up additional crap for player menu
*/

if(!dialog) then {createDialog "AFAL_playerMenu"};

disableSerialization;

_dialog = findDisplay 1000;
_healthValue = _dialog displayCtrl 1011;
_hungerValue = _dialog displayCtrl 1012;
_thirstValue = _dialog displayCtrl 1013;
_inventoryList = _dialog displayCtrl 1021;
_inventoryTarget = _dialog displayCtrl 1023;
_cashValue = _dialog displayCtrl 1031;
_bankValue = _dialog displayCtrl 1032;
_cashTarget = _dialog displayCtrl 1034;

lbclear _inventoryTarget;
lbclear _cashTarget;
lbClear _inventoryList;

_near = [];
{ if(alive _x) then {
		_near set [count _near, _x];
	}
}foreach allunits;

{ if (!isNull _x) then {
	_index = _cashTarget lbAdd format[ "%1", name _x];
	_cashTarget lbSetData [ _index, str(_x)];
	}
}foreach _near;

{
	_indexInv = _inventoryTarget lbAdd format ["%1",name _x];
	_inventoryTarget lbSetData[ _indexInv, str(_x)];
}foreach allunits;

_cashValue ctrlSetText format["$%1", AFAL_money call AFAL_fnc_numberText];
_bankValue ctrlSetText format["$%1", AFAL_bank call AFAL_fnc_numberText];
_healthValue ctrlSetText format ["%1", 100 - (getDammage player  / 0.01)];
_hungerValue ctrlSetText format ["%1",afal_hunger];
_thirstValue ctrlSetText format ["%1",afal_thirst];

{
	_info = [_x] call AFAL_fnc_items;
	_amount = missionNameSpace getVariable _x;
	if(_amount > 0) then
	{
		_inventoryList lbAdd format["%2x %1",(_info select 1), _amount];
		_inventoryList lbSetData [(lbSize _inventorylist) -1,_x];
		_inventoryList lbSetColor [(lbSize _inventorylist) -1,(_info select 6)];
	};
} forEach AFAL_inventory;
