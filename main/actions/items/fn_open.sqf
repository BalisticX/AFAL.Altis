/*
	File: fn_open.sqf
	Author: Ballistic 
	
	Description:
	Action for opening a recovered relic box then rewards player
*/

private ["_item", "_info", "_object", "_reward", "_rewardInfo", "_rewardTotal"];

_item = [ _this, 0, "", [""]] call BIS_fnc_param;

switch (_item) do {
	case "AFAL_relicBox" : {
		_total = missionNamespace getVariable _item;
		missionNamespace setVariable [ _item, (_total - 1)];
		_info = [_item] call AFAL_fnc_items;
		_object = (_info select 0) createVehicle [0,0,0];
			_object allowDamage false;
			_object setPos (player modelToWorld [0,1,0]);
			_object setDir getDir player;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 4.8;
		player playMove "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon";
			sleep 1.5;
		deleteVehicle _object;
		_reward = ["AFAL_relicBronze", "AFAL_relicSilver", "AFAL_relicGold"] call BIS_fnc_selectRandom;
		_rewardInfo = [_item] call AFAL_fnc_items;
		systemChat format ["You have discovered a %1", (_rewardInfo select 1)];
		_rewardTotal = missionNamespace getVariable _reward;
		missionNamespace setVariable [ _reward, (_rewardTotal + 1)];
	};
	
	case "AFAL_relicMilitary" : {
		_total = missionNamespace getVariable _item;
		missionNamespace setVariable [ _item, (_total - 1)];
		_info = [_item] call AFAL_fnc_items;
		_object = (_info select 0) createVehicle [0,0,0];
			clearWeaponCargoGlobal _object;
			clearMagazineCargoGlobal _object; 
			clearItemCargo _object;
			_object allowDamage false;
			_object setPos (player modelToWorld [0,1,0]);
			_object setDir getDir player;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 4.8;
		player playMove "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon";
			sleep 1.5;
		_reward = [["launch_RPG32_F", "RPG32_F"], ["launch_NLAW_F", "NLAW_F"], ["srifle_GM6_SOS_F", "5Rnd_127x108_Mag"], ["srifle_LRR_SOS_F", "7Rnd_408_Mag"], ["LMG_Mk200_F", "200Rnd_65x39_cased_Box"], ["LMG_Zafir_F", "150Rnd_762x51_Box"]] call BIS_fnc_selectRandom;
		_object addWeaponCargo [(_reward select 0), 1];
		_object addMagazineCargo [(_reward select 1), 2];
			sleep 90;
		deleteVehicle _object;
	};
	
	case "AFAL_relicIllegal" : {
		_total = missionNamespace getVariable _item;
		missionNamespace setVariable [ _item, (_total - 1)];
		_info = [_item] call AFAL_fnc_items;
		_object = (_info select 0) createVehicle [0,0,0];
			_object allowDamage false;
			_object setPos (player modelToWorld [0,1,0]);
			_object setDir (getDir player - 90);
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 4.8;
		player playMove "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon";
			sleep 1.5;
		deleteVehicle _object;
		_reward = ["AFAL_marijuana", "AFAL_cocaine", "AFAL_heroin", "Money"] call BIS_fnc_selectRandom;
		if (_reward == "Money") then {
			systemChat "You have found $10,000";
			AFAL_money = AFAL_money + 10000;
		} else {
			_rewardInfo = [_item] call AFAL_fnc_items;
			_amount = [5, 10, 15, 20, 25] call BIS_fnc_selectRandom;
			systemChat format ["You have found a lost stash of %1x %2", _amount, (_rewardInfo select 1)];
			_rewardTotal = missionNamespace getVariable _reward;
			missionNamespace setVariable [ _reward, (_rewardTotal + _amount)];
		};
	};
};
