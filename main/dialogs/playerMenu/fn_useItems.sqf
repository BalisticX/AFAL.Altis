/*
	File: fn_useItems.sqf
	Author: Nuke
	
	Description:
	Uses the selected item in the players inventory for After Altis
*/

private ["_item", "_info", "_call"];

_item = lbData [ 1021, (lbCurSel 1021)];
_info = [_item] call AFAL_fnc_items;
_call = _info select 7;

if (_item == "") exitWith { systemChat "You need to select an item to use it"};
if (isNil "_call") exitWith {closeDialog 1000; systemChat "You cannot use this item"};

systemChat format [ "You have used %1", _info select 1];

_call = call compile format ["[_item] %1", _call];

_call;

closeDialog 1000;
