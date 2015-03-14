/*
	File: fn_eyePos.sqf
	Author: Nuke
	
	Description:
	Used for determining if a player is looking at an ATM in After Altis
*/

_objects = lineIntersectsObjs [ eyePos player, eyePos player vectorAdd ((eyeDirection player) vectorMultiply 5), objNull, objNull, true, 2];

if (count _objects == 0) exitWith { objNull };

_cursorTarget = _objects select 0;

if ((str _cursorTarget) find ": atm_" == -1 && {{_cursorTarget isKindOf _x} count afal_atms == 0}) exitWith {objNull};

_cursorTarget;
