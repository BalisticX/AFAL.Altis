/*
	File: fn_climb.sqf
	Author: Ballistic
	
	Description:
	Wall climb action for After Altis
*/

private ["_walls", "_canClimb", "_weapon", "_jumpDown", "_nearObjects"];

isClimbing = true;

_weapon = currentWeapon player;
_jumpDown = "";
if (_weapon == "") then {
_jumpDown = "AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutMedium";
} else {
	_type = _weapon select [0,1];
	switch (_type) do {
		case "h" : {_jumpDown = "AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutMedium"};
		default {_jumpDown = "AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutMedium"};
	};
};

_dir = getDir player;
_climbCam = "camera" camCreate (player modelToWorld [ 0, -1.5, 3]);
	_climbCam camSetTarget (player);
	_climbCam cameraEffect ["internal", "back"];
	_climbCam camPrepareFov 0.7;
	_climbCam camCommitPrepared 0;
[[player,"switchMove","GetInHemttBack"],"afal_fnc_NWAnimation",true,false] spawn afal_fnc_mp;;
sleep 3.4;
player setPos (player modelToWorld [0, 2.3, 0.5]);
player setDir _dir;
_chance = floor (random 17);
if (_chance <= 15) then {
	[[player,"switchMove",_jumpDown],"afal_fnc_NWAnimation",true,false] spawn afal_fnc_mp;
	player cameraEffect ["terminate","back"];
	camDestroy _climbCam;
} else {
	[[player,"switchMove","aparpercmstpsnonwnondnon_amovppnemstpsnonwnondnon"],"afal_fnc_NWAnimation",true,false] spawn afal_fnc_mp;
	player cameraEffect ["terminate","back"];
	camDestroy _climbCam;
};

isClimbing = false;
