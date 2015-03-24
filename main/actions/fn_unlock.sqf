/*
	File: fn_unlock.sqf
	Author: Ballistic 
	
	Description:
	Locks or unlocks the looked at vehicle is the player owns it
	
*/

if (cursorTarget isKindOf "Air" or cursorTarget isKindOf "Car") then {
	
	if (player distance cursorTarget > 50) then {
	
		if (cursorTarget getVariable "Owner" == player) then {
			_vehicle = cursorTarget;
			if (locked _vehicle > 1) then {
				_vehicle lock false;
				systemChat format ["You have unlocked %1", _vehicle];
			} else {
				_vehicle lock true;
				systemChat format ["You have securely locked %1", _vehicle];
			};
		};
	};
};
