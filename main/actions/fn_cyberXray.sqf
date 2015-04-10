/*
	File: fn_cyberXray.sqf
	Author: Ballistic
	
	Description:
	Surveillance camera system in police command center for After Altis
*/

private ["_dialog", "_name", "_time", "_cameraList", "_location", "_xray", "_grain", "_colour"];

disableSerialization;

_dialog = findDisplay 1910;
	if (isNull _dialog) exitWith {};
_name = _dialog displayCtrl 1911;
_time = _dialog displayCtrl 1912;

[] call BIS_fnc_VRFadeIn;

switch (xrayCircut) do {
	case "Police" : {	_cameraList = [
			[camera_policeNorth, target_policeNorth, 1.2, "NORTH GATE"],
			[camera_policeEast, target_policeEast, 0.4, "EAST GATE"],
			[camera_policeSouth, target_policeSouth, 0.8, "SOUTH GATE"],
			[camera_policeHeli, target_policeHeli, 0.8, "HELICOPTERS"],
			[camera_policeCar, target_policeCar, 0.8, "VEHICLES"],
			[camera_policeComm, target_policeComm, 0.8, "COMMAND CENTER"],
			[camera_policeExt1, target_policeExt1, 0.6, "EXTERIOR - SOUTH"],
			[camera_policeExt2, target_policeExt2, 0.8, "EXTERIOR - EAST"],
			[camera_policeInt1, target_policeInt, 1, "INTERIOR - EVIDENCE"],
			[camera_policeInt2, target_policeInt, 1, "INTERIOR - SECURITY"],
			[camera_policeInt3, KavalaGunPolice, 1.2, "ARMOURY"]
		];
	};
	case "Bank" : {		_cameraList = [
			[camera_bankRoad, target_bankRoad, 1, "EXTERIOR - ROAD"],
			[camera_bankExt1, target_bankExt, 0.7, "EXTERIOR - EAST"],
			[camera_bankExt2, target_bankExt, 0.7, "EXTERIOR - WEST"],
			[camera_bankInt3, target_bankExt, 0.7, "MAIN ENTRANCE"],
			[camera_bankInt1, target_bankInt, 0.7, "INTERIOR - ATMS"],
			[camera_bankInt2, target_bankInt, 0.7, "INTERIOR - TELLERS"],
			[camera_bankStairs, target_bankStairs, 1, "INTERIOR - STAIRS"],
			[camera_bankVault, target_bankVault, 1, "BANK VAULT"]
		];	
	};
	case "Jail" : {		_cameraList = [
		];	
	};
	case "Hospital" : {	_cameraList = [
			[camera_hospitalHeli, KavalaVehicleMedicHeli, 0.8, "HELIPAD"]
		];	
	};
	case "Traffic" : {	_cameraList = [
			[camera_trafficBridge, target_trafficBridge, 1, "SOUTH BRIDGE"],
			[camera_trafficMain1, target_trafficMain1, 0.8, "MAIN ROAD - NORTH"],
			[camera_trafficMain2, target_trafficMain2, 0.8, "MAIN ROAD - SOUTH"],
			[camera_bankRoad, target_bankRoad, 0.8, "BANK ROAD - NORTH"],
			[camera_trafficLimit, target_trafficLimit, 0.8, "CITY LIMITS"]
		];	
	};
	case "ATM" : {		_cameraList = [
		];
	};
};
_cameraList;

if (xrayCount < 0) then {
	xrayCount = (count _cameraList) - 1;
} else {
	if (xrayCount >= count _cameraList) then {
		xrayCount = 0;
	};
};

_location = _cameraList select xrayCount;

_name ctrlSetText format ["%1", _location select 3];
	
_xray = "camera" camCreate ((_location select 0) modelToWorld [ 0, -0.5, 0]);
	_xray camSetTarget ((_location select 1) modelToWorld [ 0, 0, 0.5]);
	_xray cameraEffect ["internal", "back"];
	_xray camPrepareFov (_location select 2);
	_xray camCommitPrepared 0;
	showCinemaBorder false;
	
_grain = ppEffectCreate ["FilmGrain", 2170];
	_grain ppEffectEnable true;
	_grain ppEffectAdjust [0.5, 0, 3, 0.05, 0.05, true];
	_grain ppEffectCommit 0;
	
_colour = ppEffectCreate ["colorCorrections", 1670];
	_colour ppEffectEnable true;
	_colour ppEffectAdjust [ 0.75, 0.5, 0, [0, 0, 0, 0.72],[5, 5, 5, -0.48],[0.2, 0.59, 0.11, 0]];
	_colour ppEffectCommit 0;
	
waitUntil {		
	_time ctrlSetText format ["%1", [daytime] call BIS_fnc_TimeToString];
	isNull _dialog || !alive player;
};

player cameraEffect ["terminate","back"];
camDestroy _xray;

{	ppEffectDestroy _x	} forEach [_grain, _colour];
