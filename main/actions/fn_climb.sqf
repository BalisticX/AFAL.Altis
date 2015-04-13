/*
	File: fn_climb.sqf
	Author: Ballistic
	
	Description:
	Wall climbing action for AfterAltis
*/

private ["_dir", "_climbCam", "_chance", "_weapon", "_type"];

isClimbing = true;
_dir = getDir player;

_climbCam = "camera" camCreate (player modelToWorld [ 0, -1.15, 2.5]);
	_climbCam camSetTarget (player);
	_climbCam cameraEffect ["external", "back"];
	_climbCam camCommand "manual on";
	_climbCam camPrepareFov 0.7;
	_climbCam camCommitPrepared 0;
	showCinemaBorder false;

player switchMove "GetInHemttBack";
	sleep 3.4;
player setPos (player modelToWorld [0, 2.3, 0.5]);
player setDir _dir;

_chance = floor (random 17);

if (_chance <= 15) then {
	_weapon = currentWeapon player;
	if (_weapon == "") then {
		player switchMove "AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutMedium";
	} else {
		_type = _weapon select [0,1];
		switch (_type) do {
			case "h" : 	{	player switchMove "AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutMedium"	};
			default 	{	player switchMove "AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutMedium"	};
		};
	};
} else {
	player switchMove "aparpercmstpsnonwnondnon_amovppnemstpsnonwnondnon";
};

player cameraEffect ["terminate","back"];
camDestroy _climbCam;
isClimbing = false;
