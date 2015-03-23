/*
	File: fn_marijuana.sqf
	Author: Ballistic
	
	Description:
	Smokes some marijuana and creates the effects for After Altis
*/

private ["_battery", "_smoke", "_chroma", "_time"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if (isDrugged) exitWith {systemChat "You can't take anymore drugs!"};

_total = missionNamespace getVariable _item;
missionNamespace setVariable [_item,(_total - 1)];

isDrugged = true;
[[player, "switchMove", "Acts_Kore_IdleNoWeapon_in"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp;;
	sleep 3;
[[player, "switchMove", "Acts_Kore_TalkingOverRadio_in"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp;;
	sleep 1;

_battery = "Land_Battery_F" createVehicle (getPos player);
_smoke = "#particlesource" createVehicle (getPos _battery);
[["MJSmoke",_battery,_smoke],"AFAL_fnc_NWEffects",true,false] spawn AFAL_fnc_mp;
_battery attachTo [ player, [ -0.06, -0.02, 0], "head"];
hideObjectGlobal _battery;

[[player,"switchMove","Acts_Kore_TalkingOverRadio_out"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp;
	sleep 1;
[[player ,"switchMove", "Acts_Kore_IdleNoWeapon_out"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp;
	sleep 2.5;
[[player, "switchMove", ""],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp;

systemChat "You feel the marijuana's effects";

_chroma = ppEffectCreate ["chromAberration", 217];
_chroma ppEffectEnable true;
_chroma ppEffectAdjust [ 0.0175, 0.0175, true];
_chroma ppEffectCommit 15;

_time = time + 90;
	
waitUntil {
	if (speed player > 18) then {
		private ["_blur", "_dir", "_vel", "_speed", "_rag"];
			sleep (random 0.5);	
		detach _battery;
		_battery setPos [0,0,0];

		_blur = ppEffectCreate ["dynamicBlur", 517];
			_blur ppEffectEnable true;
			_blur ppEffectAdjust [0.75];
			_blur ppEffectCommit 0.5;

		_dir = getDir player;
		_vel = velocity player;
		_speed = 1;
	
		player allowDamage false;
		_rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
			_rag setMass 1e10;      
			_rag attachTo [player, [0,0,0], "Spine3"];      
			_rag setVelocity [(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2) + 5];
			
		detach _rag;      
		0 = _rag spawn {
			deleteVehicle _this;
		};
			sleep 1;
		player allowDamage true;
			sleep 6;
		ppEffectDestroy _blur;
		_battery attachTo [ player, [ -0.06, -0.02, 0], "head"];
	};
	time > _time;
};

systemChat "The effect of the marijuana wears off";
ppEffectDestroy _chroma;
{deleteVehicle _x} forEach [_smoke, _battery];
isDrugged = false;
