/*
	File: fnc_workGrinding.sqf
	Author: Ballistic
	
	Description:
	Animations for grinding job for After Altis
*/

_kit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

[[player, "switchMove", "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp; 
sleep 0.4;

cutText ["", "BLACK OUT", 1.5];

player setPos (_kit modelToWorld [ 0.6, 2, -1]);
player setDir (getDir _kit - 90);

hideObject _kit;

_grinder = "Land_Grinder_F" createVehicleLocal [0,0,0];
	_grinder attachTo [player, [ 0.08, 0.05, -0.03], "LeftHand"];
	_grinder setVectorDirandUp [[ -0.8, -0.5, 0],[ 0.8, 0, -1]];
	
_pos = [getPos _grinder select 0, getPos _grinder select 1, (getPos _grinder select 2) - 0.1];

_sparkOrange = "#particlesource" createVehicleLocal _pos;
_sparkYellow = "#particlesource" createVehicleLocal _pos;
_smoke = "#particlesource" createVehicleLocal _pos;

[["Grinder",_pos,_sparkOrange,_sparkYellow,_smoke],"AFAL_fnc_NWEffects",true,false] spawn AFAL_fnc_mp;

_grindcam = "camera" camCreate (player modelToWorld [ 3, -7, 1]);
	_grindcam camSetTarget (player);
	_grindcam cameraEffect ["internal", "back"];
	_grindcam camPrepareFov 0.3;
	_grindcam camCommitPrepared 0;

cutText ["", "BLACK IN", 1.5];

_grindcam camPreparePos (player modelToWorld [ -1, -7, 1]);
_grindcam camCommitPrepared 25;
	
[[player, "switchMove", "Acts_carFixingWheel"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp;

sleep 0.01;

player EnableSimulation false;

sleep 25;

cutText ["", "BLACK OUT", 1.5];

{
	deleteVehicle _x
} forEach [_grinder, _sparkOrange, _sparkYellow, _smoke];

player cameraEffect ["terminate","back"];
player enableSimulation true;
camDestroy _grindcam;

_kit hideObject false;

cutText ["", "BLACK IN", 1.5];

[[player, "switchMove", "AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp;

sleep 1;

cutText [format["You have been paid $%1 for your work",afal_griding], "PLAIN DOWN", 3, false];
afal_money = afal_money + afal_griding;

sleep 5;

cutText [" ", "PLAIN", 1];
