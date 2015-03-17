/*
	File: fn_restrain.sqf
	Author: Ballistic
	
	Description:
	Action for restraining someone also activates the restraint on cursorTarget for AfterAltis
*/

private ["_item", "_restrainItems", "_object"];

_item = [ _this, 0, "", [""]] call BIS_fnc_param;
	if (isNull _item) exitWith {};

_restrainItems = ["AFAL_ductTape", "AFAL_rope", "AFAL_zipTie", "AFAL_handcuffs"];
	if (_item in _restrainItems > 0) exitWith {};

_class = [_item] call AFAL_fnc_items;

_object = (_class select 0) createVehicle [0,0,0];
_object attachTo [player, [0,0,0], "RightHand"];

player switchMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";

sleep 0.8;

deleteVehicle _object;

if (isNull cursorTarget) exitWith {} else {
	[[cursorTarget, player, _item],"AFAL_fnc_restrained", cursorTarget, false, false] call AFAL_fnc_MPexec;
};
