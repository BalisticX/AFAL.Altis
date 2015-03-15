/*
	File: fn_sendingMoney.sqf
	author: Nuke
	
	Description:
	Used after the player has decided to send money to another player
*/

private = ["_unit", "_amount", "_from", "_mode"];

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_amount = [_this,1,0,[0]] call BIS_fnc_param;
_from = [_this,2,objNull,[objNull]] call BIS_fnc_param;
_mode = [_this,3,"",[""]] call BIS_fnc_param;

switch (_mode) do {

	case "giveCash": {
		systemChat format["%1 has handed you $ %2 cash money)", name _from,[_amount] call AFAL_fnc_numberText];
		AFAL_money = AFAL_money + _amount;
	};

	case "bankTransfer": {
		systemChat format ["%1 has transferred $ %2 to your bank account", name _from, [_amount] call AFAL_fnc_numberText];
		AFAL_bank = AFAL_bank + _amount;
	};
};
