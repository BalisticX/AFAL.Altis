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
		class NWEffects {};
		class numberText {};
		class checkBox {};
		class eyePos {};
		class cityDemolish {};
	};
	
	class Main
	{
		file = "main";
		class eventHandlerSetup {};
		class keyboard {};
		class weaponDamage {};
		class consumables {};
	};
	
	class player_actions
	{
		file = "main\actions";
		class climb {};
		class tazed {};
		class drugMJ {};
		class workConstruct {};
		class workGrinding {};
		class workFishing {};
		class workMechanic {};
	};
	
	class player
	{
		file = "main\menus\playerMenu";
		class playerMenu {};
		class givingMoney {};
		class sendingMoney {};
		class useItems {};
		class dropItems {};
	};
	
	class shop
	{
		file = "main\menus";
		class clothesShop {};
		class itemShop {};
		class items {};
		class gunShop {};
		class add_sub_menu {};
	};
	
	class clothing
	{
		file = "main\menus\clothesShop";
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
		file = "main\menus\itemShop";
		class itemShop_inventory {};
		class itemShop_select {};
		class itemShop_buyitems {};
	};
	
	class weapon
	{
		file = "main\menus\gunShop";
		class gunShop_add {};
		class gunShop_buy {};
		class gunShop_extra {};
		class gunShop_inventory {};
		class gunShop_remove {};
		class gunShop_select {};
	};
	
	class mapping
	{
		file = "main\map";
		class map {};
		class map_locations {};
		class map_move {};
	};
};
