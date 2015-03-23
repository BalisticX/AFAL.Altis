/*
	file: fn_masterItems.sqf
	Author: Nuke & Ballistic

	Description:
	The master list for all items everywhere for After Altis

	Parameters:
	[Object classname, Display name, Buy cost, Sell cost, Type colour, TODO: Image]
*/

_item = [ _this, 0, "", [""]] call BIS_fnc_param;

if (_item == "") exitWith {};

switch (_item) do
{
	//// GADGETS	ORANGE [ 1, 0.5, 0.14, 1]
	
	case "AFAL_ductTape" : 							{[ "Land_DuctTape_F", "Duct Tape", 500, "$500", 250, "$250", [ 1, 0.5, 0.14, 1]], AFAL_fnc_restrain};
	case "AFAL_rope" : 							{[ "Land_Rope_01_F", "Rope", 1500, "$1500", 1750, "$1750", [ 1, 0.5, 0.14, 1]], AFAL_fnc_restrain};
	case "AFAL_ziptie" : 							{[ "Land_MetalWire_F", "ZipTie", 2250, "$2250", 1125, "$1125", [ 1, 0.5, 0.14, 1]], AFAL_fnc_restrain};
	case "AFAL_handcuffs" : 						{[ "Land_MetalWire_F", "Handcuffs", 3000, "$3000", 1500, "$1500", [ 1, 0.5, 0.14, 1]], AFAL_fnc_restrain};
	case "AFAL_stunGun" :							{[ "Land_MobilePhone_old_F", "Stun Gun", 5000, "$5000", 2500, "$2500", [ 1, 0.5, 0.14, 1]], AFAL_fnc_stunGun};
	
	/// TOOLS	ORANGE [ 1, 0.5, 0.14, 1]
	
	case "AFAL_lockpick" :							{[ "Land_CanOpener_F", "Lockpick", 2000, "$2000", 1000, "$1000", [ 1, 0.5, 0.14, 1]]};
	case "AFAL_cone" : 							{[ "RoadCone_F", "Orange Cone", 500, "$500", 250, "$250", [ 0.855, 0.647, 0.125, 1]]};	
	case "AFAL_roadBlock" : 						{[ "RoadBarrier_small_F", "Roadblock", 2500, "$2500", 1000, "$1000", [ 0.855, 0.647, 0.125, 1]]};	
	
	//// VEHICLE	PURPLE [ 0.365, 0.278, 0.545, 1]
	
	case "AFAL_fuelSmall" : 						{[ "Land_CanisterOil_F", "Small Jerry Can", 3000, "$3000", 1500, "$1500", [ 0.365, 0.278, 0.545, 1]], AFAL_fnc_refuel};
	case "AFAL_fuelBig" :							{[ "Land_CanisterFuel_F", "Jerry Can", 4000, "$4000", 2000, "$2000", [ 0.365, 0.278, 0.545, 1]], AFAL_fnc_refuel};
	case "AFAL_repairFuel" : 						{[ "Land_Wrench_F", "Fuel Repair Kit", 5000, "$5000", 2500, "$2500", [ 0.365, 0.278, 0.545, 1]], AFAL_fnc_repair};
	case "AFAL_repairEngine" : 						{[ "Land_Wrench_F", "Engine Repair Kit", 5000, "$5000", 2500, "$2500", [ 0.365, 0.278, 0.545, 1]], AFAL_fnc_repair};
	case "AFAL_repairTyre" : 						{[ "Land_Wrench_F", "Tyre Repair Kit", 5000, "$5000", 2500, "$2500", [ 0.365, 0.278, 0.545, 1]], AFAL_fnc_repair};
	case "AFAL_repairHull" :						{[ "Land_Wrench_F", "Hull Repair Kit", 5000, "$5000", 2500, "$2500", [ 0.365, 0.278, 0.545, 1]], AFAL_fnc_repair};
	
	//// RESOURCE	YELLOW [ 0.855, 0.647, 0.125, 1]
	
	case "AFAL_mullet" : 							{[ "Mullet_F", "Mullet", 750, "$750", 500, "$500", [ 0.855, 0.647, 0.125, 1]]};	
	case "AFAL_mahi" : 							{[ "Ornate_random_F", "Mahi Mahi", 1150, "$1150", 850, "$850", [ 0.855, 0.647, 0.125, 1]]};	
	case "AFAL_mackeral" : 							{[ "Mackerel_F", "Mackeral", 1500, "$1500", 1000, "$1000", [ 0.855, 0.647, 0.125, 1]]};
	case "AFAL_bass" : 							{[ "Salema_F", "Stripped Bass", 2000, "$2000", 1500, "$1500", [ 0.855, 0.647, 0.125, 1]]};
	case "AFAL_catshark" : 							{[ "CatShark_F", "Cat Shark", 2750, "$2750", 2250, "$2250", [ 0.855, 0.647, 0.125, 1]]};
	case "AFAL_tuna" : 							{[ "Tuna_F", "Tuna", 3000, "$3000", 2500, "$2500", [ 0.855, 0.647, 0.125, 1]]};

	case "AFAL_relicBox" :							{[ "Land_WoodenBox_F", "Ancient Loot", 0, "$0", 0, "$0", [ 0.855, 0.647, 0.125, 1]], AFAL_fnc_open};
	case "AFAL_relicMilitary" :						{[ "Box_NATO_WpsSpecial_F", "Military Loot", 100000000, "$100000000", 13250, "$13250", [ 0.855, 0.647, 0.125, 1]], AFAL_fnc_open};
	case "AFAL_relicIllegal" :						{[ "Land_PlasticCase_01_large_F", "Illegal Loot", 100000000, "$100000000", 12250, "$12250", [ 0.855, 0.647, 0.125, 1]], AFAL_fnc_open};
	case "AFAL_relicBronze" :						{[ "Land_Trophy_01_bronze_F", "Bronze Relic", 10500, "$10500", 8500, "$8500", [ 0.855, 0.647, 0.125, 1]]};
	case "AFAL_relicSilver" :						{[ "Land_Trophy_01_silver_F", "Silver Relic", 19000, "$19000", 15000, "$15000", [ 0.855, 0.647, 0.125, 1]]};
	case "AFAL_relicGold" :							{[ "Land_Trophy_01_gold_F", "Gold Relic", 28500, "$28500", 20150, "$20150", [ 0.855, 0.647, 0.125, 1]]};

	//// ILLEGAL	DARK RED [ 0.502, 0, 0, 1]
	
	case "AFAL_marijuana" :							{[ "Land_Sack_F", "Marijuana", 11500, "$11500", 7500, "$7500", [ 0.502, 0, 0, 1]], AFAL_fnc_drugMJ};
	case "AFAL_turtle": 							{[ "Turtle_F", "Turtle", 10500, "$10500", 8500, "$8500", [ 0.502, 0, 0, 1]]};	
	
	/*
	//////// NOT IMPLEMENTED YET ////////

	//// DRINKS		BLUE [ 0.275, 0.51, 0.706, 1]

	case "AFAL_waterbottle": 						{[ "Land_BottlePlastic_V2_F", "Water Bottle", 1000, "$1000", 500, "$500", [ 0.275, 0.51, 0.706, 1]]};
	case "AFAL_canteen": 							{[ "Land_Canteen_F", "Water Canteen", 3000, "$3000", 1500, "$1500", [ 0.275, 0.51, 0.706, 1]]};
	case "AFAL_sprite": 							{[ "Land_Can_V1_F", "Can of Sprite", 2000, "$2000", 1000, "$1000", [ 0.275, 0.51, 0.706, 1]]};
	case "AFAL_fanta": 							{[ "Land_Can_V2_F", "Can of Fanta", 2000, "$1000", 1000, "$1000", [ 0.275, 0.51, 0.706, 1]]};
	case "AFAL_redbull": 							{[ "Land_Can_V3_F", "Can of Redbull", 2250, "$2250", 1500, "$1500", [ 0.275, 0.51, 0.706, 1]]};
	
	//// FOOD		GREEN [ 0.42, 0.557, 0.137, 1]
	
	case "AFAL_cereal": 							{[ "Land_CerealsBox_F", "Cereal Box", 1000, "$1000", 500, "$500", [ 0.42, 0.557, 0.137, 1]]};
	case "AFAL_rice": 							{[ "Land_RiceBox_F", "Bag of Rice", 1000, "$1000", 500, "$500", [ 0.42, 0.557, 0.137, 1]]};
	case "AFAL_bakedBeans": 						{[ "Land_BakedBeans_F", "Baked Beans", 1000, "$1000", 500, "$500", [ 0.42, 0.557, 0.137, 1]]};
	case "AFAL_bacon": 							{[ "Land_TacticalBacon_F",  "Tactical Bacon", 1000, "$1000", 500, "$500", [ 0.42, 0.557, 0.137, 1]]};

	//// GADGETS	ORANGE [ 1, 0.5, 0.14, 1]
	
	case "AFAL_cellphone":							{[ "Land_MobilePhone_smart_F",  "Cellphone", 5000, "$5000", 2500, "$2500", [ 1, 0.5, 0.14, 1]]};
	case "AFAL_radio": 							{[ "Land_PortableLongRangeRadio_F",  "Radio", 5000, "$5000", 2500, "$2500", [ 1, 0.5, 0.14, 1]]};
	case "AFAL_binocular": 							{[ "Item_Binocular", "Binoculars", 4500, "$4500", 2750, "$2750", [ 1, 0.5, 0.14, 1]]};
	case "AFAL_mapAltis": 							{[ "Land_Map_unfolded_F", "Map of Altis", 4500, "$4500", 2750, "$2750", [ 1, 0.5, 0.14, 1]]};
	case "AFAL_compass": 							{[ "Land_Compass_F", "Magnetic Compass", 4500, "$4500", 2750, "$2750", [ 1, 0.5, 0.14, 1]]};
	case "AFAL_matches": 							{[ "Land_Matches_F", "Matches", 500, "$500", 250, "$250", [ 1, 0.5, 0.14, 1]]};
	case "AFAL_cigarettes": 						{[ "Land_Antibiotic_F","Cigarettes", 2450,  "$2450", 1350, "$1350", [ 1, 0.5, 0.14, 1]]};
	case "AFAL_pepperSpray":						{[ "Land_ButaneCanister_F", "Pepper Spray", 3000, "$3000", 1500, "$1500", [ 1, 0.5, 0.14, 1]]};
	
	//// MEDICAL	RED  [ 1, 0.188, 0.188, 1]
	
	case "AFAL_bandage": 							{[ "Land_Bandage_F", "Bandages", 500, "$500", 250, "$250", [ 1, 0.188, 0.188, 1]]};
	case "AFAL_bloodbag":							{[ "Land_BloodBag_F", "Blood Bag", 1000, "$1000", 500, "$500", [ 1, 0.188, 0.188, 1]]};
	case "AFAL_defib": 							{[ "Land_Defibrillator_F", "Defibrillator", 2000, "$2000", 1000, "$1000", [ 1, 0.188, 0.188, 1]]};

	/// TOOLS	ORANGE [ 1, 0.5, 0.14, 1]

	case "AFAL_measure":							{[ "Land_Meter3m_F", "Tape Measure", 750, "$750", 350, "$350", [ 1, 0.5, 0.14, 1]]};
	case "AFAL_hammer":							{[ "Land_Grinder_F", "Hammer", 2000, "$2000", 500, "$500", [ 1, 0.5, 0.14, 1]]};
	case "AFAL_drill":							{[ "Land_DrillAku_F", "Power Drill", 4000, "$4000", 1750, "$1750", [ 1, 0.5, 0.14, 1]]};
	case "AFAL_grinder":							{[ "Land_Hammer_F", "Angle Grinder", 5000, "$5000", 2000, "$2000", [ 1, 0.5, 0.14, 1]]};
	
	//// ILLEGAL	DARK RED [ 0.502, 0, 0, 1]
	
	case "AFAL_c4": 							{[ "DemoCharge_Remote_Ammo", "C-4", 15000, "$15000", 8750, "$8750", [ 0.502, 0, 0, 1]]};
	case "AFAL_claymore":							{[ "ClaymoreDirectionalMine_Remote_Ammo", "Claymore", 13750, "$13750", 7500, "$7500", [ 0.502, 0, 0, 1]]};
	case "AFAL_heroin":							{[ "Land_Sack_F", "Heroin", 12250, "$12250", 8500, "$8500", [ 0.502, 0, 0, 1]]};
	case "AFAL_cocaine":							{[ "Land_Sack_F", "Cocaine", 13500, "$13500", 9550, "$9550", [ 0.502, 0, 0, 1]]};

	//// FUN		PINK [ 0.855, 0.44,0.84, 1]
	
	case "AFAL_frisbee":							{[ "Skeet_Clay_F", "Frisbee", 100, "$100", 50, "$50", [ 0.855, 0.44,0.84, 1]]};	
	case "AFAL_baseball": 							{[ "Land_Baseball_01_F", "Baseball", 100, "$100", 50, "$50", [ 0.855, 0.647, 0.125, 1]]};	
	case "AFAL_mitt": 							{[ "Land_BaseballMitt_01_F", "Baseball Mitt", 100, "$100", 50, "$50", [ 0.855, 0.647, 0.125, 1]]};	
	case "AFAL_basketball": 						{[ "Land_Basketball_01_F", "Basketball", 100, "$100", 50, "$50", [ 0.855, 0.647, 0.125, 1]]};	
	case "AFAL_rugbyball": 							{[ "Land_Rugbyball_01_F", "Rugby Ball", 100, "$100", 50, "$50", [ 0.855, 0.647, 0.125, 1]]};	
	case "AFAL_volleyball": 						{[ "Land_Volleyball_01_F", "VolleyBall", 100, "$100", 50, "$50", [ 0.855, 0.647, 0.125, 1]]};	
	case "AFAL_football": 							{[ "Land_Football_01_F", "Soccer ball", 100, "$100", 50, "$50", [ 0.855, 0.647, 0.125, 1]]};
	*/
};

