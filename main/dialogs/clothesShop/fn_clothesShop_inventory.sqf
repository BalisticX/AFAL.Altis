/*
	File: fn_clothesShop_inventory.sqf
	Author: Ballistic
	
	Description:
	Function for determining the available inventory for the clothes shops for After Altis
	
	Paramters:
	0: STRING Type of clothing shop. Civ, gang, police, scuba etc.
	1: STRING Type of clothes. Uniform, vest, headgear etc.
	
	Returns:
	ARRAY The available clothing
*/

private ["_shopType", "_clothesType", "_array"];

_shopType = [ _this, 0, "", [""]] call BIS_fnc_param;
_clothesType = [ _this, 1, "", [""]] call BIS_fnc_param;

_array = [];

switch (_shopType) do {
	
	case "Scuba" : {
	
		switch (_clothesType) do {
		
			case "Uniforms" : {
				_array = _array + [
					["Black Wetsuit", 5000, "U_B_Wetsuit", "$5000"],
					["Green Wetsuit", 5100, "U_I_Wetsuit", "$5100"],
					["Camo Wetsuit", 5250, "U_O_Wetsuit", "$5250"],
					["Fisherman's Clothes", 1250, "U_C_Poor_1", "$1250"]
				];
			};
			
			case "Vests" : {
				_array = _array + [
					["Black Rebreather", 8000, "V_RebreatherB", "$8000"],
					["Green Rebreather", 8100, "V_RebreatherIA", "$8100"],
					["Camo Rebreather", 8250, "V_RebreatherIR", "$8250"]
				];	
			};
			
			case "Headgear" : {
				_array = _array + [
					["Fisherman's Hat", 1250, "H_StrawHat", "$1250"],
					["Dark Straw Hat", 1350, "H_StrawHat_dark", "$1350"]
				];
			};
			
			case "Facewear" : {
				_array = _array + [
					["Black Scuba Goggles", 2600, "G_B_Diving", "$2800"],
					["Green Scuba Goggles", 2700, "G_I_Diving", "$2800"],
					["Camo Scuba Goggles", 2850, "G_O_Diving", "$2800"],
					["Swimming Goggles", 2200, "G_Lowprofile", "$2200"],
					["Aviators", 1700, "G_Aviator", "$1700"]
				];				
			};
			
			case "Backpacks" : {
				_array = _array + [
					["Assault Pack", 12500, "B_AssaultPack_blk", "$12500"],
					["Field Pack", 17500, "B_FieldPack_blk", "$15500"],
					["Tactical Pack", 15500, "B_TacticalPack_blk", "$17500"]
				];	
			
			};
			
			case "Presets" : {
				_array = _array + [
					["Black Diver Outfit", 15800, "PresetScubaBlack", "$15800"],
					["Green Diver Outfit", 16000, "PresetScubaGreen", "$16000"],
					["Camo Diver Outfit", 16300, "PresetScubaCamo", "$16300"],
					["Fisherman's Outfit", 4200, "PresetFisherman", "$4200"]
				];
			};
		};
	};
	
	case "Civ" : {
	
		switch (_clothesType) do {
		
			case "Uniforms" : {
				_array = _array + [
					["Polo Blue", 1000, "U_C_Poloshirt_blue", "$1000"],
					["Polo Burgundy", 1000, "U_C_Poloshirt_burgundy", "$1000"],
					["Polo Striped", 1000, "U_C_Poloshirt_stripped", "$1000"],
					["Polo Navy", 1000, "U_C_Poloshirt_tricolour", "$1000"],
					["Polo Salmon", 1000, "U_C_Poloshirt_salmon", "$1000"],
					["Polo White", 1000, "U_C_Poloshirt_redwhite", "$1000"],
					["Grey Coveralls", 3500, "U_C_WorkerCoveralls", "$3500"],
					["Tan Cargo Pants", 6000, "U_IG_Guerilla2_1", "$5000"],
					["Grey Cargo Pants", 6000, "U_IG_Guerilla2_2", "$5000"],
					["Green Cargo Pants", 6000, "U_IG_Guerilla2_3", "$5000"],
					["Brown Jacket", 9500, "U_OG_Guerilla3_1", "$9500"],
					["Tan Jacket", 10000, "U_C_HunterBody_grn", "$10000"],
					["Cool Jacket", 18000, "U_OrestesBody", "$18000"],
					["Fancy Clothes", 25000, "U_NikosBody", "$25000"]
				];
			};
			
			case "Vests" : {
				_array = _array + [
					["Khaki Bandolier", 15000, "V_BandollierB_khk", "$15000"],
					["Coyote Bandolier", 15000, "V_BandollierB_cbr", "$15000"],
					["Green Bandolier", 15000, "V_BandollierB_rgr", "$15000"],
					["Olive Bandolier", 15000, "V_BandollierB_oli", "$15000"],
					["Black Bandolier", 16500, "V_BandollierB_blk", "$16500"],
					["Khaki Chestrig", 20000, "V_Chestrig_khk", "$20000"],
					["Green Chestrig", 20000, "V_Chestrig_rgr", "$20000"],
					["Olive Chestrig", 20000, "V_Chestrig_oli", "$20000"],
					["Black Chestrig", 22500, "V_Chestrig_blk", "$22500"]
				];	
			};
			
			case "Headgear" : {
				_array = _array + [
					["Cap Red", 1100, "H_Cap_red", "$1100"],
					["Cap Blue", 1100, "H_Cap_blu", "$1100"],
					["Cap Green", 1100, "H_Cap_grn", "$1100"],
					["Cap Olive", 1100, "H_Cap_oli", "$1100"],
					["Cap Tan", 1100, "H_Cap_tan", "$1100"],
					["Bandana Khaki", 1250, "H_Bandanna_khk", "$1250"],
					["Bandana Grey", 1250, "H_Bandanna_gry", "$1250"],
					["Bandana Olive", 1250, "H_Bandanna_sgg", "$1250"],
					["Cap USA", 1500, "H_Cap_usblack", "$1500"],
					["Cap UK", 1500, "H_Cap_khaki_specops_UK", "$1500"],
					["Cap CMMG", 1500, "H_Cap_blk_CMMG", "$1500"],
					["Cap ION", 1500, "H_Cap_blk_ION", "$1500"],
					["Boonie Tan", 1500, "H_Booniehat_tan", "$1500"],
					["Boonie Olive", 1500, "H_Booniehat_oli", "$1500"],
					["Cool Hat Blue", 1500, "H_Hat_blue", "$1500"],
					["Cool Hat Camo", 1500, "H_Hat_camo", "$1500"],
					["Cool Hat Grey", 1500, "H_Hat_grey", "$1500"],
					["Cool Hat Brown", 1500, "H_Hat_brown", "$1500"],
					["Cool Hat Tan", 1500, "H_Hat_tan", "$1500"],
					["Cool Hat Checker", 1500, "H_Hat_checker", "$1500"],
					["Cap Black", 1800, "H_Cap_blk", "$1800"],
					["Blue Bandana", 1800, "H_Bandanna_surfer", "$1800"],
					["Bandana Green", 1800, "H_Bandanna_surfer_grn", "$1800"],
					["Bandana Black", 1800, "H_Bandanna_surfer_blk", "$1800"],
					["Cap of Bohemia", 2500, "H_Cap_grn_BI", "$2500"],
					["Cap of Awesome", 2500, "H_Cap_surfer", "$2500"]
				];
			};
			
			case "Facewear" : {
				_array = _array + [
					["Aviators", 1700, "G_Aviator", "$1700"],
					["Blue Shades", 2000, "G_Shades_Blue", "$2000"],
					["Green Shades", 2000, "G_Shades_Green", "$2000"],
					["Red Shades", 2000, "G_Shades_Red", "$2000"],
					["Black Shades", 2150, "G_Shades_Black", "$2150"],
					["Red Sports", 2500, "G_Sport_Red", "$2500"],
					["Green Sports", 2500, "G_Sport_Greenblack", "$2500"],
					["White Sports", 2500, "G_Sport_BlackWhite", "$2500"],
					["Yellow Sports", 2500, "G_Sport_Blackyellow", "$2500"],
					["Black Red Sports", 2500, "G_Sport_Blackred", "$2500"],
					["Stylish Sports", 2750, "G_Sport_Checkered", "$2750"]
				];				
			};
			
			case "Backpacks" : {
				_array = _array + [
				];	
			
			};
			
			case "Presets" : {
				_array = _array + [
					["Brown Jacket Outfit", 1000, "PresetBrownJacket", "$1000"],
					["Hard Worker Outfit", 1000, "PresetWorker", "$1000"],
					["Green Cargo Outfit", 1000, "PresetGreenCargo", "$1000"]
				];
			};
		};
	};
	
	case "Press" : {
		
		switch (_clothesType) do {
		
			case "Uniforms" : {
				_array = _array + [
					["Journalist Uniform", 10500, "U_C_Journalist", "$10500"]
				];
			};
			
			case "Vests" : {
				_array = _array + [
					["Press Vest", 15250, "V_Press_F", "$15250"]
				];	
			};
			
			case "Headgear" : {
				_array = _array + [
					["Press Cap", 1500, "H_Cap_press", "$1500"],
					["Warzone Helmet", 3000, "H_HelmetB_plain_blk", "$3000"]
				];
			};
			
			case "Facewear" : {
				_array = _array + [
					["Aviators", 1700, "G_Aviator", "$1700"]
				];				
			};
			
			case "Backpacks" : {
				_array = _array + [
				];	
			
			};
			
			case "Presets" : {
				_array = _array + [
					["Press Outfit", 28950, "PresetPress", "$28950"]
				];
			};
		};
	};
};

_array;
