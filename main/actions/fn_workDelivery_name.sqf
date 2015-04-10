/*
	File: fn_workDelivery_name.sqf
	Author: Ballistic 
	
	Description:
	Function for properly naming delivery location for After Altis
	
	Parameters:
	0 : OBJECT Location for the delivery job
	
	Returns:
	STRING Name of the location
*/

private ["_location", "_name"];

_location = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
	if (isNull _location) exitWith {};
	
_name = "";

	switch (_location) do {
		case KavalaDeliveryFactory1 :	{		_name = "Central Kavala"			};
		case KavalaDeliveryFactory2 :	{		_name = "East Kavala"				};
		case KavalaDeliveryFactory3 :	{		_name = "South Kavala"				};
		case KavalaDeliveryPower :		{		_name = "Kavala Power Plant"		};
		case KavalaDeliveryStadium :	{		_name = "Kavala Sports Stadium"		};
		case KavalaDeliveryPrison :		{		_name = "Altis Federal Prison"		};
		case KavalaDeliveryTopolia :	{		_name = "Topolia"					};
	};
	
_name
