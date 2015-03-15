/*
	File: fn_dropItems.sqf
	Author: Nuke
	
	Description:
  Used in the player menu when you drop an item or items for After Altis
*/

private ["_item", "_info", "_amount", "_playerItems", "_object"];

_item = lbData [1021,(lbCurSel 1021)];
_info = [_item] call AFAL_fnc_items;

_amount = ctrlText 1022;
_amount = parseNumber (_amount);

_object = (_Info select 0);
_playerItems = missionNameSpace getVariable _item;

missionNameSpace setVariable [ _item, (_playerItems - _amount)];

if( _amount > _playerItems) exitWith {systemChat "You do not have enough to drop"};

_items = _object createVehicle [ 0, 0, 0];
_items setpos (player modelToWorld [ 0, 2, 0]);
_items setVariable [ "items", _item, true];
[] call AFAL_fnc_playerMenu;
