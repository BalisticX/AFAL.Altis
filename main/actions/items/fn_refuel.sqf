/*
	File: fn_refuel.sqf
	Author: Ballistic 
	
	Description:
	Refuelling animation and effects for After Altis
*/

private ["_item", "_canister", "_vectorX", "_vectorY", "_sploosh", "_drops", "_spill", "_list", "_vehicle"];

_item = [ _this, 0, "", [""]] call BIS_fnc_param;

player switchMove "Acts_carFixingWheel";
	sleep 0.01;
player EnableSimulation false;

switch (_item) do {
	
	case "AFAL_fuelSmall" : {
		_canister = "Land_CanisterOil_F" createVehicle [0,0,0];
	};
	
	case "AFAL_fuelBig" : {
		_canister = "Land_CanisterFuel_F" createVehicle [0,0,0];
	};	
};

_canister attachTo [player, [ 0, 0, 0], "LeftHand"];
_canister allowDamage false;
_canister setVectorDirandUp [ [ 1, 0, 0], [ 0, 0.5, 0]];  /// This setVector doesn't do anything to either canister type

_vectorX = vectorDir player select 0;
_vectorY = vectorDir player select 1; 

_sploosh = "#particlesource" createVehicle (getPos _canister);
	_sploosh setParticleCircle [0, [0, 0, 0]];
	_sploosh setParticleRandom [0, [0, 0, 0], [0.25, 0, 0.25], 0, 0, [0, 0, 0, 0.25], 0, 0];
	_sploosh setParticleParams [["\A3\data_f\Cl_water", 1, 0, 1], "", "Billboard", 1, 1.25, [0, 0, 0], [_vectorX * 0.5, _vectorY * 0.5, 1.25], 0, 2, 1, 1e-009, [0.15, 0.3, 0.15, 0.075], [[0, 0, 0.001, 0.8], [0, 0, 0.001, 0.4], [0, 0, 0.001, 0.2]], [0.08], 0.2, 0.2, "", "", _canister];
	_sploosh setDropInterval 0.08;
	
_drops = "#particlesource" createVehicle (getPos _canister);
	_drops setParticleCircle [0, [0, 0, 0]];
	_drops setParticleRandom [0.25, [0.1, 0.1, 0.1], [0.25, 0, 0.25], 0, 0, [0, 0, 0, 0.25], 0.5, 0];
	_drops setParticleParams [["\A3\data_f\Cl_water", 1, 0, 1], "", "Billboard", 1, 1.5, [0, 0, 0], [_vectorX * 0.5, _vectorY * 0.5, 1.25], 0, 2, 1, 1e-009, [0.05, 0.025, 0.005], [[0, 0, 0.001, 0.6], [0, 0, 0.001, 0.3], [0, 0, 0.001, 0.15], [0, 0, 0.001, 0]], [0.08], 0.05, 0.2, "", "", _canister];
	_drops setDropInterval 0.05;
	
	//// NUKE could you change the ^^^^particles to NWEffects, I have already added them to the list as "Refuel"
	
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

//// NUKE if you can find a better way to do this next part, maybe using cursorTarget...

_list = (position player) nearEntities [[ "Air", "Car"], 3];
_vehicle = _list select 0;

switch (_item) do {
	case "AFAL_fuelSmall" : {
		_vehicle setFuel (fuel _vehicle + 0.25)
	};
	case "AFAL_fuelBig" : {
		_vehicle setFuel (fuel _vehicle + 0.75)
	};
};
