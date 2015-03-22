/*
	File: fn_headshot.sqf
	Author: Ballistic 
	
	Description:
	Headshot blood effects for After Altis
*/

private ["_object", "_mist"];

_object = "Land_Battery_F" createVehicle [0,0,0];
	_object allowDamage false;
	_object attachTo [player, [ 0, -0.2, 0.15], "Head"];
	hideObjectGlobal _object;

_mist = "#particlesource" createVehicle (getPos _object);
[["Headshot",_object,_mist],"AFAL_fnc_NWEffects",true,false] spawn AFAL_fnc_MP;
	
sleep 0.1;

{deleteVehicle _x} forEach [_object, _mist];
