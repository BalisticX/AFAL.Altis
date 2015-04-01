/*
	File: fn_zipLine_setup.sqf
	Author: Terminal & Ballistic 
	
	Description:
	Fires the rope and sets up the zipline for After Altis
*/

private ["_info", "_unit", "_weapon", "_muzzle", "_ammo", "_projectile", "_dir", "_vel", "_speed", "_rocket", "_zipRope"];

_info = [ _this, 0, [], [[]]] call BIS_fnc_param;

_unit = [ _info, 0, objNull, [objNull]] call BIS_fnc_param;
_weapon = [ _info, 1, "", [""]] call BIS_fnc_param;
_muzzle = [ _info, 2, "", [""]] call BIS_fnc_param;
_ammo = [ _info, 4, "", [""]] call BIS_fnc_param;        
_projectile = [ _info, 6, objNull, [objNull]] call BIS_fnc_param;

if (_muzzle != "GL_3GL_F") exitWith {};     //// Also need to add in a _ammo check when we decide on ammo

	sleep 0.05;

_dir = direction player;
_vel = [(velocity _projectile select 0) * 0.25, (velocity _projectile select 1) * 0.25, (velocity _projectile select 2) * 0.25];
_speed = 10;

_projectile setVelocity [	(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2)	];

_zipEnd = "B_UAV_01_F" createVehicle getPosATL player;
	_zipEnd allowDamage false;
	_zipEnd setObjectTextureGlobal [0, ""];
	_zipEnd attachTo [_projectile, [0,0,0]];
	detach _zipEnd;

deleteVehicle _projectile;

_zipEnd setVelocity [	(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2)	];

_zipRope = ropeCreate [ _zipEnd, [0,0,0.05], 60, 120, true];

_zipStart = "B_UAV_01_F" createVehicle getPosATL player;
	_zipStart allowDamage false;
	_zipStart setObjectTextureGlobal [0, ""];
	_zipStart setDir _dir;
	_zipStart attachTo [player, [ 0.5, 0, 0.1]];
	detach _zipStart;
	_zipStart setVectorUp [0,0,1];
_poleStart = "Metal_Pole_Platform_F" createVehicle [0,0,0];
	_poleStart attachTo [_zipStart, [ 0, -0.9, 1]];
	_poleStart allowdamage false;

[ player, [ 0, 0, 1], [ 0, 0, 0]] ropeAttachTo _zipRope;

waitUntil {		speed _zipEnd < 0.5  };

	sleep 1;
_zipEnd setVectorUp [0,0,1];	
	sleep 0.5;
_poleEnd = "Metal_Pole_Platform_F" createVehicle [0,0,0];
	_poleEnd attachTo [_zipEnd, [ 0, -0.9, 1]];
	_poleEnd allowdamage false;	
	sleep 0.5;
ropeDestroy _zipRope;

private ["_adj", "_opp", "_hyp", "_angle"];

_adj = ((getPosASL _zipStart select 2) + 2) - ((getPosASL _zipEnd select 2) + 2);
_opp = _zipStart distance _zipEnd;
_hyp = sqrt ( (_adj ^ 2) + (_opp ^ 2) );
_angle = atan (_opp / _adj);

_zipLine = ropeCreate [ _zipEnd, [0,0,2], _opp * 0.95];
[ _zipStart, [0,0,2], [0,0,0]] ropeAttachTo _zipLine;

  sleep 0.05;
{	_x setVectorUp [0,0,1]	} forEach [_zipStart, _zipEnd];

canZipline = false;
