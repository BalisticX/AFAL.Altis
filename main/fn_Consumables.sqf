/*
	File:	fn_Consumables.sqf
	Author:	Nuke
	
	Description:	
	Controls your hunger and thirst for After Altis
*/

[] spawn {
	while {true} do {
		sleep 10;
		AFAL_hunger = AFAL_hunger - 3;
		if(AFAL_hunger < 30) then {systemChat "You are starting to feel hungry"};
		if(AFAL_hunger < 20) then {systemChat "You want to eat something"};
		if(AFAL_hunger < 10) then {systemChat "You are starving to death"};
		if(AFAL_hunger < 0) exitWith {AFAL_hunger = 0;};
	};
};
[] spawn {
	while {true} do {
		sleep 10;
		AFAL_thirst = AFAL_thirst - 6;
		if(AFAL_thirst < 30) then {systemChat "You are starting to feel thirsty"};
		if(AFAL_thirst < 20) then {systemChat "You need to drink something soon"};
		if(AFAL_thirst < 10) then {systemChat "You are dying of dehydration"};
		if(AFAL_thirst < 0) exitWith {AFAL_thirst = 0;};
	};
};

[] spawn {
	private ["_death"];
	_death = 0.0001;
	while {(AFAL_hunger == 0 || AFAL_thirst == 0)} do
	{
		sleep 2;
		_death = _death + _death;
		player setdamage _death;
	};
};

[] spawn {
	private ["_heal"];
	_damage = getdammage player;
	_heal = 0.001;
	while {(AFAL_hunger == 0 || AFAL_thirst == 0)} do
	{
		sleep 2;
		_heal = _damage - _heal;
		player setdamage _heal;
	};
};
