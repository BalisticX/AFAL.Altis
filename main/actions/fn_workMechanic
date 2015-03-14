/*
	File: fnc_workMechanic.sqf
	Author: Ballistic
	
	Description:
	Animations for mechanic job for After Altis
*/

_dir = direction player;

[[player, "switchMove", "AmovPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp;

sleep 1.5;

player setDir (_dir - 180);

_repaircam = "camera" camCreate (player modelToWorld [ 7.5, 5, 1]);
_repaircam camSetTarget (player);
_repaircam cameraEffect ["internal", "back"];
_repaircam camPrepareFov 0.3;
_repaircam camCommitPrepared 0;

_repaircam camPreparePos (player modelToWorld [ -7.5, 5, 1]);
_repaircam camCommitPrepared 36;

for "_a" from 0 to 1 do {
	[[player, "switchMove", "HubFixingVehicleProne_idle1"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp;
	  sleep 18;
};

player setDir _dir; 
[[player, "switchMove", "AmovPpneMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp;

player cameraEffect ["terminate","back"];
camDestroy _repaircam;
cutText [format ["You have been paid $%1 for your work", AFAL_mechanic], "PLAIN DOWN", 3, false];
afal_money = afal_money + AFAL_mechanic;
sleep 5;
cutText [" ", "PLAIN", 1];
