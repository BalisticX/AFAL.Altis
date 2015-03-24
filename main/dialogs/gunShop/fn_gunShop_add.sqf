/*
	File: fn_gunShop_add.sqf
	Author: Ballistic
	
	Description:
	Executes when you add a weapon mag or attachment at the gun shop for After Altis
*/

private ["_dialog", "_extraList", "_weaponList", "_price", "_magAmount", "_index", "_text", "_value", "_class", "_oldValue", "_camoArray", "_selection"]; 

disableSerialization;

_dialog = findDisplay 3000;
_extraList = _dialog displayCtrl 3015;
_weaponList = _dialog displayCtrl 3017;
_price = _dialog displayCtrl 3001;
_magAmount = _dialog displayCtrl 3002;
	_index = lbCurSel _extraList;
	_text = _extraList lbText _index;
	_value = _extraList lbValue _index;
	_class = _extraList lbData _index;

_getCamo = compile preprocessFile "scripts\dialogs\AFAL_gunShop_camo.sqf";
	
if ( isClass (configFile >> "CfgMagazines" >> _class)) then {
	magCount = magCount + 1;
	shopSelect set [4, (shopSelect select 4) + _value];

	_price ctrlSetText format ["$ %1", shopSelect select 4];
	_magAmount ctrlSetText format ["%1", magCount];
	
} else {
	_type = _class select [ 0, 1];
	switch (_type) do {
		case "m" : {
			_oldValue = (shopSelect select 0) select 1;
			shopSelect set [4, (shopSelect select 4) - _oldValue];		
				(shopSelect select 0) set [0, _class];
				(shopSelect select 0) set [1, _value];
			shopSelect set [4, (shopSelect select 4) + _value];
			_price ctrlSetText format ["$ %1", shopSelect select 4];
		};
		case "o" : {
			_oldValue = (shopSelect select 1) select 1;
			shopSelect set [4, (shopSelect select 4) - _oldValue];	
				(shopSelect select 1) set [0, _class];
				(shopSelect select 1) set [1, _value];
			shopSelect set [4, (shopSelect select 4) + _value];
			_price ctrlSetText format ["$ %1", shopSelect select 4];
		};
		case "a" : {
			_oldValue = (shopSelect select 2) select 1;
			shopSelect set [4, (shopSelect select 4) - _oldValue];
				(shopSelect select 2) set [0, _class];
				(shopSelect select 2) set [1, _value];
			shopSelect set [4, (shopSelect select 4) + _value];
			_price ctrlSetText format ["$ %1", shopSelect select 4];
		};
		case "c" : {
			_variant = parseNumber (_class select [ 5, 1]);
			_camoArray = (_weaponList lbData (lbCurSel _weaponList)) call _getCamo;
			_camo = _camoArray select _variant;
			shopSelect set [ 3, _camo];
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
