
private["_mode","_type","_buyPrice","_playertype","_sellPrice","_shopAmount","_playerAmount","_total"];
_mode = [_this,0,"",[""]]call bis_fnc_param;
_type = lbData[5017,(lbCurSel 5017)];
_buyPrice = lbValue[5017,(lbCurSel 5017)];

_playertype = lbData[5015,(lbCurSel 5015)];
_sellPrice = lbValue[5015,(lbCurSel 5015)];

_shopAmount = ctrlText 5002;
_shopAmount = parseNumber(_shopAmount);

_playerAmount = ctrlText 5003;
_playerAmount = parseNumber (_playerAmount);


if(shop_return) exitWith{};
shop_return = true;
switch(_mode)do
{
	case"BUY": {
	if(afal_money < _buyPrice) exitWith {systemChat "get rich champ!"; shop_return = false};
	closeDialog 0;
	
	_total = missionNameSpace getVariable _type;
	afal_money = afal_money - (_buyPrice * _shopAmount);
	missionNameSpace setVariable [_type,(_total + _shopAmount)];
	};
	
	case"SELL":
	{
	_total = missionNameSpace getVariable _playertype;
	if(_playertype == "") exitWith {shop_return = false};
	if(_total < _playerAmount) exitWith {shop_return = false; systemChat "you dont have that much"};
	if(_total < 0) exitWith {HINT "this message has been added to the watch list for glitches"; shop_return = false;};
	
	afal_money = afal_money + (_sellPrice * _playerAmount);
	missionNameSpace setVariable [_playertype,(_total - _playerAmount)];
	[shop_location,shop_type] call afal_fnc_itemShop;
	};
};
