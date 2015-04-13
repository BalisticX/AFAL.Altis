/*
	File: fn_drop.sqf
	Author: Ballistic
	
	Description:
	Drop down action for AfterAltis
*/

_height = getPosATL player select 2;

player setPosATL ( player modelToWorld [ 0, 1.75, -(_height * 0.4) ] );

_weapon = currentWeapon player;

if ( _weapon == "" ) then {
	player switchMove "AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutHigh";
} else {

	_type = _weapon select [0,1];
	
	switch ( _type ) do {
		case "h" : 	{	player switchMove "AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutHigh"	};
		default 	{	player switchMove "AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutHigh"	};
	};
};
