/*
	File: fn_clothesShop_buy.sqf
	Author: Ballistic
	
	Description:
	Executes when you buy the selected items at the clothes shop for After Altis
*/

if (AFAL_money > (shopSelect select 5)) then {

	player forceAddUniform ((shopSelect select 0) select 2);
	player addVest ((shopSelect select 1) select 2);
	player addHeadgear ((shopSelect select 2) select 2);
	player addGoggles ((shopSelect select 3) select 2);
	player addBackpack ((shopSelect select 4) select 2);

	closeDialog 4000;
	
} else {	systemChat "You need more dollars chump!";	};
