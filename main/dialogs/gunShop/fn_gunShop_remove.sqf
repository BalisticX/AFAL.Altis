/*
	File: fn_gunShop_remove.sqf
	Author: Ballistic
	
	Description:
	Executes when you remove a weapon extra at the gun shop for After Altis
*/

private ["_dialog", "_extraList", "_weaponList", "_price", "_magAmount", "_index", "_value", "_class"];

disableSerialization;

_dialog = findDisplay 3000;
_extraList = _dialog displayCtrl 3015;
_weaponList = _dialog displayCtrl 3017;
_price = _dialog displayCtrl 3001;
_magAmount = _dialog displayCtrl 3002;
	_index = lbCurSel _extraList;
	_value = _extraList lbValue _index;
	_class = _extraList lbData _index;
	
_getCamo = compile preprocessFile "scripts\dialogs\AFAL_gunShop_camo.sqf";

if ( isClass (configFile >> "CfgMagazines" >> _class)) then {
	if (magCount > 0) then {
		magCount = magCount - 1;
		shopSelect set [4, (shopSelect select 4) - _value];
	};

	_price ctrlSetText format ["$ %1", shopSelect select 4];
	_magAmount ctrlSetText format ["%1", magCount];
} else {
	_type = _class select [ 0, 1];
	
	switch (_type) do {
		case "m" : {
			if (_class == (shopSelect select 0) select 0) then {
				(shopSelect select 0) set [0, ""];
				(shopSelect select 0) set [1, 0];
			shopSelect set [4, (shopSelect select 4) - _value];
			_price ctrlSetText format ["$ %1", shopSelect select 4];
			};
		};
		case "o" : {
			if (_class == (shopSelect select 1) select 0) then {
				(shopSelect select 1) set [0, ""];
				(shopSelect select 1) set [1, 0];
			shopSelect set [4, (shopSelect select 4) - _value];
			_price ctrlSetText format ["$ %1", shopSelect select 4];
			};
		};
		case "a" : {
			if (_class == (shopSelect select 2) select 0) then {
				(shopSelect select 2) set [0, ""];
				(shopSelect select 2) set [1, 0];
			shopSelect set [4, (shopSelect select 4) - _value];
			_price ctrlSetText format ["$ %1", shopSelect select 4];
			};
		};
		case "c" : {
			shopSelect set [ 3, _weaponList lbData (lbCurSel _weaponList)];
		};
	};
	
	if (_type in ["m", "o", "a"]) then {
		_selection = [(shopSelect select 0) select 0, (shopSelect select 1) select 0, (shopSelect select 2) select 0];
		
		deleteVehicle extraHolder;
		extraHolder = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
			extraHolder attachTo [ shopPivot, [ 0, 0, 1.5]];
			extraHolder setVectorDirAndUp [[0,1,0],[0,0,1]];
		{	extraHolder addItemCargo [_x, 1]	} forEach _selection;
	} else {
		deleteVehicle shopHolder;
		shopHolder = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
			shopHolder attachTo [ shopPivot, [ 0, -0.63, 1.3]];
			shopHolder setVectorDirAndUp [[0,0,1],[0,-1,0]];
			shopHolder addWeaponCargo [(shopSelect select 3), 1];
	};
};
