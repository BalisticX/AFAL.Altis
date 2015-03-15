/*
	File:		fn_givingMoney.sqf
	Author:		Nuke
	
	Description: 
	Give all your moneys to another player
*/

private[ "_type", "_amount"];

_type = lbData [1034, lbCurSel 1034];
_amount = ctrlText 1033;
_amount = parseNumber (_amount);

closeDialog 1000;

{
	if (str (_x) == _type) then
	{
		_player = _x;
	};
}foreach allunits;

/*
if(isNil _player) exitWith {};
if(isNull _player) exitWith {};
if(_player == player) exitWith {};


if (AFAL_money < _amount) exitWith {systemChat "You don't have that much money to give!"; closeDialog 1000};

AFAL_money = AFAL_money - _amount;
*/

[[ _player, _amount, player, "giveCash"],"AFAL_fnc_sendingMoney", _player, false] spawn AFAL_fnc_MP;
