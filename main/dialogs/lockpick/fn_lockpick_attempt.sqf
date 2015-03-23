/*
	File: fn_lockpick_attempt.sqf
	Author: Ballistic
	
	Description:
	Attempts to pick a lock for lockpicking minigame for After Altis
*/
private ["_dialog", "_slider", "_lockpick", "_tumbler", "_difference", "_list", "_vehicle"];

disableSerialization;

_dialog = findDisplay 1700;
_slider = _dialog displayCtrl 1717;
_lockpick = _dialog displayCtrl 1701;
_tumbler = _dialog displayCtrl 1702;

_difference = abs ((round (sliderPosition _slider * 10)) - lockpickNum);

if (_difference < 6) then {
  systemChat "You have picked the lock, like a boss!";
	(_dialog displayCtrl 1703) ctrlSetTextColor [ 0, 0.8, 0.3, 0.75];
	_tumbler ctrlSetPosition [0, -0.06, 1, 1]; 
	_tumbler ctrlCommit 0.8;
		sleep 1.5;
	closeDialog 1700;
	
	_list = (position player) nearEntities [[ "Air", "Car"], 3.5];
	_vehicle = _list select 0;
	if (locked _vehicle > 1) then {
		_vehicle lock false;
		systemChat format ["You have unlocked %1", _vehicle];
	} else {
		_vehicle lock true;
		systemChat format ["You have securely locked %1", _vehicle];
	};
} else {
	lockpickStrike = lockpickStrike + 1;
	if (_difference >= 50) then {	(_dialog displayCtrl 1703) ctrlSetTextColor [ 0, 0, 0, 0.75]
	} else {
		if (_difference <= 30) then {
			if (_difference <= 15) then {	(_dialog displayCtrl 1703) ctrlSetTextColor [ 1, 0.843, 0, 0.75]	
			} else {	(_dialog displayCtrl 1703) ctrlSetTextColor [ 1, 0.502, 0, 0.75]	};
		} else {	(_dialog displayCtrl 1703) ctrlSetTextColor [ 0.8, 0.2, 0.2, 0.75]		};
	};

	switch (lockpickStrike) do {
		case 1 : {	(_dialog displayCtrl 1711) ctrlSetTextColor [ 0.8, 0.2, 0.2, 1]		};
		case 2 : {	(_dialog displayCtrl 1712) ctrlSetTextColor [ 0.8, 0.2, 0.2, 1]		};
		case 3 : {
			systemChat "Game over chump!";
			(_dialog displayCtrl 1713) ctrlSetTextColor [ 0.8, 0.2, 0.2, 1];
			_lockpick ctrlSetPosition [-0.5 - 1.5, 0.105, 0.9, 0.45];
			_lockpick ctrlCommit 2.2;
				sleep 2;
			closeDialog 1700;
			_total = missionNamespace getVariable "AFAL_lockpick";
			missionNamespace setVariable [ "AFAL_lockpick", (_total - 1)];
		};
	};
};
