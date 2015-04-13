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

if ( player getVariable "Restrain" != 0 ) exitWith {	_enableKeys		};

if (isPlacing) exitWith {
	switch (_keyCode) do {

		case 57 : 		{	systemChat "Object dropped"; isPlacing = false; _enableKeys = true;						};
	
		case 200 : 		{	if (placeOffset < 2) then { placeOffset = placeOffset + 0.15 } else { systemChat "You cannot raise this object any higher" }; _enableKeys = true;		};
		
		case 203 : 		{	placeDir = placeDir - 15; _enableKeys = true;	};
		
		case 205 : 		{	placeDir = placeDir + 15; _enableKeys = true;	};
		
		case 208 : 		{	if (placeOffset > 0.15) then { placeOffset = placeOffset - 0.15 } else { systemChat "You cannot lower this object any lower" }; _enableKeys = true;			};		
	};
	_enableKeys
};

switch (_keyCode) do {

	case 20 : {		systemChat "T = Item Quick Use"		};

	case 21 : {
		if ( cursorTarget isKindOf "Man" ) then {	
			[] spawn AFAL_fnc_interactMenu; _enableKeys = true;	
		} else {
			[] spawn AFAL_fnc_playerMenu; _enableKeys = true; 	
		};
	};
	
	case 47 : {
		_objects = lineIntersectsObjs [ eyePos player, eyePos player vectorAdd ((eyeDirection player) vectorMultiply 3), objNull, objNull, true, 2];
		_thing = _objects select 0;
		{	if ( [_x, str _thing, false] call BIS_fnc_inString && !isClimbing ) exitWith { [] spawn AFAL_fnc_climb; _enableKeys = true; _enableKeys };
			_height = getPosATL player select 2;
			if ( _height > 1.5 && _height < 5 && isNull cursorTarget && !isClimbing ) exitWith { [] spawn AFAL_fnc_dropDown; _enableKeys = true; _enableKeys; };
		} forEach AFAL_walls;
	};
};

_enableKeys
