/*
	File: fn_restrained.sqf
	Author: Ballistic
	
	Description:
	The animation and effect of being restrained in AfterAltis
*/

/*
	File: AFAL_restrained.sqf
	Author: Ballistic
	
	Description:
	The animation and effect of being restrained in AfterAltis
*/

private ["_target", "_source", "_item"];

_target = [ _this, 0, player, [objNull]] call BIS_fnc_param;
_source = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
_item = [ _this, 0, "", [""]] call BIS_fnc_param;

if (isRestrained) exitWith {};
	isRestrained = true;

[[ player, "playMove", "AmovPercMstpSnonWnonDnon_Ease"],"AFAL_fnc_NWAnimation", true, false] spawn AFAL_fnc_MP;
	sleep 0.7; 
player allowDamage false;
player enableSimulation false;

/*
player addAction ["Release", {isRestrained = false},"",4,false,true,"","_this distance _target < 3"];

////
I know that addAction is local to the machine it was created on so what i need is the addAction to be added
locally on any player that is within 100m of the restrained player. Then once they activate the "Release"
action it will bounce back to this script and finish it. Will that work Nuke?
////

waitUntil {!isRestrained};

player allowDamage true;
player enableSimulation true;
*/
