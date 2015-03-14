/*
	File: AFAL_Tazed.sqf
	Author: Nuke & Ballistic
	
	Description:
	Ragdoll tazing effect for AfterAltis
*/

private ["_electric", "_rag", "_velocity", "_dir", "_speed"];

if (!isTazed) then {
	isTazed = true;

	_electric = "#particlesource" createVehicleLocal (getPos player);
		_electric setParticleCircle [0, [0, 0, 0]];
		_electric setParticleRandom [0, [0.5, 0.4, 0.3], [0.5, 0.5, 0.2], 0.5, 0.05, [0, 0, 0, 0], 0, 0];
		_electric setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.3, [0, 0, 0], [0, 0, 0], 0.5, 10, 7.9, 0.075, [0.0008, 0.003], [[1, 1, 1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 0.1, 0.05, "", "", player];
		_electric setDropInterval 0.05;
	
	player allowDamage false;
	_velocity = velocity player;
	_dir = getDir player;
	_speed = 5;
	_rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
		_rag setMass 1e10;	
		_rag attachTo [player, [0,0,0], "Spine3"];
		_rag setVelocity [(_velocity select 0) + (sin _dir * _speed), (_velocity select 1) + (cos _dir * _speed), (_velocity select 2) + 10];

	detach _rag;  
	0 = _rag spawn
	{
		deleteVehicle _this;
	};
		sleep 7.5;
	player allowDamage true;
	deleteVehicle _electric;
	isTazed = false;
} else {

	player allowDamage true;
	isTazed = false;
	
};
