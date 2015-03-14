/*
	File: initPlayerLocal.sqf
	Author: Ballistic
	
	Description:
	initPlayerLocal for AFAL Kavala Map
*/

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call AFAL_fnc_MPexec};

isTazed = false;
isDrugged = false;
isClimbing = false;

AFAL_money = 0;
AFAL_bank = 3000;
AFAL_thirst = 100;
AFAL_hunger = 100;

waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call AFAL_fnc_keyboard"];
	systemChat "Keyboard Handler Created";

AFAL_inventory = 
[
	//// DRINKS
	"AFAL_waterbottle", "AFAL_canteen", "AFAL_sprite", "AFAL_fanta", "AFAL_redbull",
	//// FOOD
	"AFAL_cereal", "AFAL_rice", "AFAL_bakedBeans", "AFAL_bacon",
	//// GADGETS
	"AFAL_cellphone", "AFAL_matches", "AFAL_cigarettes", "AFAL_ductTape", "AFAL_rope", "AFAL_ziptie", "AFAL_handcuffs", "AFAL_pepperspray",
	//// TOOLS
	"AFAL_measure", "AFAL_hammer", "AFAL_drill", "AFAL_grinder",
	//// MEDICAL
	"AFAL_bandage", "AFAL_bloodbag", "AFAL_defib",
	//// VEHICLE
	"AFAL_fuelSmall", "AFAL_fuelBig", "AFAL_repairFuel", "AFAL_repairEngine", "AFAL_repairTyre", "AFAL_repairHull", 
	//// PRODUCE
	"AFAL_mullet", "AFAL_mahi", "AFAL_mackeral", "AFAL_bass", "AFAL_catshark", "AFAL_tuna",
	//// ILLEGAL
	"AFAL_turtle", "AFAL_marijuana", "AFAL_cocaine", "AFAL_heroin"
];

{
	missionNamespace setVariable [ _x, 1]
} foreach AFAL_inventory;

switch (side player) do {

		case west : { player setVariable [ "Role", "Police Officer", true]};
		case east : { player setVariable [ "Role", "Gang Member", true]};
		case resistance : { player setVariable [ "Role", "Paramedic", true]};
		case civilian : { player setVariable [ "Role", "Civilian", true]};
};

sepiaEffect = ppEffectCreate ["colorCorrections", 1517];
sepiaEffect ppEffectEnable true;
sepiaEffect ppEffectAdjust [ 0.8, 0.95, 0, [ 0.1, 0.2, 0.3, -0.4], [ 1, 1, 0.7, 0.48], [ 0.5, 0.2, 0, 1]];
sepiaEffect ppEffectCommit 0;
	systemChat "AFAL effects defined";

_dust = "#particlesource" createVehicleLocal (getpos player);     
_dust setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 5, [2, 2, 0], [0, 4, 0.5], 1, 10, 8, 0.075, [2, 3, 4], [[0.1, 0.1, 0.1, 0.1], [0.25, 0.25, 0.25, 0.05], [0.4, 0.4, 0.4, 0.01], [0.5, 0.5, 0.5, 0]], [0.08], 0.5, 1, "", "", player];
_dust setParticleRandom [0, [0.25, 0.25, 0], [1, 1, 1], 0, 1, [0, 0, 0, 0.5], 0, 0];
_dust setParticleCircle [20, [0.5, 0, 0.1]];  
_dust setDropInterval 0.07;
  systemChat "AFAL dust particles created";

// execVM "main\fn_consumables.sqf";
  
