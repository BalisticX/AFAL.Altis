/*
	File: fn_zipLine_ammo.sqf
	Author: Terminal
	
	Description:
	Enables the player to launch a zipline from their UGL weapon in After Altis
	
	Parameters:
	0: STRING AFAL classname of zipline ammo
*/

private ["_item", "_total"];

_item = [ _this, 0, "", [""]] call BIS_fnc_param
	if (_item == "") exitWith {};
	
_total = missionNamespace getVariable _item;
missionNamespace setVariable [ _item, (_total - 1)];

player playMove "DismountSide";
	sleep 1;
_rope = "Land_Rope_01_F" createVehicle [0,0,0];
	_rope allowDamage false;
	_rope attachTo [ player, [0,0,0], "RightHand"];
	sleep 8;
deleteVehicle _rope;
	sleep 1;
	
systemChat "UGL zipline equipped";

canZipline = true;
