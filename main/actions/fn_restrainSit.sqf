/*
	File: fn_restrainSit.sqf
	Author: Ballistic
	
	Description:
	Seated restraint for After Altis
*/

private ["_target", "_anim"];

_target = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
	if (isNull _target) exitWith {};
	
_target setVariable ["Restrain", true, true];

_target switchMove "AmovPercMstpSnonWpstDnon_AmovPsitMstpSnonWpstDnon_ground";

sleep 0.65;

waitUntil {
	_target switchMove "Acts_AidlPsitMstpSsurWnonDnon_loop";
	!(_target getVariable "Restrain") || !alive _target;
};

_target switchMove "Acts_AidlPsitMstpSsurWnonDnon_out";
_target setVariable ["Restrain", false, true];
	systemChat "You have been released";
