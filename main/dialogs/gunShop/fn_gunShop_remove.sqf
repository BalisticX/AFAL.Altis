/*
	File: fn_gunShop_remove.sqf
	Author: Ballistic
	
	Description:
	Executes when you remove a weapon extra at the gun shop for After Altis
*/

disableSerialization;

_dialog = findDisplay 3000;
_extraList = _dialog displayCtrl 3015;
_price = _dialog displayCtrl 3001;
_magAmount = _dialog displayCtrl 3002;

_index = lbCurSel _extraList;
_value = _extraList lbValue _index;
_class = _extraList lbData _index;

if ( isClass (configFile >> "CfgMagazines" >> _class)) then {

	if (magCount > 0) then {
		magCount = magCount - 1;
		shopValue = shopValue - _value;
	};

	_price ctrlSetText format ["$ %1", shopValue];
	_magAmount ctrlSetText format ["%1", magCount];
	
} else {

	_type = _class select [ 0, 1];

	switch (_type) do {
		
		case "o" : {
		
			if (_class == ((shopselect select 0) select 2)) then {
				(shopSelect select 0) set [0, ""];
				(shopSelect select 0) set [1, 0];
				(shopSelect select 0) set [2, ""];
				
				shopValue = shopValue - _value;
				_price ctrlSetText format ["$ %1", shopValue];
			};
		};
		
		case "m" : {
		
			if (_class == ((shopselect select 1) select 2)) then {
				(shopSelect select 1) set [0, ""];
				(shopSelect select 1) set [1, 0];
				(shopSelect select 1) set [2, ""];
				
				shopValue = shopValue - _value;
				_price ctrlSetText format ["$ %1", shopValue];
			};
		};
		
		case "a" : {
		
			if (_class == ((shopselect select 2) select 2)) then {
				(shopSelect select 2) set [0, ""];
				(shopSelect select 2) set [1, 0];
				(shopSelect select 2) set [2, ""];
				
				shopValue = shopValue - _value;
				_price ctrlSetText format ["$ %1", shopValue];
			};
		};
	};
	
	_selection = [(shopSelect select 1) select 2, (shopSelect select 0) select 2, (shopSelect select 2) select 2];
	
	deleteVehicle extraHolder;
	
	extraHolder = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
	extraHolder attachTo [shopLocation, [-0.025, 0, 1.08]];
	{
		extraHolder addItemCargo [_x, 1];
	} forEach _selection;
};
