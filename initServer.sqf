/*
	File: initServer.sqf
	Author : Nuke & Ballistic
	
	Description:	
  	Gives the server some smarts
*/

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call AFAL_fnc_MPexec};

[] call compile PreprocessFileLineNumbers "\AFAL_brain\init.sqf";

[] spawn AFAL_fnc_cityBarricade; 
