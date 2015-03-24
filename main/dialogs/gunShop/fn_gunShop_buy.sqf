/*
	File: fn_gunShop_buy.sqf
	Author: Ballistic
	
	Description:
	Executes when you buy the selected items at the gun shop for After Altis
*/
disableSerialization;

_dialog = findDisplay 3000;
_gunList = _dialog displayCtrl 3017;
_extraList = _dialog displayCtrl 3015;

if (AFAL_money > shopSelect select 4) then {
	_gunHolder = "WeaponHolder_Single_F" createVehicleLocal [0,0,0];
	_gunHolder setPosATL [getPosATL shopPivot select 0, getPosATL shopPivot select 1, (getPosATL shopPivot select 2) + 1];
	
	{
		_gunHolder addItemCargo [_x, 1];
	} forEach [(shopSelect select 0) select 0, (shopSelect select 1) select 0, (shopSelect select 2) select 0, shopSelect select 3];
	
	_gunHolder addMagazineCargo [(_extraList lbData 0), magCount];
	
	closeDialog 3000;

} else {	systemChat "You need more money chump"		};
