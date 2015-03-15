/*
	File: AFAL_itemShop.hpp
	Author: Ballistic
	
	Description:
	Item shop dialog for After Altis
*/

class itemShop 
{
	idd = 5000;
	name= "itemShop";
	movingEnable = true;
	onLoad = "";
	controlsBackground[] = {ShopBground, PlayerBground};
	controls[] = {
		shopItems, shopMinus, shopAdd, shopQty, shopQtyValue, price, priceValue, buy,
		playerItems, playerMinus, playerAdd, playerQty, playerQtyValue, value, valueValue, sell, 
		close};
		
	class ShopBground : RscBground 
	{
		x = safeZoneX + 0.1;		y = 0;
		w = 0.3;		h = 0.91;
	};
	
	class PlayerBground : RscBground 
	{
		x = safeZoneX + safeZoneW - 0.4;		y = 0;
		w = 0.3;		h = 1;
	};

	class shopItems : RscListBox 
	{
		idc = 5017;
		x = safeZoneX + 0.115;		y = 0.015;
		w = 0.27;		h = 0.43;
		onLBSelChanged = "deleteVehicle shopObject; [] call AFAL_fnc_itemShop_select";
	};
	
	class playerItems : RscListBox 
	{
		idc = 5015;
		x = safeZoneX + safeZoneW - 0.385;		y = 0.015;
		w = 0.27;		h = 0.43;
		onLBSelChanged = "deleteVehicle shopObject;[] call AFAL_fnc_itemShop_select";
	};
	
	class shopMinus : RscButton
	{
		idc = 5018;
		x = safeZoneX + 0.115;		y = 0.46;
		w = 0.1275;		h = 0.075;
		text = "-";
		sizeEx = 0.11;
		action = "[5002,'sub',5000,5017,5001] call AFAL_fnc_itemShop_qty";
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.8};
	};
	
	class shopAdd : RscButton
	{
		x = safeZoneX + 0.2575;		y = 0.46;
		w = 0.1275;		h = 0.075;
		text = "+";
		sizeEx = 0.08;
		action = "[5002,'add',5000,5017,5001] call AFAL_fnc_itemShop_qty";
		colorBackgroundActive[] = { 0, 0.8, 0.3, 0.8};
	};	
	
	class playerMinus : RscButton
	{
		x = safeZoneX + safeZoneW - 0.385;		y = 0.46;
		w = 0.1275;		h = 0.075;
		text = "-";
		sizeEx = 0.11;
		action = "[5003,'sub',5000,5015,5004] call AFAL_fnc_itemShop_qty";
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.8};
	};
	
	class playerAdd : RscButton
	{
		x = safeZoneX + safeZoneW - 0.2425;		y = 0.46;
		w = 0.1275;		h = 0.075;
		text = "+";
		sizeEx = 0.08;
		action = "[5003,'add',5000,5015,5004] call AFAL_fnc_itemShop_qty";
		colorBackgroundActive[] = { 0, 0.8, 0.3, 0.8};
	};

	class shopQty : RscText
	{
		x = safeZoneX + 0.115;		y = 0.55;
		w = 0.135;		h = 0.075;
		text = "QTY";
	};
	
		class shopQtyValue : RscText
		{
			idc = 5002
			style = 2;
			x = safeZoneX + 0.25;		y = 0.55;
			w = 0.135;		h = 0.075;
			text = "1";
		};
		
	class playerQty : RscText
	{
		x = safeZoneX + safeZoneW - 0.385;		y = 0.55;
		w = 0.135;		h = 0.075;
		text = "QTY";
	};
	
		class playerQtyValue : RscText
		{
			idc = 5003
			style = 2;
			x = safeZoneX + safeZoneW - 0.25;		y = 0.55;
			w = 0.135;		h = 0.075;
			text = "1";
		};

	class price : RscText
	{
		x = safeZoneX + 0.115;		y = 0.64;
		w = 0.27;		h = 0.075;
		text = "PRICE";
		colorText[] = { 0, 0.8, 0.3, 0.8};
	};	
	
		class priceValue : RscText
		{
			idc = 5001;
			style = 2;
			x = safeZoneX + 0.115;		y = 0.73;
			w = 0.27;		h = 0.075;
			text = "$ 0";
		};
		
	class value : RscText
	{
		x = safeZoneX + safeZoneW - 0.385;		y = 0.64;
		w = 0.27;		h = 0.075;
		text = "VALUE";
		colorText[] = { 0, 0.8, 0.3, 0.8};
	};	
	
		class valueValue : RscText
		{
			idc = 5004;
			style = 2;
			x = safeZoneX + safeZoneW - 0.385;		y = 0.73;
			w = 0.27;		h = 0.075;
			text = "$ 0";
		};
	
	class buy : RscButton
	{
		x = safeZoneX + 0.115;		y = 0.82;
		w = 0.27;		h = 0.075;
		text = "BUY";
		action = "['Buy'] spawn AFAL_fnc_itemShop_transaction;";
	};
	
	class sell : RscButton
	{
		x = safeZoneX + safeZoneW - 0.385;		y = 0.82;
		w = 0.27;		h = 0.075;
		text = "SELL";
		action = "['Sell'] spawn AFAL_fnc_itemShop_transaction;";
	};
	
	class close : RscButton
	{
		x = safeZoneX + safeZoneW - 0.385;		y = 0.91;
		w = 0.27;		h = 0.075;
		text = "CLOSE";
		action = "closeDialog 5000";
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.8};
	};
};
