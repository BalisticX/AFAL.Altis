/*
	File: fn_NWEffects.sqf
	Author: Nuke & Ballistic
	
	Description:
	Broadcasts particle effects over to other players.

*/

private ["_type", "_object", "_particle1", "_particle2", "_particle3", "_vectorX", "_vectorY"];

_type = [ _this, 0, "", [""]] call BIS_fnc_param;
_object = [ _this, 1, objNull, [objNull]] call BIS_fnc_param;
_particle1 = [ _this, 2, ObjNull, [ObjNull]] call BIS_fnc_param;
_particle2 = [ _this, 3, ObjNull, [ObjNull]] call BIS_fnc_param;
_particle3 = [ _this, 4, ObjNull, [ObjNull]] call BIS_fnc_param;

if (_type == "") exitWith {};

_vectorX = vectorDir player select 0;
_vectorY = vectorDir player select 1;

switch (_type) do{

	case "MJSmoke" : {
		_particle1 setParticleCircle [0, [0, 0, 0]];
		_particle1 setParticleRandom [1, [0.05, 0.05, 0], [0.05, 0.05, 0.05], 0, 0.1, [0, 0, 0, 0.2], 0, 0];
		_particle1 setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 2.5, [0, 0.07, 0.1], [0, 0, 0.3], 0, 10, 7.9, 0.01, [0.25, 0.75, 1.5], [[0.6, 0.6, 0.6, 0.4], [0.6, 0.6, 0.6, 0.3], [0.4, 0.4, 0.4, 0.2], [0.4, 0.4, 0.4, 0]], [0.08], 0.5, 0.05, "", "", _object];
		_particle1 setDropInterval 1.4;
	};
	
	case "CigSmoke" : {
		_particle1 setParticleCircle [0, [0, 0, 0]];
		_particle1 setParticleRandom [1, [0.05, 0.05, 0], [0.05, 0.05, 0.05], 0, 0.1, [0, 0, 0, 0.2], 0, 0];
		_particle1 setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 2.5, [0, 0.07, 0.1], [0, 0, 0.3], 0, 10, 7.9, 0.01, [0.25, 0.75, 1.5], [[0.01, 0.01, 0.01, 0.8], [0.01, 0.01, 0.01, 0.4], [0.01, 0.01, 0.01, 0]], [0.08], 0.5, 0.05, "", "", _object];
		_particle1 setDropInterval 1.4;
	};
	
	case "Grinder" : {
	  	_particle1 setParticleCircle [0, [0, 0, 0]];
		_particle1 setParticleRandom [0, [0, 0, 0], [0.75, 0.75, 0], 1, 0.25, [0.2, 0.1, 0, 0.5], 0, 0.5];
		_particle1 setParticleParams [["\A3\data_f\Cl_water", 1, 1, 1], "", "Billboard", 1, 0.6, [0, 0, 0], [0, 0, 1], 0, 10, 7.9, 0.0001, [0.2, 0.4, 0.8], [[1, 0.2, 0, 0.7], [1, 0.25, 0, 0.35], [1, 0.3, 0, 0]], [0.08], 0.25, 1, "", "", _object];
		_particle1 setDropInterval 0.01;

		_particle2 setParticleCircle [0, [0, 0, 0]];
		_particle2 setParticleRandom [0, [0, 0, 0], [0.75, 0.75, 0], 1, 0.25, [0.2, 0.1, 0, 0.5], 0, 0.5];
		_particle2 setParticleParams [["\A3\data_f\Cl_water", 1, 1, 1], "", "Billboard", 1, 0.6, [0, 0, 0], [0, 0, 1], 0, 10, 7.9, 0.0001, [0.2, 0.4, 0.8], [[1, 0.6, 0, 0.5], [1, 0.7, 0, 0.25], [1, 0.8, 0, 0]], [0.08], 0.25, 1, "", "", _object];
		_particle2 setDropInterval 0.01;

		_particle3 setParticleCircle [0, [0, 0, 0]];
		_particle3 setParticleRandom [0, [0, 0, 0], [0.25, 0.25, 0.25], 0.5, 0.5, [0, 0, 0, 0.5], 0, 0];
		_particle3 setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0.3], 0, 10, 7.9, 1e-006, [0.2, 0.3, 0.5], [[0.1, 0.1, 0.1, 0.6], [0.15, 0.15, 0.15, 0.3], [0.2, 0.2, 0.2, 0]], [0.08], 0, 0, "", "", _object];
		_particle3 setDropInterval 0.08;
	};
	
	case "Tazed" : {
		_particle1 setParticleCircle [0, [0, 0, 0]];
		_particle1 setParticleRandom [0, [0.5, 0.4, 0.3], [0.5, 0.5, 0.2], 0.5, 0.05, [0, 0, 0, 0], 0, 0];
		_particle1 setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.3, [0, 0, 0], [0, 0, 0], 0.5, 10, 7.9, 0.075, [0.0008, 0.003], [[1, 1, 1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 0.1, 0.05, "", "", _object];
		_particle1 setDropInterval 0.05;
	};
	
	case "StunGun" : {
		_particle1 setParticleCircle [0, [0, 0, 0]];
		_particle1 setParticleRandom [0, [0.05, 0.05, 0.05], [0.05, 0.05, 0.05], 0.1, 0.01, [0, 0, 0, 0], 0, 0];
		_particle1 setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.15, [0, 0, 0], [0, 0, 0], 0.5, 10, 7.9, 0.075, [0.0004, 0.0015], [[1, 1, 1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 0.1, 0.05, "", "", _object];
		_particle1 setDropInterval 0.05;
	}:
	
	case "Refuel" : {
		_particle1 setParticleCircle [0, [0, 0, 0]];
		_particle1 setParticleRandom [0, [0, 0, 0], [0.25, 0, 0.25], 0, 0, [0, 0, 0, 0.25], 0, 0];
		_particle1 setParticleParams [["\A3\data_f\Cl_water", 1, 0, 1], "", "Billboard", 1, 1.25, [0, 0, 0], [_vectorX * 0.5, _vectorY * 0.5, 1.25], 0, 2, 1, 1e-009, [0.15, 0.3, 0.15, 0.075], [[0, 0, 0.001, 0.8], [0, 0, 0.001, 0.4], [0, 0, 0.001, 0.2]], [0.08], 0.2, 0.2, "", "", _object];
		_particle1 setDropInterval 0.08;
	
		_particle2 setParticleCircle [0, [0, 0, 0]];
		_particle2 setParticleRandom [0.25, [0.1, 0.1, 0.1], [0.25, 0, 0.25], 0, 0, [0, 0, 0, 0.25], 0.5, 0];
		_particle2 setParticleParams [["\A3\data_f\Cl_water", 1, 0, 1], "", "Billboard", 1, 1.5, [0, 0, 0], [_vectorX * 0.5, _vectorY * 0.5, 1.25], 0, 2, 1, 1e-009, [0.05, 0.025, 0.005], [[0, 0, 0.001, 0.6], [0, 0, 0.001, 0.3], [0, 0, 0.001, 0.15], [0, 0, 0.001, 0]], [0.08], 0.05, 0.2, "", "", _object];
		_particle2 setDropInterval 0.05;
	};
	
	case "Headshot" : {
		_particle1 setParticleCircle [0, [0, 0, 0]];
		_particle1 setParticleRandom [0, [0.1, 0.1, 0.1], [0.5, 0.5, 0.5], 0, 0.25, [0, 0, 0, 0.3], 0, 0];
		_particle1 setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 0.25, [0, 0, 0], [0, 0, 0], 0, 2, 1, 0.075, [0.5, 1], [[0.3, 0.02, 0.02, 0.3], [0.2, 0, 0, 0]], [0.08], 1, 0, "", "", _object];
		_particle1 setDropInterval 0.1;	
	};
};
