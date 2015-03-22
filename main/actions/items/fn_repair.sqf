/*
	File: fn_repair.sqf
	Author: Ballistic 
	
	Description:
	Repairing animation and effects for After Altis
*/

private ["_item", "_vehicle", "_length", "_width", "_height", "_difference"];

_item = [ _this, 0, "", [""]] call BIS_fnc_param;

if (cursorTarget isKindOf "Car" && player distance cursorTarget < 3.5) then {
	_vehicle = cursorTarget;

	_length = (boundingBoxReal _vehicle select 1) select 0; 
	_width = (boundingBoxReal _vehicle select 1) select 1;
	_height = (boundingBoxReal _vehicle select 0) select 2;
	
	_difference = abs (getDir player - getDir _vehicle);

	switch (_item) do {
		case "AFAL_repairTyre" : {
			[[player, "playMove", "Acts_carFixingWheel"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_MP;
			if (_difference < 180) then {
				player attachTo [_vehicle, [-(_width * 0.55), _length * 0.75, _height * 0.95]];
				player setVectorDirandUp [[ 1, 0, 0], [ 0, 0, 1]];	
			} else {
				player attachTo [_vehicle, [ _width * 0.55, _length * 0.75, _height * 0.95]];
				player setVectorDirandUp [[ -1, 0, 0], [ 0, 0, 1]];	
			};
				sleep 12.5;
			detach player;
			[[player, "switchMove", "HubFixingVehicleProne_idle1"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_MP;
			{	_vehicle setHitPointDamage [_x, 0]	} forEach ["HitLFWheel", "HitLF2Wheel", "HitLMWheel", "HitLBWheel", "HitRFWheel", "HitRF2Wheel", "HitRMWheel", "HitRBWheel"];
		};
		
		case "AFAL_repairEngine" : {
			[[player, "switchMove", "HubFixingVehicleProne_idle1"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_mp;
			player attachTo [_vehicle, [0, _length * 1.5, _height * 0.95]];
				sleep 9;
			detach player;
			player setDir (getDir _vehicle - 180);
			[[player, "switchMove", "AmovPpneMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_MP;
			_vehicle setHitPointDamage ["HitEngine", 0];	
		};
		
		case "AFAL_repairFuel" : {
			[[player, "switchMove", "HubFixingVehicleProne_idle1"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_MP;
			if (_difference < 180) then {	
				player attachTo [_vehicle, [-(_width * 0.3), 0, _height * 0.95]]; 
				player setVectorDirandUp [[ -1, 0, 0], [ 0, 0, 1]];	
					sleep 9;
				detach player;
				player setDir (getDir _vehicle + 90);
			} else {
				player attachTo [_vehicle, [_width * 0.3, 0, _height * 0.95]]; 
				player setVectorDirandUp [[ 1, 0, 0], [ 0, 0, 1]];
					sleep 9;
				detach player;
				player setDir (getDir _vehicle - 90);				
			};	
			[[player, "switchMove", "AmovPpneMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_MP;
			_vehicle setHitPointDamage ["HitFuel", 0];
		};
		
		case "AFAL_repairHull" : {
			[[player, "switchMove", "HubFixingVehicleProne_idle1"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_MP;
			if (_difference < 180) then {	
				player attachTo [_vehicle, [-(_width * 0.3), 0, _height * 0.95]]; 
				player setVectorDirandUp [[ -1, 0, 0], [ 0, 0, 1]];	
					sleep 9;
				detach player;
				player setDir (getDir _vehicle + 90);
			} else {
				player attachTo [_vehicle, [_width * 0.3, 0, _height * 0.95]]; 
				player setVectorDirandUp [[ 1, 0, 0], [ 0, 0, 1]];
					sleep 9;
				detach player;
				player setDir (getDir _vehicle - 90);				
			};			
			[[player, "switchMove", "AmovPpneMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"],"AFAL_fnc_NWAnimation",true,false] spawn AFAL_fnc_MP;
			_vehicle setHitPointDamage ["HitBody", 0];
		};
	};
};
