/*
	File: fn_workChurch.sqf
	Author: Ballistic
	
	Description:
	Animations and effects for praying in a church for After Altis
*/

private ["_church", "_prayerCam", "_rain", "_bounce"];
_church = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;

titleCut ["", "BLACK OUT", 0.5];
sleep 0.5;
player playMove "AmovPercMstpSnonWnonDnon_Scared2";

_prayerCam = "camera" camCreate (_church modelToWorld [ -9, 0, 1]);
	_prayerCam camSetTarget (player);
	_prayerCam cameraEffect ["internal", "back"];
	_prayerCam camPrepareFov 1.5;
_prayerCam camCommitPrepared 0;

titleCut ["", "BLACK IN", 1.5];

_prayerCam camPreparePos (_church modelToWorld [ -4, 0, 6]);
	_prayerCam camPrepareFov 0.3;
	_prayerCam camCommitPrepared 14;

	sleep 10; 
player playMove "AinvPknlMstpSnonWnonDr_medicUp1";
	sleep 4.85;
player playMove "AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";
	sleep 3;
player cameraEffect ["terminate","back"];
camDestroy _prayerCam;
	sleep 0.25;

systemChat "Good Job!";		//// Take this out when we implement sanity - B	

_rain = "#particlesource" createVehicleLocal (getPos player);
	_rain setParticleCircle [0, [0, 0, 0]];
	_rain setParticleRandom [0, [2, 2, 2], [0, 0, 0], 0, 0.25, [0, 0, 0, 0.5], 0, 0];
	_rain setParticleParams [["\A3\data_f\Cl_water", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 3], [0, 0, -2], 0, 2, 1, 0.1, [0.05], [[1, 1, 0.3, 1], [1, 1, 0.3, 0.5], [1, 1, 0.3, 0]], [0.08], 1, 0, "", "", player];
	_rain setDropInterval 0.03;
	
	sleep 1.25;	
	
_bounce = "#particlesource" createVehicleLocal (getPos player);
	_bounce setParticleCircle [0, [0, 0, 0]];
	_bounce setParticleRandom [0, [0.25, 0.25, 0.25], [1, 1, 1], 0, 0.25, [0, 0, 0, 0.5], 0, 0];
	_bounce setParticleParams [["\A3\data_f\Cl_water", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 1.5], [0, 0, 0], 0, 2, 1, 0.1, [0.05, 0.025], [[1, 1, 0.3, 1], [1, 1, 0.3, 0.5], [1, 1, 0.3, 0]], [0.08], 1, 0, "", "", player];
	_bounce setDropInterval 0.075;

	sleep 5;
{deleteVehicle _x} forEach [_rain, _bounce];
