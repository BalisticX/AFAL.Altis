/*
	File: 	fn_NWAnimation.sqf
	Author:		2dumb2bu
	
	Description:	
	Used for sending play or switch move animations over the network
*/

private ["_type", "_unit", "_animation"];

_type = [_this, 0, "", [""]] call bis_fnc_param;
_unit = [_this, 1, Objnull, [Objnull]] call bis_fnc_param;
_animation = [_this, 2, "", [""]] call bis_fnc_param;

if (_type == "") exitWith {};

switch (_type) do
{
	case "play": {_unit playMove _animation};
	case "switch": {_unit switchMove _animation};
};
