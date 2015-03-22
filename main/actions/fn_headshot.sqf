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
	hideObject _object;

_mist = "#particlesource" createVehicle (getPos _object);
	_mist setParticleCircle [0, [0, 0, 0]];
	_mist setParticleRandom [0, [0.1, 0.1, 0.1], [0.5, 0.5, 0.5], 0, 0.25, [0, 0, 0, 0.3], 0, 0];
	_mist setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 0.25, [0, 0, 0], [0, 0, 0], 0, 2, 1, 0.075, [0.5, 1], [[0.3, 0.02, 0.02, 0.3], [0.2, 0, 0, 0]], [0.08], 1, 0, "", "", _object];
	_mist setDropInterval 0.1;
	
sleep 0.1;

{deleteVehicle _x} forEach [_object, _mist];
