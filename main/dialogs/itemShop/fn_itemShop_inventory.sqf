/*
	File: fn_itemShop_inventory.sqf
	Author: Ballistic
	
	Description:
	Function for determining the available inventory for the item shops for After Altis
	
	Paramters:
	0: STRING Type of item shop. Civ, fish, drug, blackmarket etc.
*/

private "_shopType";

_shopType = [ _this, 0, "", [""]] call BIS_fnc_param;

if (_shopType == "") exitWith {};

switch (_shopType) do
{
	case "Civ" : {[
		//// DRINKS
	"AFAL_waterbottle", "AFAL_canteen", "AFAL_sprite", "AFAL_fanta", "AFAL_redbull",
		//// FOOD
	"AFAL_cereal", "AFAL_rice", "AFAL_bakedBeans", "AFAL_bacon",
		//// GADGETS
	"AFAL_cellphone", "AFAL_matches", "AFAL_cigarettes", "AFAL_ductTape", "AFAL_rope", "AFAL_ziptie", 
		//// VEHICLE
	"AFAL_fuelSmall", "AFAL_fuelBig", "AFAL_repairFuel", "AFAL_repairEngine", "AFAL_repairTyre", "AFAL_repairHull"
	]};
	
	case "Police" : {[
		//// GADGETS
	"AFAL_ziptie", "AFAL_handcuffs", "AFAL_lockpick", "AFAL_pepperSpray", "AFAL_stunGun",
		//// VEHICLE
	"AFAL_fuelSmall", "AFAL_fuelBig", "AFAL_repairFuel", "AFAL_repairEngine", "AFAL_repairTyre", "AFAL_repairHull"
	]};
	
	case "Illegal" : {[
		//// DRINKS
	"AFAL_waterbottle", "AFAL_canteen",
		//// FOOD
	"AFAL_rice", "AFAL_bakedBeans",	
		//// GADGETS
	"AFAL_ductTape", "AFAL_rope", "AFAL_ziptie", "AFAL_c4", "AFAL_claymore", "AFAL_lockpick"
	]};
	
	case "Fish" : {[
	"AFAL_mullet", "AFAL_mahi", "AFAL_mackeral", "AFAL_bass", "AFAL_catshark", "AFAL_tuna"
	]};
	
	case "Poacher" : {[
	"AFAL_turtle"
	]};
	
	case "Drug" : {[
	"AFAL_marijuana", "AFAL_heroin", "AFAL_cocaine"
	]};

	default  "";
};
