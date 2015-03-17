/*
	File: fn_spawn.sqf
	Author: Ballistic 
	
	Description:
	You're in a house, wearing unfamiliar clothes and about to start playing AfterAltis
*/

private ["_spawnCam", "_uniformList", "_houseList", "_uniform", "_house"];

playMusic "Theme";

player enableSimulation false;
player allowDamage false;

cutText ["", "BLACK FADED", 0];
	sleep 3;
	
_spawnCam = "camera" camCreate (IntroCastle modelToWorld [ 0, 0, 0]);
	_spawnCam camSetTarget IntroTarget1;
	_spawnCam cameraEffect ["internal", "back"];
	_spawnCam camPrepareFov 0.7;
	_spawnCam camCommitPrepared 0;

_houseList = nearestObjects [(getMarkerPos "KavalaCenter"), [
	"Land_i_Addon_02_V1_F", "Land_u_Addon_02_V1_F", 
	"Land_i_House_Small_02_V1_F", "Land_i_House_Small_01_V1_F", 
	"Land_i_House_Big_01_V1_F", "Land_i_House_Big_02_V1_F"], 700];

cutText ["", "BLACK IN", 5];

_spawnCam camSetTarget IntroTarget2;
	_spawnCam camCommitPrepared 10;
	
	sleep 8.5;
cutText ["", "BLACK OUT", 1.5];
	sleep 1.5;

_spawnCam camPreparePos (IntroScrap modelToWorld [ -7, -10, 1]);
	_spawnCam camSetTarget IntroScrapTarget;
	_spawnCam camPrepareFOV 0.7;
	_spawnCam camCommitPrepared 0;

cutText ["", "BLACK IN", 1.5];

_spawnCam camPreparePos (IntroScrap modelToWorld [ 7, -10, 1]);
	_spawnCam camCommitPrepared 10;
	
	sleep 1.5;
("AFAL_title" call BIS_fnc_rscLayer) cutRsc ["AFAL_title", "PLAIN", 3];
	sleep 7;
cutText ["", "BLACK OUT", 1.5];
	sleep 1.5;
	
_house = _houseList select floor random count _houseList;

_spawnCam camPreparePos (_house modelToWorld [ 0, 15, 800]);
	_spawnCam camSetTarget _house;
	_spawnCam camPrepareFOV 4;
	_spawnCam camCommitPrepared 0;
	
("AFAL_title" call BIS_fnc_rscLayer) cutFadeOut 1.5;
	sleep 3;
cutText ["", "BLACK IN", 10];

_spawnCam camPreparePos (_house modelToWorld [ 0, 15, 10]);
	_spawnCam camPrepareFOV 0.7;
	_spawnCam camCommitPrepared 10;
	
if (_house isKindOf "Land_i_House_Small_02_V1_F") then {player setPos (_house modelToWorld [ -1.5, 0, 0])} else {
	if (_house isKindOf "Land_i_House_Small_01_V1_F") then {player setPos (_house modelToWorld [ -1.5, -1.5, 0])} else {
		if (_house isKindOf "Land_i_House_Big_01_V1_F") then {player setPos (_house modelToWorld [ 0, -1, 0])} else {
			if (_house isKindOf "Land_i_House_Big_02_V1_F") then {player setPos (_house modelToWorld [ 0, 2.5, 0])} else {
				if (_house isKindOf "Land_i_Addon_02_V1_F" || _house isKindOf "Land_u_Addon_02_V1_F") then {player setPos (_house modelToWorld [ 0, 2, 0])}
			}
		}
	}
};

_uniformList = ["U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour", "U_C_Poloshirt_salmon", "U_C_Poloshirt_redwhite"];
_uniform = _uniformList select floor random count _uniformList;
removeUniform player;
removeHeadgear player;
player forceAddUniform _uniform;

player enableSimulation true;
player setDir (random 360);
	sleep 12;
cutText ["", "BLACK OUT", 1.5];
	sleep 1.5;
player cameraEffect ["terminate","back"];
camDestroy _spawnCam;
	sleep 1.5;
cutText ["", "BLACK IN", 1.5];
player switchMove "Acts_UnconsciousStandUp_part1";
	sleep 40;
player allowDamage true;
player switchMove "";
player setDir (getDir player - 200);
