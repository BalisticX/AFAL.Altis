/*
	File: fn_placement.sqf
	Author: Ballistic
	
	Description:
	Function for using and placing certain object in After Altis
	
	Parameters:
	0 : STRING AFAL classname of the object to be placed
*/

private ["_item", "_total", "_info", "_object"];

_item = [ _this, 0, "", [""]] call bis_fnc_param;
	if (_item == "") exitWith {};
	
if (isPlacing) exitWith {	systemChat "You need to place your current object"	};
	isPlacing = true;
	
//_total = missionNamespace getVariable _item;
//missionNamespace setVariable [ _item, (_total - 1)];

_info = [_item] call AFAL_fnc_masterItems;

_object = (_info select 0) createVehicle [0,0,0];
	_object allowDamage false;

placeOffset = 0.75;
placeDir = [[ 0, 90, 180, 270, 360], getDir player] call BIS_fnc_nearestNum;

waitUntil {
	_object setPos (player modelToWorld [ 0, 2, placeOffset]);
	_object setDir placeDir;
	!isPlacing || !alive player;
};

_object allowDamage true;
placeOffset = nil;
placeDir = nil;
