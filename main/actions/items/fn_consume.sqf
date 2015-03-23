/*
	File: fn_consume.sqf
	Author: Ballistic 
	
	Description:
	Food and water consumption animation and effects for After Altis
*/

private ["_item", "_object"];

_item = [ _this, 0, "", [""]] call BIS_fnc_param;

_total = missionNamespace getVariable _item;
missionNamespace setVariable [ _item, (_total - 1)];
_info = [_item] call AFAL_fnc_items;

player switchMove "AmovPercMstpSnonWnonDnon_AwopPercMstpSoptWbinDnon_end";
	sleep 0.2;
_object = (_info select 0) createVehicle [0,0,0];
	_object allowDamage false;
	_object attachTo [player, [ 0.03, 0, 0], "LeftHand"];
	_object setVectorDirAndUp [[ 0, 0, 1],[ 0, -1, 0]];

	sleep 0.25;
player enableSimulation false;
	sleep 4;
player enableSimulation true;
	sleep 0.3;
deleteVehicle _object;

switch (_item) do {
//// DRINKS
	case "AFAL_waterbottle" : 			{		AFAL_thirst = AFAL_thirst + 50		};
	case "AFAL_canteen" : 				{		AFAL_thirst = AFAL_thirst + 100		};
	case "AFAL_sprite" : 				{		AFAL_thirst = AFAL_thirst + 40; AFAL_hunger = AFAL_hunger - 10;	player setFatigue 3;	};
	case "AFAL_fanta" : 				{		AFAL_thirst = AFAL_thirst + 40; AFAL_hunger = AFAL_hunger - 10;	player setFatigue 3;	};
	case "AFAL_redbull" : 				{		AFAL_thirst = AFAL_thirst + 30; AFAL_hunger = AFAL_hunger - 10;	player setFatigue 6;	};	
//// FOOD
	case "AFAL_cereal" : 				{		AFAL_hunger = AFAL_hunger + 50		};
	case "AFAL_rice" : 					{		AFAL_hunger = AFAL_hunger + 100; AFAL_thirst = AFAL_thirst - 20;		};
	case "AFAL_bakedBeans" : 			{		AFAL_hunger = AFAL_hunger + 75;		};
	case "AFAL_bacon" : 				{		AFAL_hunger = AFAL_hunger + 100; AFAL_thirst = AFAL_thirst - 20;		};
	case "AFAL_milk" :					{		AFAL_hunger = AFAL_hunger + 20; AFAL_thirst = AFAL_thirst + 20;			};
};
