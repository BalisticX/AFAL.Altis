/*
	File: AFAL_handleDamage.sqf
	Author: Nuke & Ballistic
	
	Description:
	Damage event handler checks for tazing in After Altis
*/

_unit = _this select 0;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

_weapon = currentWeapon _source;
if ( _projectile in ["B_9x21_Ball"] && _weapon in ["hgun_Rook40_snds_F"]) then {
	if ( side _source == west) then {
		_damage = false;
		if (_unit distance _source < 30) then {
			if (!isTazed) then {
				[] execVM "AFAL_tazed.sqf";
			};
		};
	};
};
_damage;
