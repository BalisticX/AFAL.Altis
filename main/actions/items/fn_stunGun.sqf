/*
	File: fn_stunGun.sqf
	Author: Ballistic 
	
	Description:
	Stun gun animation and effects for After Altis
*/

player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_end";

_stunGun = "Land_MobilePhone_old_F" createVehicle [0,0,0];
	_stunGun allowDamage false;
	_stunGun attachTo [player, [ 0, 0, -0.1], "RightHand"];
	_stunGun setVectorUp [0,0,-1];
	
sleep 0.5;
	
_electric = "#particlesource" createVehicle (getPos _stunGun);
[["StunGun", _stunGun, _electric], "AFAL_fnc_NWEffects", true, false] spawn AFAL_fnc_MP;

sleep 1;

if (!isNull cursorTarget && cursorTarget isKindOf "Man") then {
	[[],"AFAL_fnc_tazed",cursorTarget,false] call AFAL_fnc_MP
};

sleep 1;

{ deleteVehicle _x} forEach [_stunGun, _electric];
