/*
	File: fn_lockpick.sqf
	Author: Ballistic
	
	Description:
	Creates lockpicking dialog, generates the random number and waits for you to win the minigame for After Altis
*/

if (!dialog) then {createdialog "AFAL_lockpick";};

disableSerialization;

_dialog = findDisplay 1700;

lockpickNum = round (random 100);
lockpickStrike = 0;

waitUntil {
	isNull _dialog;
};

lockpickNum = nil;
lockpickStrike = nil;
