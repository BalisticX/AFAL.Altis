/*
	File: fn_workChurch.sqf
	Author: Ballistic
	
	Description:
	Animations for praying at church for After Altis
*/

_church = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;

titleCut ["", "BLACK OUT", 0.5];
	sleep 0.5;
player playMove "AmovPercMstpSnonWnonDnon_Scared2";

_prayercam = "camera" camCreate (_church modelToWorld [ -9, 0, 1]);
	_prayercam camSetTarget (player);
	_prayercam cameraEffect ["internal", "back"];
	_prayercam camPrepareFov 1.5;
	_prayercam camCommitPrepared 0;

titleCut ["", "BLACK IN", 1.5];

_prayercam camPreparePos (_church modelToWorld [ -4, 0, 6]);
	_prayercam camPrepareFov 0.3;
	_prayercam camCommitPrepared 14;

	sleep 10;
player playMove "AinvPknlMstpSnonWnonDr_medicUp1";
	sleep 4.85;
player playMove "AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";
	sleep 3;
player cameraEffect ["terminate","back"];
camDestroy _prayercam;
