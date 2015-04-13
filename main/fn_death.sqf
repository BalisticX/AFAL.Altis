/*
	File: fn_death.sqf
	Author: Ballistic
	
	Description:
	Function when you are killed, gives time for medics to revive you in After Altis
*/

private ["_victim", "_killer", "_rotate", "_dir", "_deathCam", "_colour", "_blur", "_dialog", "_bar", "_timer", "_button", "_respawn", "_size"];

disableSerialization;

_victim = [ _this, 0, player, [objNull]] call BIS_fnc_param;
_killer = [ _this, 1, objNull, [objNull]] call BIS_fnc_param;

cutText ["", "BLACK OUT", 0.2];
	sleep 0.2;

_victim setDamage 0;
_victim allowDamage false;
_victim switchMove "AinjPpneMstpSnonWnonDnon";
_victim setVariable ["Dying", 1, true];
	sleep 0.1;
_victim enableSimulation false;

_rotate = "Land_Tyre_F" createVehicleLocal [0,0,0];
	_rotate allowDamage false;
	_rotate setPos (_victim modelToWorld [0,0,0]);
	hideObject _rotate;

_spinny = _rotate spawn {
	_dir = getDir _this;
	waitUntil {
		_dir = _dir + (		if (_dir > 360) then [{-360},{0.15}]	);
		_this setDir _dir;
		isNull _this;
	};
};
	
_deathCam = "camera" camCreate (_victim modelToWorld [ 0, -2, 0.8]);
	_deathCam camSetTarget (_victim modelToWorld [ 0, 0, -0.5]);
	_deathCam cameraEffect ["external", "top"];
	_deathCam camPrepareFov 1;
	_deathCam camCommitPrepared 0;
	showCinemaBorder false;
	_deathCam attachTo [ _rotate, [ 0, -2, 0.8]];
	
_colour = ppEffectCreate ["colorCorrections", 1670];
	_colour ppEffectEnable true;
	_colour ppEffectAdjust [ 0.75, 0.5, 0, [0, 0, 0, 0.72],[5, 5, 5, -0.48],[0.2, 0.59, 0.11, 0]];
	_colour ppEffectCommit 0;
	
_blur = ppEffectCreate ["dynamicBlur", 517];
	_blur ppEffectEnable true;
	_blur ppEffectAdjust [0];
	_blur ppEffectCommit 0;

createDialog "deathScreen";

cutText ["", "BLACK IN", 5];

_dialog = findDisplay 100;
_bar = _dialog displayCtrl 101;
_timer = _dialog displayCtrl 102;
_button = _dialog displayCtrl 103;
_revive = _dialog displayCtrl 105;

if (name _killer == name _victim) then { 
	(_dialog displayCtrl 104) ctrlSetText "You killed yourself";
} else { 
	(_dialog displayCtrl 104) ctrlSetText format ["You were killed by %1", name _killer] 
};

{ _x ctrlEnable false } forEach [ _button, _revive ];

_respawn = 100;
_size = [0, 1];

waitUntil {
	_timer ctrlSetText format [ "%1", _respawn ];
	_bar ctrlSetPosition [(_size select 0), safeZoneY + safeZoneH - 0.425, (_size select 1), 0.05];
	_bar ctrlCommit 0;
	_blur ppEffectAdjust [_size select 2];
	_blur ppEffectCommit 0.95;
		sleep 1;
	_size set [ 0, (_size select 0) + 0.005];
	_size set [ 1, (_size select 1) - 0.01];
	_respawn = _respawn - 1;	
	_respawn < 0 || _victim getVariable "Dying" != 1;
};

if ( _victim getVariable "Dying" == 2) then {
	_revive ctrlEnable true;
	_victim switchMove "AinjPpneMstpSnonWnonDnon_rolltofront";
	_victim enableSimulation true;
} else {
	_button ctrlEnable true;
};

waitUntil { _victim getVariable "Dying" == 0 };

closeDialog 100;
ppEffectDestroy [_colour, _blur];
