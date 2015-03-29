/*
	File: fn_chemlight.sqf
	Author: Ballistic
	
	Description:
	Ability to create a chemlight underwater for After Altis
	
	Parameters:
	0 : STRING AFAL class name of the item being used.
*/

private ["_item", "_type", "_chemlight", "_total"];

_item = [ _this, 0, "", [""]] call bis_fnc_param;
  if (_item == "") exitWith {};

if (underwater player) then {

	switch (playerSide) do {
		case west : 	  	{	  	_type = "Chemlight_blue";	  	};
		case east : 	  	{	  	_type = "Chemlight_red";	  	};
		case resistance :	{	  	_type = "Chemlight_green";		};
		case civilian : 	{	  	_type = "Chemlight_yellow";		};
	};

	_chemlight = _type createVehicle getPos player;
	
	_total = missionNamespace getVariable _item;
	missionNamespace setVariable [ _item, (_total - 1)];

} else {
	systemChat "You need to be underwater to use this";
};
