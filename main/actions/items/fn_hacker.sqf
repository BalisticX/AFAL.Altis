/*
	File: fn_hacker.sqf
	Author: Terminal & Ballistic
	
	Description:
	Item use for activating the illegal hacker goggles aka WatchDogs for After Altis
*/

private ["_goggles", "_chroma", "_grain", "_inv", "_time", "_nPlayers"];

disableSerialization;

if (isHacking) exitWith {	systemChat "Your hacking device is unusable at this time"	};
	isHacking = true;
	
_goggles = goggles player;
player addGoggles "G_Goggles_VR";

[findDisplay 0] call BIS_fnc_guiEffectTiles;

_chroma = ppEffectCreate ["chromAberration", 217];
	_chroma ppEffectEnable true;
	_chroma ppEffectAdjust [ 0.0075, 0.0075, true];
	_chroma ppEffectCommit 2;
	
_grain = ppEffectCreate ["filmGrain", 2017];
	_grain ppEffectEnable true;
	_grain ppEffectAdjust [0.3, 5, 6, 0.8, 0.8, true];
	_grain ppEffectCommit 2;
	
_inv = ppEffectCreate ["colorInversion", 2517];
	_inv ppEffectEnable true;
	_inv ppEffectAdjust [0.1,0.1,0.1];
	_inv ppEffectCommit 2;
	
	_time = time + 60;

onEachFrame {
	private ["_hackable", "_nObjects", "_info"];
	_hackable = ["Land_Runway_PAPI_3"];	
	_nObjects = nearestObjects [ player, _hackable, 30];

	{	
		switch (typeOf _x) do {
			case "Land_Runway_PAPI_3" : 		{	_info = ["CAMERA", "a3\ui_f\data\IGUI\Cfg\Cursors\watch_ca.paa", 90]	};
		};
		_info;
		
		if ( 	player distance _x < 10 || !(lineIntersects [getPosASL player, getPosATL _x])	) then {
			drawIcon3D [ _info select 1, [1,1,1,1], getPosATL _x, 2.5, 2.5, _info select 2, format ["%1", _info select 0], 0.2, 0.035, "PuristaMedium" ];			
		};
	} forEach _nObjects;
};
	
waitUntil {
	sleep ([5,10] call BIS_fnc_randomInt);
	_nGlitch = nearestObjects [player, ["Man"], 50];
	_nGlitch = _nGlitch - [player];
	{	_chance = [1,3] call BIS_fnc_randomInt;
		if (_chance > 1) then {
			[_x] call BIS_fnc_VRSpawnEffect; sleep 0.5;
		};
	} forEach _nGlitch;
	_time < time || !alive player || goggles player != "G_Goggles_VR";
};

systemChat "Your hacking device is out of charge";
onEachFrame {};
deleteVehicle hackerHead;
{	ppEffectDestroy _x	} forEach [_chroma, _grain, _inv];
player addGoggles _goggles;
isHacking = false;
