/*
	File: fn_refuel.sqf
	Author: Ballistic 
	
	Description:
	Refuelling animation and effects for After Altis
*/

private ["_item", "_vehicle", "_canister", "_refuel", "_vectorX", "_vectorY", "_sploosh", "_drops"];

_item = [ _this, 0, "", [""]] call BIS_fnc_param;

if (cursorTarget isKindOf "Car" && player distance cursorTarget < 3.5) then {
	_vehicle = cursorTarget;
	
	player switchMove "Acts_carFixingWheel";
		sleep 0.01;
	player EnableSimulation false;
	
	switch (_item) do {
		case "AFAL_fuelSmall" : {
			_canister = "Land_CanisterOil_F" createVehicle [0,0,0];
			_refuel = 0.25;
		};
		case "AFAL_fuelBig" : {
			_canister = "Land_CanisterFuel_F" createVehicle [0,0,0];
			_refuel = 0.75;
		};	
	};
	
	_canister attachTo [player, [ 0, 0, 0], "LeftHand"];
	_canister allowDamage false;
	_canister setVectorDirandUp [ [ 1, 0, 0], [ 0, 0.5, 0]];  /// This setVector doesn't do anything
	
	_vectorX = vectorDir player select 0;
	_vectorY = vectorDir player select 1; 
	
	_sploosh = "#particlesource" createVehicle (getPos _canister);
	_drops = "#particlesource" createVehicle (getPos _canister);
		[["Refuel", _canister, _sploosh, _drops], "AFAL_fnc_NWEffects", true, false] spawn AFAL_fnc_MP;	
		sleep 2;
	_spill = "Oil_Spill_F" createVehicle [0,0,0];
	_spill setPos (player modelToWorld [0,1.5,0]);
	_spill setDir (random 360);
		sleep 5;
	{deleteVehicle _x} forEach [_sploosh, _drops];
		sleep 6;
	player enableSimulation true;
	player switchMove "AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";
	deleteVehicle _canister;
	
	_vehicle setFuel (fuel _vehicle + _refuel);
		systemChat "You have refuelled your vehicle";
	_total = missionNamespace getVariable _item;
	missionNamespace setVariable [_item, (_total - 1)];
} else {	systemChat "There are no vehicles nearby to refuel"	};
