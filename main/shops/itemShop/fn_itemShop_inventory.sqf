/*
	File: AFAL_itemShop_inventory.sqf
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
	"AFAL_cellphone", "AFAL_matches", "AFAL_cigarettes", "AFAL_ductTape", "AFAL_rope", "AFAL_ziptie", "AFAL_handcuffs", "AFAL_pepperspray",
	//// MEDICAL
	"AFAL_bandage", "AFAL_bloodbag", "AFAL_defib",
	//// VEHICLE
	"AFAL_fuelSmall", "AFAL_fuelBig", "AFAL_repairFuel", "AFAL_repairEngine", "AFAL_repairTyre", "AFAL_repairHull"
	]};

	default  "";
};