/*
	File:	fn_Consumables.sqf
	Author:		2Dumb2bu
	
	Description:	
	Controls your thrist and hunger for After Altis
*/

[] spawn
{
	while {true} do
	{
		sleep 10;
		afal_hunger = afal_hunger - 3;
		if(afal_hunger < 30) then {hint "have you thought about your hunger"};
		if(afal_hunger < 20) then {hint "You might want to get something to eat"};
		if(afal_hunger < 10) then {hint "your staving your self to death now"};
		if(afal_hunger < 0) exitWith {afal_hunger = 0;};
	};
};
[] spawn
{
	while {true} do
	{
		sleep 10;
		afal_thirst = afal_thirst - 6;
		if(afal_thirst < 30) then {hint "have you thought about your hunger"};
		if(afal_thirst < 20) then {hint "You might want to get something to eat"};
		if(afal_thirst < 10) then {hint "your staving your self to death now"};
		if(afal_thirst < 0) exitWith {afal_thirst = 0;};
	};
};

[] spawn
{
	private["_death"];
	_death = 0.0001;
	while {(afal_hunger == 0 || afal_thirst == 0)} do
	{
		sleep 2;
		_death = _death + _death;
		player setdamage _death;
	};
};

[] spawn
{
	private["_heal"];
	_damage = getdammage player;
	_heal = 0.001;
	while {(afal_hunger == 0 || afal_thirst == 0)} do
	{
		sleep 2;
		_heal = _damage - _heal;
		player setdamage _heal;
	};
};
