/*
	File: AFAL_vehicleShop.hpp
	Author: Ballistic
	
	Description:
	Vehicle shop dialog for After Altis
*/

class vehicleShop 
{
	idd = 2000;
	name= "vehicleShop";
	movingEnable = true;
	onLoad = "";
	controlsBackground[] = {Background};
	controls[] = {vehicles, price, priceValue, rent, buy, close};
		
	class Background : RscBground {
		x = 0;		y = safeZoneY + safeZoneH - 0.53;
		w = 1;		h = 0.285;
	};

	class vehicles : RscListBox {
		idc = 2017;
		x = 0.015;		y = safeZoneY + safeZoneH - 0.515;
		w = 0.45;		h = 0.255;
	};
	
	class price : RscText {
		x = 0.525;		y = safeZoneY + safeZoneH - 0.515;
		w = 0.255;		h = 0.075;
		text = "PRICE";
		colorText[] = { 0, 0.8, 0.3, 0.8};
	};
	
		class priceValue : RscText {
			idc = 2001;
			style = 2;
			x = 0.525;		y = safeZoneY + safeZoneH - 0.425;
			w = 0.255;		h = 0.075;
			text = "$ 0";
		};
		
	class rent : RscButton {
		x = 0.815;		y = safeZoneY + safeZoneH - 0.515;
		w = 0.17;		h = 0.075;
		text = "RENT";
		action = "systemChat 'Currently Unavailable'";
		colorText[] = { 0.8, 0.2, 0.2, 0.8};
		colorBackground[] = { 0.2, 0.2, 0.2, 0.4};
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.8};
	};
	
	class buy : RscButton {
		x = 0.815;		y = safeZoneY + safeZoneH - 0.425;
		w = 0.17;		h = 0.075;
		text = "BUY";
		action = "execVM 'scripts\dialogs\AFAL_vehicleShop_buy.sqf'";
		colorBackgroundActive[] = { 0, 0.8, 0.3, 0.2};
	};
	
	class close : RscButton {
		x = 0.815;		y = safeZoneY + safeZoneH - 0.335;
		w = 0.17;		h = 0.075;
		text = "CLOSE";
		action = "closeDialog 2000";
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.8};
	};
};
