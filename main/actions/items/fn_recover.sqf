/*
	File: fn_recover.sqf
	Author: Ballistic
	
	Description:
	Function for recovering relic boxes from underwater wrecks After Altis
	
	Parameters:
	0 : OBJECT The box that is being retrived
	1 : STRING AFAL classname of relic to be recovered
*/

private ["_object", "_type", "_total", "_time"];

_object = [ _this, 0, objNull, [objNull]] call bis_fnc_param;
_type = [ _this, 1, "", [""]] call bis_fnc_param;
	systemChat format ["%1  %2", _object, _type];
	
_object hideObject true;

_info = [_type] call AFAL_fnc_masterItems;

systemChat format ["You have recovered a %1", _info select 1];

_total = missionNamespace getVariable _type;
missionNamespace setVariable [ _type, (_total + 1)];

_time = time + 600;

waitUntil {
	time > _time
	sleep 10;
};

_object hideObject false;
