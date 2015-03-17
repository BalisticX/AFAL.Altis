/*
	File: AFAL_Tazed.sqf
	Author: Nuke & Ballistic
	
	Description:
	Ragdoll tazing effect for AfterAltis
*/

private ["_electric", "_rag", "_velocity", "_dir", "_speed"];

_unit = [_this,0,objnull,[objnull]] call BIS_fnc_param;
if(isTazed) exitWith {};
isTazed = true;
_electric = "#particlesource" createVehicle (getPos _unit);
[["Tazed",_unit,_electric],"AFAL_fnc_NWEffects",true,false] spawn AFAL_fnc_mp;	

_unit allowDamage false;
_velocity = velocity _unit;
_dir = getDir _unit;
_speed = 5;
_rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
	_rag setMass 1e10;	
	_rag attachTo [_unit, [0,0,0], "Spine3"];
	_rag setVelocity [(_velocity select 0) + (sin _dir * _speed), (_velocity select 1) + (cos _dir * _speed), (_velocity select 2) + 10];

detach _rag;  
0 = _rag spawn
{
	deleteVehicle _this;
};
sleep 6;
isTazed = false;
_unit allowDamage true;
deleteVehicle _electric;
