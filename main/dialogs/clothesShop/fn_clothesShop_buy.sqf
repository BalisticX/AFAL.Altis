/*
	File: fn_clothesShop_buy.sqf
	Author: Ballistic
	
	Description:
	Executes when you buy the selected items at the clothes shop for After Altis
*/

player forceAddUniform ((shopSelect select 0) select 2);
player addVest ((shopSelect select 1) select 2);
player addHeadgear ((shopSelect select 2) select 2);
player addGoggles ((shopSelect select 3) select 2);
player addBackpack ((shopSelect select 4) select 2);
