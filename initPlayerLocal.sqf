/*
	File: initPlayerLocal.sqf
	Author: Nuke & Ballistic
	
	Description:
	initPlayerLocal for After Altis
*/

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call AFAL_fnc_MPexec};

[] call AFAL_fnc_eventHandlerSetup;

//// Player bools ////
isWASD = false;
isRestrained = false;
isClimbing = false;
isTazed = false;
isDrugged = false;
inUse = false;
//// Player numbers ////
AFAL_money = 0;
AFAL_bank = 3000;
AFAL_thirst = 100;
AFAL_hunger = 100;
//// Work Payments ////
AFAL_mechanic = 500;
AFAL_grinding = 250;

waitUntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call afal_fnc_keyboard"];

AFAL_inventory = [
	//// DRINKS
	//// FOOD
	//// GADGETS
	"AFAL_ductTape", "AFAL_rope", "AFAL_ziptie", "AFAL_handcuffs", "AFAL_stunGun",
	//// TOOLS
	"AFAL_lockpick",
	//// MEDICAL
	//// VEHICLE
	"AFAL_fuelSmall", "AFAL_fuelBig", "AFAL_repairFuel", "AFAL_repairEngine", "AFAL_repairTyre", "AFAL_repairHull", 
	//// RESOURCE
	"AFAL_mullet", "AFAL_mahi", "AFAL_mackeral", "AFAL_bass", "AFAL_catshark", "AFAL_tuna",
	"AFAL_relicBox", "AFAL_relicMilitary", "AFAL_relicIllegal", "AFAL_relicBronze", "AFAL_relicSilver", "AFAL_relicGold",
	//// ILLEGAL
	"AFAL_turtle", "AFAL_marijuana"
	//// FUN
];

{
	missionNamespace setVariable [ _x, 0]
} foreach AFAL_inventory;

player addAction [ "Use ATM", afal_fnc_playerMenu, "", 0, false, false, "", "call afal_fnc_checkBox == 'atm'"];

AFAL_walls = [
	"city_4m_f", "city_8m_f", "city_pillar_f",
	"city2_4m_f", "city2_8m_f",
	"stone_8m_f", "stone_4m_f", "stone_pillar_f",
	"wall_tin_4_2",
	"pipewall_concretel_8m_f"];
	
AFAL_atms = [
	"Land_Atm_01_F",
	"Land_Atm_02_F"];

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

_dust = "#particlesource" createVehicleLocal (getpos player);     
_dust setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 5, [2, 2, 0], [0, 4, 0.5], 1, 10, 8, 0.075, [2, 3, 4], [[0.1, 0.1, 0.1, 0.1], [0.25, 0.25, 0.25, 0.05], [0.4, 0.4, 0.4, 0.01], [0.5, 0.5, 0.5, 0]], [0.08], 0.5, 1, "", "", player];
_dust setParticleRandom [0, [0.25, 0.25, 0], [1, 1, 1], 0, 1, [0, 0, 0, 0.5], 0, 0];
_dust setParticleCircle [20, [0.5, 0, 0.1]];  
_dust setDropInterval 0.07;

[] spawn AFAL_fnc_newSpawn;
  
