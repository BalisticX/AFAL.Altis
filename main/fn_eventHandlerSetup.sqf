/*
	File:	EventHandlerSetup.sqf
	Author:		2Dumb2bu
	
	Description:	
	An event handler allows you to automatically monitor and then execute custom code upon particular events being triggered.
*/

player addEventHandler["handleDamage",{ _this call afal_fnc_weaponDamage}];

"afal_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call afal_fnc_MPexec;};
