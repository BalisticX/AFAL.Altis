/*
	File: initServer.sqf
	Author : Nuke & Ballistic
	
	Description:	
  	Sets up server side stuff at mission start for After Altis
*/

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call AFAL_fnc_MPexec};
[] call compile PreprocessFileLineNumbers "\AFAL_brain\init.sqf";

[] spawn AFAL_fnc_wreckSpawn;
[] spawn AFAL_fnc_rotate;
[] spawn AFAL_fnc_cityBarricade;
[] spawn AFAL_fnc_ambientNPC;

{	_x setVariable ["BIS_disabled_Door_1", 1, true]	} forEach [
	jailCell1, jailCell2, jailCell3, jailCell4, 
	jailCell5, jailCell6, jailCell7, jailCell8, 
	jailMedical1, jailMedical2, jailMedical3
	];
	
jailBuilding1 setVariable ["BIS_disabled_Door_3", 1, true];
jailBuilding1 setVariable ["BIS_disabled_Door_4", 1, true];
