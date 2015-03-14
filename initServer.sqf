/*
  File:	initServer.sqf
	Author :	2Dumb2bu
	
	Description:	
  Gives the server some smarts
*/

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call AFAL_fnc_MPexec};

[] call compile PreprocessFileLineNumbers "\AFAL_brain\init.sqf";
