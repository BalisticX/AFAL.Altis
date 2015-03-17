/*
	File: fn_cityBarricade.sqf
	Author: Ballistic 
	
	Description:
	Used to barricade particular buildings in cities for AfterAltis
*/

_buildingList = [];
_buildingList = nearestObjects [(getMarkerPos "KavalaCenter"), ["Land_i_Shop_02_V1_F", "Land_i_Shop_01_V1_F", "Land_i_House_Big_01_V1_F"], 700];
_buildingList;

{
	sleep 0.005;
	_x allowDamage false;
	if (_x isKindOf "Land_i_Shop_01_V1_F") then {
		private ["_chance", "_chanceObject"];
		if ((nearestObject [_x, "Sign_Sphere25cm_F"]) distance _x < 8) exitWith {};
		if (typeOf _x == "Land_i_Shop_01_V2_F") exitWith {};
		_chance = round (random 3);
		switch (_chance) do {
			case 0 : {};
			case 1 : {
				private "_tin";
				_tin = "Land_Wall_Tin_4" createVehicle getPos _x;
				_tin setPos (_x modelToWorld [ -1.75, -2.4, -2.25]);
				_tin setDir getDir _x;
				_tin setVectorUp [0,0,1];
				_tin allowDamage false;
			};
			case 2 : {
				private "_wood";
				_wood = "Land_Shoot_House_Wall_Long_F" createVehicle getPos _x;
				_wood setPos (_x modelToWorld [ -1.75, -2.45, -3]);
				_wood setDir getDir _x;
				_wood setVectorUp [0,0,1];
				_wood allowDamage false;
			};
			case 3 : {};
		};
		_chanceObject = floor (random 5);
		switch (_chanceObject) do {
			case 0 : {
				private "_tire";
				_tire = "Land_Tyre_F" createVehicle getPos _x;
				_tire allowDamage false;
				_tire setPos (_x modelToWorld [ -1.5, -3.15, -2.5]);
			};
			case 1 : {
				private "_pallet";
				_pallet = "Land_Pallet_vertical_F" createVehicle getPos _x;
				_pallet setDir getDir _x;
				_pallet enableSimulation false;
				_pallet setPos (_x modelToWorld [ -3.15, -2.8, -3.15]);
				_pallet setVectorUp [ 0, 0, 1];
			};
			case 2 : {
				private "_barrel";
				_barrel = "Land_MetalBarrel_F" createVehicle getPos _x;
				_barrel allowDamage false;
				_barrel setDir (random 360);
				_barrel setPos (_x modelToWorld [ -2.85, -3.2, -2.65]);
			};
			case 3 : {
				private "_sacks";
				_sacks = "Land_Sacks_heap_F" createVehicle getPos _x;
				_sacks allowDamage false;
				_sacks setDir (getDir _x + 5);
				_sacks setPos (_x modelToWorld [ -3.35, -3.2, -3.1]);
				_sacks setPos [getPos _sacks select 0, getPos _sacks select 1, 0];
			};
			case 4 : {
				private "_canister";
				_canister = "Land_CanisterPlastic_F" createVehicle getPos _x;
				_canister allowDamage false;
				_canister setDir (random 360);
				_canister setPos (_x modelToWorld [ 0.25, -3.2, -2.65]);
			};
			case 5 : {
				private "_concrete";
				_concrete = "Land_CncBarrier_stripes_F" createVehicle getPos _x;
				_concrete allowDamage false;
				_concrete setDir (getDir _x + 5);
				_concrete setPos (_x modelToWorld [ -3.35, -3.2, -3.1]);
				_concrete setPos [getPos _concrete select 0, getPos _concrete select 1, 0];
			};
		};
	};
	
	if (_x isKindOf "Land_i_Shop_02_V1_F") then {
		private ["_chanceLeft", "_chanceRight"];
		if ((nearestObject [_x, "Sign_Sphere25cm_F"]) distance _x < 8) exitWith {};
		_chanceLeft = round (random 4);
		switch (_chanceLeft) do {
			case 0 : {};
			case 1 : {
				private "_tin";
				_tin = "Land_Wall_Tin_4" createVehicle getPos _x;
				_tin setDir (getDir _x - 90);
				_tin setPos (_x modelToWorld [ 3.7, 2.8, -2.75]);
				_tin setVectorUp [0,0,1];
				_tin allowDamage false;
			};
			case 2 : {
				private "_wood";
				_wood = "Land_Shoot_House_Wall_Long_Stand_F" createVehicle getPos _x;
				_wood setDir (getDir _x - 90);
				_wood setPos (_x modelToWorld [ 3.7, 2.8, -2.55]);
				_wood setVectorUp [0,0,1];
				_wood allowDamage false;
			};
			case 3 : {
				private ["_sandBag", "_sandBagEnd", "_sandBagTop", "_sandBagTopEnd"];
				_sandBag = "Land_BagFence_Long_F" createVehicle getPos _x;
					_sandBag setDir (getDir _x - 90);
					_sandBag setPos (_x modelToWorld [ 3.57, 2.5, -2.75]);
					_sandBag setVectorUp [0,0,1];
				_sandBagEnd = "Land_BagFence_End_F" createVehicle getPos _x;
					_sandBagEnd setDir getDir _sandBag;
					_sandBagEnd setPos (_sandBag modelToWorld [ 2.35, 0, -0.35]);
					_sandBagEnd setVectorUp [0,0,1];
				_sandBagTop = "Land_BagFence_Short_F" createVehicle getPos _x;
					_sandBagTop setDir getDir _sandBag;
					_sandBagTop setPos (_sandBag modelToWorld [ -0.6, 0, 0.4]);
					_sandBagTop setVectorUp [0,0,1];
				_sandBagTopEnd = "Land_BagFence_End_F" createVehicle getPos _x;
					_sandBagTopEnd setDir getDir _sandBag;
					_sandBagTopEnd setPos (_sandBag modelToWorld [ 1.1, 0, 0.4]);
					_sandBagTopEnd setVectorUp [0,0,1];
			};
			case 4 : {};
		};
		_chanceRight = round (random 4);
		switch (_chanceRight) do {
			case 0 : {};
			case 1 : {
				private "_tin";
				_tin = "Land_Wall_Tin_4" createVehicle getPos _x;
				_tin setDir (getDir _x - 90);
				_tin setPos (_x modelToWorld [ 3.7, -2.8, -2.75]);
				_tin setVectorUp [0,0,1];
				_tin allowDamage false;
			};
			case 2 : {
				private "_wood";
				_wood = "Land_Shoot_House_Wall_Long_Stand_F" createVehicle getPos _x;
				_wood setDir (getDir _x - 90);
				_wood setPos (_x modelToWorld [ 3.7, -2.8, -2.55]);
				_wood setVectorUp [0,0,1];
				_wood allowDamage false;
			};
			case 3 : {
				private ["_sandBag", "_sandBagEnd", "_sandBagTop", "_sandBagTopEnd"];
				_sandBag = "Land_BagFence_Long_F" createVehicle getPos _x;
					_sandBag setDir (getDir _x + 90);
					_sandBag setPos (_x modelToWorld [ 3.57, -2.5, -2.75]);
					_sandBag setVectorUp [0,0,1];
				_sandBagEnd = "Land_BagFence_End_F" createVehicle getPos _x;
					_sandBagEnd setDir getDir _sandBag;
					_sandBagEnd setPos (_sandBag modelToWorld [ 2.35, 0, -0.35]);
					_sandBagEnd setVectorUp [0,0,1];
				_sandBagTop = "Land_BagFence_Short_F" createVehicle getPos _x;
					_sandBagTop setDir getDir _sandBag;
					_sandBagTop setPos (_sandBag modelToWorld [ -0.6, 0, 0.4]);
					_sandBagTop setVectorUp [0,0,1];
				_sandBagTopEnd = "Land_BagFence_End_F" createVehicle getPos _x;
					_sandBagTopEnd setDir getDir _sandBag;
					_sandBagTopEnd setPos (_sandBag modelToWorld [ 1.1, 0, 0.4]);
					_sandBagTopEnd setVectorUp [0,0,1];
			};
			case 4 : {};
		};
	};
	if (_x isKindOf "Land_i_House_Big_01_V1_F") then {
		private "_chance";
		_chance = round (random 4);
		switch (_chance) do {
			case 0 : {};
			case 1 : {
				private ["_tin1", "_tin2"];
				_tin1 = "Land_Wall_Tin_4" createVehicle getPos _x;
					_tin1 setPos (_x modelToWorld [ -4.55, -0.2, -2.6]);
					_tin1 setDir (getDir _x + 90);
					_tin1 setVectorUp [0,0,1];
					_tin1 allowDamage false;
				_tin2 = "Land_Wall_Tin_4" createVehicle getPos _x;
					_tin2 setPos (_x modelToWorld [ -2.75, -7.25, -2.6]);
					_tin2 setDir getDir _x;
					_tin2 setVectorUp [0,0,1];
					_tin2 allowDamage false;
			};
			case 2 : {
				private ["_wood1", "_wood2"];
				_wood1 = "Land_Shoot_House_Wall_F" createVehicle getPos _x;
					_wood1 setPos (_x modelToWorld [ -4.65, -0.6, -2.75]);
					_wood1 setDir (getDir _x + 90);
					_wood1 setVectorUp [0,0,1];
					_wood1 allowDamage false;
				_wood2 = "Land_Shoot_House_Wall_F" createVehicle getPos _x;
					_wood2 setPos (_x modelToWorld [ -4.65, -3.45, -2.75]);
					_wood2 setDir (getDir _x + 90);
					_wood2 setVectorUp [0,0,1];
					_wood2 allowDamage false;
			};
			case 3 : {
				private "_fence";
				_fence = "Land_SportGround_fence_F" createVehicle getPos _x;
				_fence setPos (_x modelToWorld [ -4.8, -2, -3]);
				_fence setDir (getDir _x + 90);
				_fence setVectorUp [0,0,1];
				_fence allowDamage false;
			};
			case 4 : {};
		};
	};
} forEach _buildingList;
