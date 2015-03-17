/*
	File: 	fn_keyboard.sqf
	Author:	Nuke & Ballistic
	
	Description:	
	Sends message from keys to scripts basically it's a keyboard handler
*/


_keyCode = _this select 1;
_shiftKey = _this select 2;
_ctrlKey = _this select 3;
_altKey = _this select 4;
_enableKeys = false;

switch (_keyCode) do {

	case 21: {
		if(!dialog) then {createDialog "bigB_playerMenu";[] spawn afal_fnc_playerMenu;};
	};
	
	case 47: {
		if ((getPos player select 2) < 2 && !isClimbing) then {
			_nearObjects = nearestObjects [getPosATL player, [], 2.5];
			_countWalls	= []; 
			{_obj = _x; 
				if (typeOf _obj isEqualTo "") then {
					_arr 	= toArray str (_obj); 
					_start 	= _arr find 58; 
					if !(_start < 0) then {
						_name = [];
						_end = _arr find 46;
						for "_r" from (_start + 2) to (_end - 1) do {_name set [count _name, _arr select _r]};
						if (toString _name in afal_walls) exitWith {[] spawn AFAL_fnc_climb; _enableKeys = true};
					}
				}
			} count _nearObjects;
		};
	};
};

_enableKeys;
