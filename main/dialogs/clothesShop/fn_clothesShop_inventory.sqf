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
			case "Uniforms" : {		_array = _array + [
					["Black Wetsuit", 5000, "U_B_Wetsuit", "$5000", "\A3\characters_f\data\ui\icon_U_B_Wetsuit_CA.paa"],
					["Green Wetsuit", 5100, "U_I_Wetsuit", "$5100", "\A3\characters_f_beta\data\ui\icon_U_IR_Wetsuit_CA.paa"],
					["Camo Wetsuit", 5250, "U_O_Wetsuit", "$5250", "\A3\characters_f\data\ui\icon_U_OI_Wetsuit_CA.paa"],
					["Fisherman's Clothes", 1250, "U_C_Poor_1", "$1250", "images\AFAL_icon_poor.paa"]
				]	};	
			case "Vests" : {		_array = _array + [
					["Black Rebreather", 8000, "V_RebreatherB", "$8000", "\A3\characters_f\Data\UI\icon_V_RebreatherB_CA.paa"],
					["Green Rebreather", 8100, "V_RebreatherIA", "$8100", "\A3\characters_f\Data\UI\icon_V_RebreatherRU_CA.paa"],
					["Camo Rebreather", 8250, "V_RebreatherIR", "$8250", "\A3\characters_f\Data\UI\icon_V_RebreatherIR_CA.paa"]
				]	};	
			case "Headgear" : {		_array = _array + [
					["Straw Hat", 1250, "H_StrawHat", "$1250", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_StrawHat_ca.paa"],
					["Dark Straw Hat", 1350, "H_StrawHat_dark", "$1350", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_StrawHat_dark_ca.paa"]
				]	};		
			case "Facewear" : {		_array = _array + [
					["Black Scuba Goggles", 2600, "G_B_Diving", "$2800", "\A3\Characters_F_EPB\Heads\Glasses\data\UI\icon_g_diving_nato_ca.paa"],
					["Green Scuba Goggles", 2700, "G_I_Diving", "$2800", "\A3\Characters_F_EPB\Heads\Glasses\data\UI\icon_g_diving_rus_ca.paa"],
					["Camo Scuba Goggles", 2850, "G_O_Diving", "$2800", "\A3\Characters_F_EPB\Heads\Glasses\data\UI\icon_g_diving_iran_ca.paa"],
					["Swimming Goggles", 2200, "G_Lowprofile", "$2200", "\A3\Characters_F\data\ui\icon_g_lowprofile_CA.paa"],
					["Aviators", 1700, "G_Aviator", "$1700", "\A3\Characters_F\data\ui\icon_g_aviators_CA.paa"]
				]	};
			case "Backpacks" : {	_array = _array + [
					["Black Assault Pack", 12500, "B_AssaultPack_blk", "$12500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Compact_blk_ca.paa"],
					["Black Field Pack", 17500, "B_FieldPack_blk", "$15500", "\A3\Weapons_F_beta\ammoboxes\bags\data\ui\icon_B_Gorod_blk_ca.paa"],
					["Black Tactical Pack", 15500, "B_TacticalPack_blk", "$17500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Small_blk.paa"]
				]	};
			case "Presets" : {		_array = _array + [
					["Black Diver Outfit", 15600, "PresetScubaBlack", "$15600", "\A3\characters_f\data\ui\icon_U_B_Wetsuit_CA.paa"],
					["Green Diver Outfit", 15900, "PresetScubaGreen", "$15900", "\A3\characters_f_beta\data\ui\icon_U_IR_Wetsuit_CA.paa"],
					["Camo Diver Outfit", 16350, "PresetScubaCamo", "$16350", "\A3\characters_f\data\ui\icon_U_OI_Wetsuit_CA.paa"],
					["Fisherman's Outfit", 4200, "PresetFisherman", "$4200", "images\AFAL_icon_poor.paa"]
				]	};
		};
	};
	case "Civ" : {
		switch (_clothesType) do {
			case "Uniforms" : {
				_array = _array + [
					["Polo Blue", 1000, "U_C_Poloshirt_blue", "$1000", "images\AFAL_icon_polo_blue.paa"],
					["Polo Burgundy", 1000, "U_C_Poloshirt_burgundy", "$1000", "images\AFAL_icon_polo_burgundy.paa"],
					["Polo Striped", 1000, "U_C_Poloshirt_stripped", "$1000", "images\AFAL_icon_polo_striped.paa"],
					["Polo Navy", 1000, "U_C_Poloshirt_tricolour", "$1000", "images\AFAL_icon_polo_tricolour.paa"],
					["Polo Salmon", 1000, "U_C_Poloshirt_salmon", "$1000", "images\AFAL_icon_polo_salmon.paa"],
					["Polo White", 1000, "U_C_Poloshirt_redwhite", "$1000", "images\AFAL_icon_polo_red.paa"],
					["Grey Coveralls", 3500, "U_C_WorkerCoveralls", "$3500", "\A3\characters_f\data\ui\icon_U_B_coveralls_ca.paa"],
					["Tan Cargo Pants", 6000, "U_IG_Guerilla2_1", "$5000", "\A3\characters_f_gamma\Guerrilla\data\ui\icon_U_G_guerrilla2_1_ca.paa"],
					["Grey Cargo Pants", 6000, "U_IG_Guerilla2_2", "$5000", "\A3\characters_f_gamma\Guerrilla\data\ui\icon_U_G_guerrilla2_2_ca.paa"],
					["Green Cargo Pants", 6000, "U_IG_Guerilla2_3", "$5000", "\A3\characters_f_bootcamp\data\ui\icon_U_G_guerrilla2_3_ca.paa"],
					["Brown Jacket", 9500, "U_OG_Guerilla3_1", "$9500", "\A3\characters_f_gamma\Guerrilla\data\ui\icon_U_G_guerrilla3_1_ca.paa"],
					["Tan Jacket", 10000, "U_C_HunterBody_grn", "$10000", "\A3\characters_f_gamma\Guerrilla\data\ui\icon_U_G_guerrilla3_2_ca.paa"],
					["Cool Jacket", 18000, "U_OrestesBody", "$18000", "\A3\characters_f\data\ui\icon_U_Orestes_ca.paa"],
					["Fancy Clothes", 25000, "U_NikosBody", "$25000", "\A3\characters_f\data\ui\icon_U_Nikos_ca.paa"]
				]	};
			case "Vests" : {
				_array = _array + [
					["Khaki Bandolier", 15000, "V_BandollierB_khk", "$15000", "\A3\characters_f\Data\UI\icon_V_BandollierB_CA.paa"],
					["Coyote Bandolier", 15000, "V_BandollierB_cbr", "$15000", "\A3\Characters_F\data\ui\icon_V_bandollier_cbr_CA.paa"],
					["Green Bandolier", 15000, "V_BandollierB_rgr", "$15000", "\A3\characters_f\Data\UI\icon_V_BandollierB_CA.paa"],
					["Olive Bandolier", 15000, "V_BandollierB_oli", "$15000", "\A3\Characters_F_Beta\Data\ui\icon_V_Bandolier_oli_ca.paa"],
					["Black Bandolier", 16500, "V_BandollierB_blk", "$16500", "\A3\characters_f\Data\UI\icon_V_bandollier_blk_CA.paa"],
					["Khaki Chestrig", 20000, "V_Chestrig_khk", "$20000", "\A3\characters_f\Data\UI\icon_V_Chestrig_khk_CA.paa"],
					["Green Chestrig", 20000, "V_Chestrig_rgr", "$20000", "\A3\characters_f\Data\UI\icon_V_Chestrig_rgr_CA.paa"],
					["Olive Chestrig", 20000, "V_Chestrig_oli", "$20000", "\A3\Characters_F\data\ui\icon_V_FChestrig_oli_CA.paa"],
					["Black Chestrig", 22500, "V_Chestrig_blk", "$22500", "\A3\characters_F\data\ui\icon_V_FChestrig_blk_CA.paa"]
				]	};
			case "Headgear" : {
				_array = _array + [
					["Red Cap", 1100, "H_Cap_red", "$1100", "\A3\characters_f\Data\UI\icon_H_Cap_red_CA.paa"],
					["Blue Cap", 1100, "H_Cap_blu", "$1100", "\A3\characters_f\Data\UI\icon_H_Cap_blu_CA.paa"],
					["Green Cap", 1100, "H_Cap_grn", "$1100", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Cap_grn_ca.paa"],
					["Olive Cap", 1100, "H_Cap_oli", "$1100", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Cap_oli_ca.paa"],
					["Tan Cap", 1100, "H_Cap_tan", "$1100", "\A3\characters_f\Data\UI\icon_H_Cap_tan_CA.paa"],
					["Black Cap", 1500, "H_Cap_blk", "$1500", "\A3\characters_f\Data\UI\icon_H_Cap_blk_CA.paa"],
					["USA Cap", 1500, "H_Cap_usblack", "$1500", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Cap_usblack_ca.paa"],
					["UK Cap", 1500, "H_Cap_khaki_specops_UK", "$1500", "\A3\characters_f\Data\UI\icon_H_Cap_khaki_specops_UK_CA.paa"],
					["CMMG Cap", 1500, "H_Cap_blk_CMMG", "$1500", "\A3\Characters_F\data\ui\icon_H_Cap_blk_CMMG_CA.paa"],
					["ION Cap", 1500, "H_Cap_blk_ION", "$1500", "\A3\characters_f\Data\UI\icon_H_Cap_blk_ION_CA.paa"],
					["Blue Bandana", 1250, "H_Bandanna_blu", "$1250", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Bandanna_blu_ca.paa"],
					["Grey Bandana", 1250, "H_Bandanna_gry", "$1250", "\A3\characters_f\Data\UI\icon_H_Bandanna_gry_CA.paa"],
					["Khaki Bandana", 1250, "H_Bandanna_khk", "$1250", "\A3\characters_f\Data\UI\icon_H_Bandanna_khk_CA.paa"],
					["Sage Bandana", 1250, "H_Bandanna_sgg", "$1250", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Bandanna_sgg_ca.paa"],
					["Tan Boonie", 1500, "H_Booniehat_tan", "$1500", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Booniehat_tan_ca.paa"],
					["Olive Boonie", 1500, "H_Booniehat_oli", "$1500", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Booniehat_oli_ca.paa"],
					["Blue Hat", 1500, "H_Hat_blue", "$1500", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Hat_blue_ca.paa"],
					["Grey Hat", 1500, "H_Hat_grey", "$1500", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Hat_grey_ca.paa"],
					["Brown Hat", 1500, "H_Hat_brown", "$1500", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Hat_brown_ca.paa"],
					["Tan Hat", 1500, "H_Hat_tan", "$1500", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Hat_tan_ca.paa"],
					["Checker Hat", 1500, "H_Hat_checker", "$1500", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Hat_checker_ca.paa"],
					["Blue Surf Bandana", 1800, "H_Bandanna_surfer", "$1800", "\A3\characters_f\Data\UI\icon_H_Bandanna_surfer_CA.paa"],
					["Green Surf Bandana", 1800, "H_Bandanna_surfer_grn", "$1800", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_bandana_surfer_grn_ca.paa"],
					["Black Bandana", 1800, "H_Bandanna_surfer_blk", "$1800", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Bandanna_surfer_blk_ca.paa"],
					["Cap of Bohemia", 2500, "H_Cap_grn_BI", "$2500", "\A3\characters_f\Data\UI\icon_H_Cap_grn_BI_CA.paa"],
					["Cap of Awesome", 2500, "H_Cap_surfer", "$2500", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Cap_surfer_ca.paa"]
				]	};
			case "Facewear" : {
				_array = _array + [
					["Aviators", 1700, "G_Aviator", "$1700", "\A3\Characters_F\data\ui\icon_g_aviators_CA.paa"],
					["Sunglasses", 1900, "G_Spectacles_Tinted", "$1800", "\A3\Characters_F\data\ui\icon_g_spectacles_tinted_CA.paa"],
					["Square Frames", 2100, "G_Squares", "$2000", "\A3\Characters_F\data\ui\icon_g_squares_CA.paa"],
					["Blue Shades", 2100, "G_Shades_Blue", "$2000", "\A3\Characters_F\data\ui\icon_g_shades_blue_CA.paa"],
					["Green Shades", 2100, "G_Shades_Green", "$2000", "\A3\Characters_F\data\ui\icon_g_shades_green_CA.paa"],
					["Red Shades", 2100, "G_Shades_Red", "$2000", "\A3\Characters_F\data\ui\icon_g_shades_red_CA.paa"],
					["Black Shades", 2250, "G_Shades_Black", "$2150", "\A3\Characters_F\data\ui\icon_g_shades_black_CA.paa"],
					["Red Sports", 2500, "G_Sport_Red", "$2500", "\A3\Characters_F\data\ui\icon_g_sport_red_CA.paa"],
					["Green Sports", 2500, "G_Sport_Greenblack", "$2500", "\A3\Characters_F\data\ui\icon_g_sport_greenblack_CA.paa"],
					["White Sports", 2500, "G_Sport_BlackWhite", "$2500", "\A3\Characters_F\data\ui\icon_g_sport_blackwhite_CA.paa"],
					["Yellow Sports", 2500, "G_Sport_Blackyellow", "$2500", "\A3\Characters_F\data\ui\icon_g_sport_blackyellow_CA.paa"],
					["Black Red Sports", 2500, "G_Sport_Blackred", "$2500", "\A3\Characters_F\data\ui\icon_g_sport_blackred_CA.paa"],
					["Stylish Sports", 2750, "G_Sport_Checkered", "$2750", "\A3\Characters_F\data\ui\icon_g_sport_checkered_CA.paa"],
					["Fashion Mirror", 3250, "G_Lady_Mirror", "$3250", "\A3\Characters_F\data\ui\icon_g_lady_CA.paa"]
				]	};
			case "Backpacks" : {
				_array = _array + [
					["Sage Assault Pack", 12500, "B_AssaultPack_sgg", "$12500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Compact_sgg_ca.paa"],
					["Green Assault Pack", 12500, "B_AssaultPack_rgr", "$12500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Compact_rgr_ca.paa"],
					["Black Assault Pack", 12500, "B_AssaultPack_blk", "$12500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Compact_blk_ca.paa"],
					["Khaki Field Pack", 17500, "B_FieldPack_khk", "$15500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Gorod_khk_ca.paa"],
					["Coyote Field Pack", 17500, "B_FieldPack_cbr", "$15500", "\A3\Weapons_F\Ammoboxes\Bags\data\UI\icon_B_C_Gorod_cbr_ca.paa"],
					["Black Field Pack", 17500, "B_FieldPack_blk", "$15500",  "\A3\Weapons_F_beta\ammoboxes\bags\data\ui\icon_B_Gorod_blk_ca.paa"],
					["Green Tactical Pack", 15500, "B_TacticalPack_rgr", "$17500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Small_rgr.paa"],
					["Olive Tactical Pack", 15500, "B_TacticalPack_oli", "$17500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Small_oli.paa"],
					["Black Tactical Pack", 15500, "B_TacticalPack_blk", "$17500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Small_blk.paa"],
					["Khaki Carryall Pack", 20000, "B_Carryall_khk", "$20000", "\A3\Weapons_F\Ammoboxes\Bags\data\UI\icon_B_C_Tortila_khk.paa"],
					["Coyote Carryall Pack", 20000, "B_Carryall_cbr", "$20000", "\A3\Weapons_F\Ammoboxes\Bags\data\UI\icon_B_C_Tortila_cbr.paa"],
					["Olive Carryall Pack", 20000, "B_Carryall_oli", "$20000", "\A3\weapons_f_beta\ammoboxes\bags\data\ui\icon_B_Tortila_oli_ca.paa"]
				]	};
			case "Presets" : {
				_array = _array + [
					["Tan Hunter Outfit", 13200, "PresetTanJacket", "$13200", "\A3\characters_f_gamma\Guerrilla\data\ui\icon_U_G_guerrilla3_2_ca.paa"],
					["Brown Jacket Outfit", 27700, "PresetBrownJacket", "$27700", "\A3\characters_f_gamma\Guerrilla\data\ui\icon_U_G_guerrilla3_1_ca.paa"],
					["Grey Worker Outfit", 21250, "PresetWorker", "$21250", "\A3\characters_f\data\ui\icon_U_B_coveralls_ca.paa"],
					["Green Cargo Outfit", 29600, "PresetGreenCargo", "$30000", "\A3\characters_f_bootcamp\data\ui\icon_U_G_guerrilla2_3_ca.paa"]
				]	};
		};
	};
	case "Race" : {
		switch (_clothesType) do {
			case "Uniforms" : {
				_array = _array + [
					["Driver Black", 8500, "U_C_Driver_1_black", "$8500", "\A3\characters_f_kart\data\ui\icon_u_driver_base_black_ca.paa"],
					["Driver Blue", 8500, "U_C_Driver_1_blue", "$8500", "\A3\characters_f_kart\data\ui\icon_u_driver_base_blue_ca.paa"],
					["Driver Green", 8500, "U_C_Driver_1_green", "$8500", "\A3\characters_f_kart\data\ui\icon_u_driver_base_green_ca.paa"],
					["Driver Orange", 8500, "U_C_Driver_1_orange", "$8500", "\A3\characters_f_kart\data\ui\icon_u_driver_base_orange_ca.paa"],
					["Driver Red", 8500, "U_C_Driver_1_red", "$8500", "\A3\characters_f_kart\data\ui\icon_u_driver_base_red_ca.paa"],
					["Driver White", 8500, "U_C_Driver_1_white", "$8500", "\A3\characters_f_kart\data\ui\icon_u_driver_base_white_ca.paa"],
					["Driver Yellow", 8500, "U_C_Driver_1_yellow", "$8500", "\A3\characters_f_kart\data\ui\icon_u_driver_base_yellow_ca.paa"],
					["Driver Fuel", 9000, "U_C_Driver_1", "$8750", "\A3\characters_f_kart\data\ui\icon_u_driver_01_ca.paa"],
					["Driver Bluking", 9000, "U_C_Driver_2", "$9000", "\A3\characters_f_kart\data\ui\icon_u_driver_02_ca.paa"],
					["Driver Redstone", 9000, "U_C_Driver_3", "$9000", "\A3\characters_f_kart\data\ui\icon_u_driver_03_ca.paa"],
					["Driver Vrana", 9000, "U_C_Driver_4", "$9000", "\A3\characters_f_kart\data\ui\icon_u_driver_04_ca.paa"]
				]	};
			case "Vests" : {
				_array = _array + [
					["Black Bandolier", 16500, "V_BandollierB_blk", "$16500", "\A3\characters_f\Data\UI\icon_V_bandollier_blk_CA.paa"],
					["Black Chestrig", 22500, "V_Chestrig_blk", "$22500", "\A3\characters_F\data\ui\icon_V_FChestrig_blk_CA.paa"]
				]	};
			case "Headgear" : {
				_array = _array + [
					["Helmet Black", 2000, "H_RacingHelmet_1_black_F", "$2000", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_base_black_ca.paa"],
					["Helmet Blue", 2000, "H_RacingHelmet_1_blue_F", "$2000", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_base_blue_ca.paa"],
					["Helmet Green", 2000, "H_RacingHelmet_1_green_F", "$2000", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_base_green_ca.paa"],
					["Helmet Orange", 2000, "H_RacingHelmet_1_orange_F", "$2000", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_base_orange_ca.paa"],
					["Helmet Red", 2000, "H_RacingHelmet_1_red_F", "$2000", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_base_red_ca.paa"],
					["Helmet White", 2000, "H_RacingHelmet_1_white_F", "$2000", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_base_white_ca.paa"],
					["Helmet Yellow", 2000, "H_RacingHelmet_1_yellow_F", "$2000", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_base_yellow_ca.paa"],
					["Helmet Fuel", 2500, "H_RacingHelmet_1_F", "$2500", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_01_ca.paa"],
					["Helmet Bluking", 2500, "H_RacingHelmet_2_F", "$2500", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_02_ca.paa"],
					["Helmet Redstone", 2500, "H_RacingHelmet_3_F", "$2500", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_03_ca.paa"],
					["Helmet Vrana", 2500, "H_RacingHelmet_4_F", "$2500", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_04_ca.paa"]
				]	};
			case "Facewear" : {
				_array = _array + [
					["Aviators", 1700, "G_Aviator", "$1700", "\A3\Characters_F\data\ui\icon_g_aviators_CA.paa"],
					["Red Sports", 2500, "G_Sport_Red", "$2500", "\A3\Characters_F\data\ui\icon_g_sport_red_CA.paa"],
					["Green Sports", 2500, "G_Sport_Greenblack", "$2500", "\A3\Characters_F\data\ui\icon_g_sport_greenblack_CA.paa"],
					["White Sports", 2500, "G_Sport_BlackWhite", "$2500", "\A3\Characters_F\data\ui\icon_g_sport_blackwhite_CA.paa"],
					["Yellow Sports", 2500, "G_Sport_Blackyellow", "$2500", "\A3\Characters_F\data\ui\icon_g_sport_blackyellow_CA.paa"],
					["Black Red Sports", 2500, "G_Sport_Blackred", "$2500", "\A3\Characters_F\data\ui\icon_g_sport_blackred_CA.paa"]
				]	};
			case "Backpacks" : {
				_array = _array + [
					["Black Assault Pack", 12500, "B_AssaultPack_blk", "$12500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Compact_blk_ca.paa"],
					["Black Field Pack", 17500, "B_FieldPack_blk", "$15500", "\A3\Weapons_F_beta\ammoboxes\bags\data\ui\icon_B_Gorod_blk_ca.paa"],
					["Black Tactical Pack", 15500, "B_TacticalPack_blk", "$17500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Small_blk.paa"]
				]	};
			case "Presets" : {
				_array = _array + [
					["Racer Fuel Outfit", 14000, "PresetDriverFuel", "$14000", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_01_ca.paa"],
					["Racer Bluking Outfit", 14000, "PresetDriverBluking", "$14000", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_02_ca.paa"],
					["Racer Redstone Outfit", 14000, "PresetDriverRedstone", "$14000", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_03_ca.paa"],
					["Racer Vrana Outfit", 14000, "PresetDriverVrana", "$14000", "\A3\Characters_F_Kart\Data\UI\icon_H_RacingHelmet_04_ca.paa"]
				]	};
		};
	};
	case "Press" : {
		switch (_clothesType) do {
			case "Uniforms" : {		_array = _array + [
					["Journalist Uniform", 10500, "U_C_Journalist", "$10500", "\A3\characters_F_EPC\data\ui\icon_U_Journalist_ca.paa"]
				]	};
			case "Vests" : {		_array = _array + [
					["Press Vest", 15250, "V_Press_F", "$15250", "\A3\Characters_F_EPC\Data\UI\icon_V_PressVest_CA.paa"]
				]	};
			case "Headgear" : {		_array = _array + [
					["Press Cap", 1500, "H_Cap_press", "$1500", "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Cap_press_ca.paa"],
					["Warzone Helmet", 3000, "H_HelmetB_plain_blk", "$3000", "\A3\characters_f\Data\UI\icon_H_helmet_plain_ca.paa"]
				]	};
			
			case "Facewear" : {
				_array = _array + [
					["Aviators", 1700, "G_Aviator", "$1700", "\A3\Characters_F\data\ui\icon_g_aviators_CA.paa"],
					["Black Shades", 2250, "G_Shades_Black", "$2150", "\A3\Characters_F\data\ui\icon_g_shades_black_CA.paa"]
				]	};
			case "Backpacks" : {
				_array = _array + [
					["Black Assault Pack", 12500, "B_AssaultPack_blk", "$12500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Compact_blk_ca.paa"],
					["Black Field Pack", 17500, "B_FieldPack_blk", "$15500", "\A3\Weapons_F_beta\ammoboxes\bags\data\ui\icon_B_Gorod_blk_ca.paa"],
					["Black Tactical Pack", 15500, "B_TacticalPack_blk", "$17500", "\A3\weapons_f\ammoboxes\bags\data\ui\icon_B_C_Small_blk.paa"]
				]	};
			case "Presets" : {
				_array = _array + [
					["Press Outfit", 28950, "PresetPress", "$28950", "\A3\characters_F_EPC\data\ui\icon_U_Journalist_ca.paa"]
				]	};
		};
	};
};

_array
