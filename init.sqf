/*
	File: init.sqf
	Author : Nuke

	Description:	
	Intialization go!
*/

enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if (!isDedicated) then { X_Client = true};

enableSaving [false, false];

StartProgress = true;
