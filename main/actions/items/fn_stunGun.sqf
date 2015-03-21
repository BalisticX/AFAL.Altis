/*
	File: fn_stunGun.sqf
	Author: Ballistic 
	
	Description:
	Stun gun animation and effects for After Altis
*/

player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_end";

_stunGun = "Land_MobilePhone_old_F" createVehicle [0,0,0];
	_stunGun allowDamage false;
	_stunGun attachTo [player, [0,0,0], "RightHand"];
	_stunGun setVectorUp [0,0,-1];
	
sleep 0.5;
	
_electric = "#particlesource" createVehicle (getPos _stunGun);
	_electric setParticleCircle [0, [0, 0, 0]];
	_electric setParticleRandom [0, [0.05, 0.05, 0.05], [0.05, 0.05, 0.05], 0.1, 0.01, [0, 0, 0, 0], 0, 0];
	_electric setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.15, [0, 0, 0], [0, 0, 0], 0.5, 10, 7.9, 0.075, [0.0004, 0.0015], [[1, 1, 1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 0.1, 0.05, "", "", _stunGun];
	_electric setDropInterval 0.05;
	
//// NUKE Please add in NWEffects however that works here

sleep 1;

if (!isNull cursorTarget && cursorTarget isKindOf "Man") then {
	["AFAL_fnc_tazed",cursorTarget,false,false] call AFAL_fnc_MP //// NUKE please proof read this line
};

sleep 1;

{ deleteVehicle _x} forEach [_stunGun, _electric];
