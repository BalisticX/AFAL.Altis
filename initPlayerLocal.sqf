/*
	File: initPlayerLocal.sqf
	Author: Ballistic
	
	Description:
	initPlayerLocal for AFAL Kavala Map
*/

isTazed = false;
isDrugged = false;
isClimbing = false;

damageHandle = compile preprocessFile "AFAL_handleDamage.sqf";

waitUntil {!(isNull player)};
player addEventHandler [ "handleDamage", {_this call damageHandle}];
	systemChat "Taze Handle Created";

waitUntil {!isNull findDisplay 46};
_AFAL_climb = (findDisplay 46) displayAddEventHandler [ "KeyDown", "if (_this select 1 == 20) then {execVM 'AFAL_climb.sqf'}"];
	systemChat "Climbing Handle Created";

sepiaEffect = ppEffectCreate ["colorCorrections", 1517];
sepiaEffect ppEffectEnable true;
sepiaEffect ppEffectAdjust [ 0.8, 0.95, 0, [ 0.1, 0.2, 0.3, -0.4], [ 1, 1, 0.7, 0.48], [ 0.5, 0.2, 0, 1]];
sepiaEffect ppEffectCommit 0;
	systemChat "AFAL effects defined";

_dust = "#particlesource" createVehicleLocal (getpos player);     
_dust setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 5, [2, 2, 0], [0, 4, 0.5], 1, 10, 8, 0.075, [2, 3, 4], [[0.1, 0.1, 0.1, 0.1], [0.25, 0.25, 0.25, 0.05], [0.4, 0.4, 0.4, 0.01], [0.5, 0.5, 0.5, 0]], [0.08], 0.5, 1, "", "", player];
_dust setParticleRandom [0, [0.25, 0.25, 0], [1, 1, 1], 0, 1, [0, 0, 0, 0.5], 0, 0];
_dust setParticleCircle [20, [0.5, 0, 0.1]];  
_dust setDropInterval 0.07;
  systemChat "AFAL dust particles created"
  
