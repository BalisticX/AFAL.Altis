/*
	File: fn_itemShop_inventory.sqf
	Author: Ballistic
	
	Description:
	Function for determining the available inventory for the item shops for After Altis
	
	Paramters:
	0: STRING Type of item shop. Civ, fish, drug, illegal etc.
*/

private "_shopType";

_shopType = [ _this, 0, "", [""]] call BIS_fnc_param;

if (_shopType == "") exitWith {};

switch (_shopType) do {

	case "Civ" : {[
	"AFAL_waterbottle", "AFAL_canteen", "AFAL_sprite", "AFAL_fanta", "AFAL_redbull",	//// DRINKS
	"AFAL_cereal", "AFAL_rice", "AFAL_bakedBeans", "AFAL_bacon", "AFAL_milk",	//// FOOD
	"AFAL_ductTape", "AFAL_rope", "AFAL_ziptie", "AFAL_lockpick",	//// GADGETS 
	"AFAL_fuelSmall", "AFAL_fuelBig", "AFAL_repairFuel", "AFAL_repairEngine", "AFAL_repairTyre", "AFAL_repairHull"	//// VEHICLE
	]};
	
	case "Police" : {[
	"AFAL_ziptie", "AFAL_handcuffs", "AFAL_lockpick", "AFAL_stunGun",	//// GADGETS
	"AFAL_fuelSmall", "AFAL_fuelBig", "AFAL_repairFuel", "AFAL_repairEngine", "AFAL_repairTyre", "AFAL_repairHull"	//// VEHICLE
	]};
	
	case "Illegal" : {[
	"AFAL_ductTape", "AFAL_rope", "AFAL_ziptie", "AFAL_stunGun", "AFAL_lockpick",	//// GADGETS
	"AFAL_fuelSmall", "AFAL_fuelBig", "AFAL_repairFuel", "AFAL_repairEngine", "AFAL_repairTyre", "AFAL_repairHull"	//// VEHICLE
	]};
	
	case "Fish" : {[	"AFAL_mullet", "AFAL_mahi", "AFAL_mackeral", "AFAL_bass", "AFAL_catshark", "AFAL_tuna"	]};

	case "Museum" : {[	"AFAL_relicBronze", "AFAL_relicSilver", "AFAL_relicGold"	]};
	
	case "Evidence" : {[	"AFAL_relicMilitary", "AFAL_relicIllegal", "AFAL_marijuana", "AFAL_heroin", "AFAL_cocaine"	]};

	case "Poacher" : {[	"AFAL_turtle"	]};

	case "Drug" : {[	"AFAL_marijuana", "AFAL_heroin", "AFAL_cocaine"	]};

	default  "";
};
