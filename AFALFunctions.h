/*
	File: AFALFunctions.h
	Author : Nuke & Ballistic

	Description:	
	All the amazing functions
*/

class AFAL_client {
	tag = "AFAL";
	class Over_network {
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
		class cityBarricade {};
		class wreckSpawn {};
		class wreckExtra {};
	};
	
	class Main {
		file = "main";
		class eventHandlerSetup {};
		class keyboard {};
		class weaponDamage {};
		class consumables {};
		class newSpawn {};
		class newEquip {};
	};
	
	class actions {
		file = "main\actions";
		class climb {};
		class items {};
		class tazed {};
		class unlock {};
		class restrained {};
		class workChurch {};
		class workGrinding {};
		class workFishing {};
		class workMechanic {};
	};
	
	class actions_items {
		file = "main\actions\items";
		class consume {};
		class lockpick {};
		class lockpick_attempt {};
		class marijuana {};
		class open {};
		class recover {};
		class refuel {};
		class repair {};
		class restrain {};
		class stunGun {};
	};
	
	class dialogs {
		file = "main\dialogs";
		class playerMenu {};
		class clothesShop {};
		class itemShop {};
		class gunShop {};
		class vehicleShop {};
	};
	
	class player {
		file = "main\dialogs\playerMenu";
		class givingMoney {};
		class sendingMoney {};
		class useItems {};
		class dropItems {};
	};
	
	class clothing {
		file = "main\dialogs\clothesShop";
		class clothesShop_add {};
		class clothesShop_buy {};
		class clothesShop_inventory {};
		class clothesShop_presets {};
		class clothesShop_remove {};
		class clothesShop_select {};
		class clothesShop_switch {};
	};
	
	class items {
		file = "main\dialogs\itemShop";
		class itemShop_inventory {};
		class itemShop_select {};
		class itemShop_transaction {};
		class itemShop_qty {};
	};
	
	class weapon {
		file = "main\dialogs\gunShop";
		class gunShop_add {};
		class gunShop_buy {};
		class gunShop_extra {};
		class gunShop_gun {};
		class gunShop_inventory {};
		class gunShop_remove {};
		class gunShop_select {};
	};
	
	class vehicle {
		file = "main\dialogs\vehicleShop";
		class vehicleShop_buy {};
		class vehicleShop_inventory {};
		class vehicleShop_select {};
	}
	
	class map {
		file = "main\dialogs\map";
		class map {};
		class map_locations {};
		class map_move {};
	};
};
