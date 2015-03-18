/*
	File: fn_itemShop_transaction.sqf
	Author: Nuke
	
	Description:
	Executes when you make a transaction at the item shop for After Altis
*/

private["_mode", "_type", "_buyPrice", "_playertype", "_sellPrice", "_shopAmount", "_playerAmount"];

_mode = [ _this, 0, "", [""]]call bis_fnc_param;
_type = lbData [5017, (lbCurSel 5017)];
_buyPrice = lbValue [5017, (lbCurSel 5017)];

_playerType = lbData [ 5015, (lbCurSel 5015)];
_sellPrice = lbValue [ 5015, (lbCurSel 5015)];

_shopAmount = ctrlText 5002;
_shopAmount = parseNumber(_shopAmount);

_playerAmount = ctrlText 5003;
_playerAmount = parseNumber (_playerAmount);

if (shopReturn) exitWith {};
shopReturn = true;
switch (_mode) do {

	case "Buy": {
		private = "_total";
		if (AFAL_money < _buyPrice) exitWith {systemChat "Get rich chump!"; shopReturn = false};
		closeDialog 0;
	
		_total = missionNameSpace getVariable _type;
		AFAL_money = AFAL_money - (_buyPrice * _shopAmount);
		missionNameSpace setVariable [ _type, (_total + _shopAmount)];
	};
	
	case "Sell" : {
		private = "_total";
		_total = missionNameSpace getVariable _playerType;
		if (_playertype == "") exitWith {shopReturn = false};
		if( _total < _playerAmount) exitWith { shopReturn = false; systemChat "You dont have that much to sell"};
		if( _total < 0) exitWith { HINT "This message has been added to the watch list for glitches"; shopReturn = false;};
	
		AFAL_money = AFAL_money + (_sellPrice * _playerAmount);
		missionNameSpace setVariable [ _playertype, (_total - _playerAmount)];
		[ shopLocation, shopType] call AFAL_fnc_itemShop;
	};
};
