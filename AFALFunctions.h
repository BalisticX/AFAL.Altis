/*
	File: AFALFunctions.h
	Author : 2Dumb2bu & Ballistic

	Description:	
	All the amazing functions
*/

class AFAL_client
{
	tag = "AFAL";
	class Over_network
	{
		file = "system";
		class MP {};
		class MPexec {};
		class BC {};
		class NWAnimation {};
		class numberText {};
	};
	class Main
	{
		file = "main";
		class eventHandlerSetup {};
		class keyboard {};
		class items {};
		class playerMenu {};
		class numberText {};
		class weaponDamage {};
		class tazed {};
		class consumables {};
	};
	class shop
	{
		file = "main\shops";
		class clothesShop {};
		class itemShop {};
		class gunShop {};
	};
	class clothing
	{
		file = "main\shops\clothesstore";
		class clothesShop_add {};
		class clothesShop_buy {};
		class clothesShop_inventory {};
		class clothesShop_presets {};
		class clothesShop_remove {};
		class clothesShop_select {};
		class clothesShop_switch {};
	};
	class items
	{
		file = "main\shops\itemstore";
		class itemShop_inventory {};
		class itemShop_select {};
		class buyitems {};
	};
	class weapon
	{
		file = "main\shops\weaponstore";
		class gunShop_add {};
		class gunShop_buy {};
		class gunShop_extra {};
		class gunShop_inventory {};
		class gunShop_remove {};
		class gunShop_select {};
	};
	class mapping
	{
		file = "main\maping";
		class map {};
		class map_locations {};
		class map_move {};
	};
};
