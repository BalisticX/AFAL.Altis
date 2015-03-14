/*
	File: fn_gunShop_add.sqf
	Author: Ballistic
	
	Description:
	Executes when you add a weapon mag or attachment at the gun shop for After Altis
*/

disableSerialization;

_dialog = findDisplay 3000;
_extraList = _dialog displayCtrl 3015;
_price = _dialog displayCtrl 3001;
_magAmount = _dialog displayCtrl 3002;


_index = lbCurSel _extraList;
_text = _extraList lbText _index;
_value = _extraList lbValue _index;
_class = _extraList lbData _index;

if ( isClass (configFile >> "CfgMagazines" >> _class)) then {

	shopValue = shopValue + _value;
	magCount = magCount + 1;

	_price ctrlSetText format ["$ %1", shopValue];
	_magAmount ctrlSetText format ["%1", magCount];
	
} else {

	_type = _class select [ 0, 1];

	switch (_type) do {
		
		case "o" : {
		
			_oldValue = ((shopSelect select  0) select 1);			
			shopValue = shopValue - _oldValue;
		
			(shopSelect select 0) set [0, _text];
			(shopSelect select 0) set [1, _value];
			(shopSelect select 0) set [2, _class];
			
			shopValue = shopValue + _value;
			_price ctrlSetText format ["$ %1", shopValue];
		};
		
		case "m" : {
		
			_oldValue = ((shopSelect select  1) select 1);
			shopValue = shopValue - _oldValue;

			(shopSelect select 1) set [0, _text];
			(shopSelect select 1) set [1, _value];
			(shopSelect select 1) set [2, _class];
			
			shopValue = shopValue + _value;
			_price ctrlSetText format ["$ %1", shopValue];
		};
		
		case "a" : {
		
			_oldValue = ((shopSelect select  2) select 1);
			shopValue = shopValue - _oldValue;

			(shopSelect select 2) set [0, _text];
			(shopSelect select 2) set [1, _value];
			(shopSelect select 2) set [2, _class];
			
			shopValue = shopValue + _value;
			_price ctrlSetText format ["$ %1", shopValue];
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
