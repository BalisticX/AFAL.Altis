/*
	File: fnc_workFishing.sqf
	Author: Ballistic
	
	Description:
	Animations for fishing for After Altis
*/

private ["_chair", "_pos", "_fishCam", "_fishTypes", "_random", "_pivot", "_fish", "_dir", "_time"];

_chair = _this select 0;
_pos = getPosWorld player;
[[player, "switchMove", "Truck_Cargo04"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp;
player switchMove "Truck_Cargo04";
player setPosWorld [getPosWorld _chair select 0, getPosWorld _chair select 1, (getPosWorld _chair select 2) + 0.22];
player setDir (getDir _chair + 90);

_rod = "Land_RedWhitePole_F" createVehicle [ 0, 0, 0];
	_rod attachTo [ player, [ 0, 0.37, 0.9], "RightHand"];
	_rod setVectorUp [ 0, 0.5, 1];

_fishcam = "camera" camCreate (player modelToWorld [ 15, 6, 1.5]);
	_fishcam camSetTarget (player);
	_fishcam cameraEffect ["internal", "back"];
	_fishcam camPrepareFov 0.7;
	_fishcam camCommitPrepared 0;
_fishcam camPreparePos (player modelToWorld [ -15, 6, 1.5]);
_fishcam camCommitPrepared 30;

	sleep 0.01;
player enableSimulation false;
	sleep 29.79;
player setPosWorld _pos;
deleteVehicle _rod;
player enableSimulation true;
player switchMove "";

player cameraEffect ["terminate","back"];
camDestroy _fishcam;

_fishSelection = ["AFAL_tuna","AFAL_mullet","AFAL_mahi","AFAL_bass","AFAL_mackeral","AFAL_catshark","AFAL_turtle"] call BIS_fnc_selectRandom;

_fishType = [_fishSelection] call AFAL_fnc_items;

_pivot = "Land_Tyre_F" createVehicleLocal [0,0,0];
	_pivot setPosWorld [(getPosWorld _chair select 0) - 2, (getPosWorld _chair select 1) + 1.5, getPosWorld _chair select 2];
	_pivot allowDamage false;
	hideObject _pivot;
_fish = (_fishType select 0) createVehicleLocal [ 0, 0, 0];
	_fish allowDamage false;
	_fish attachTo [ _pivot, [ 0, 0, 1]];
	
systemChat format
[
	"You have caught a %1%2",
	(_fishType select 1),
	(if(_fishSelection == "AFAL_turtle") then {', remeber they are endangered'}else{''})
];
_total = missionNamespace getVariable _fishSelection;
missionNamespace setVariable [_fishSelection,(_total + 1)];
_dir = getDir _pivot;
_time = time + 10;

waitUntil {
	_dir = _dir + (
		if (_dir > 360) then [{-360},{1.25}]
	);
	_pivot setDir _dir;

	time > _time
};

{deleteVehicle _x} forEach [_pivot, _fish];
