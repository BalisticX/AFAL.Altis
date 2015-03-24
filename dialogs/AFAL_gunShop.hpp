/*
	File: AFAL_gunShop.hpp
	Author: Ballistic
	
	Description:
	Gun shop dialog for After Altis
*/

class gunShop 
{
	idd = 3000;
	name= "gunShop";
	movingEnable = false;
	controlsBackground[] = {WeaponBground, ExtraBground};
	controls[] = {weapons, extras, add, remove, nogun, mags, magValue, price, priceValue, buy, close};
		
	class WeaponBground : RscBground 
	{
		x = safeZoneX + 0.1;		y = 0;
		w = 0.35;		h = 1;
	};
	
	class ExtraBground : RscBground 
	{
		x = safeZoneX + safeZoneW - 0.45;		y = 0;
		w = 0.35;		h = 0.56;
	};

	class weapons : RscListBox 
	{
		idc = 3017;
		x = safeZoneX + 0.115;		y = 0.015;
		w = 0.32;		h = 0.52;
	};
	
	class extras : RscListBox 
	{
		idc = 3015;
		x = safeZoneX + safeZoneW - 0.435;		y = 0.015;
		w = 0.32;		h = 0.35;
	};
	
		class add : RscButton
		{
			x = safeZoneX + safeZoneW - 0.435;		y = 0.38;
			w = 0.32;		h = 0.075;
			text = "ADD";
			action = "call AFAL_fnc_gunShop_add";
			colorBackgroundActive[] = { 0, 0.8, 0.3, 0.8};
		};
		
		class remove : RscButton
		{
			x = safeZoneX + safeZoneW - 0.435;		y = 0.47;
			w = 0.32;		h = 0.075;
			text = "REMOVE";
			action = "call AFAL_fnc_gunShop_remove";
			colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.8};
		};
		
	class nogun : RscButton
	{
		x = safeZoneX + 0.115;		y = 0.55;
		w = 0.32;		h = 0.075;
		text = "REMOVE GUN";
		action = "call AFAL_fnc_gunShop_gun";
	};
		
	class mags : RscText
	{
		x = safeZoneX + 0.115;		y = 0.64;
		w = 0.16;		h = 0.075;
		text = "MAGS";
	};
	
		class magValue : RscText
		{
			idc = 3002
			style = 2;
			x = safeZoneX + 0.275;		y = 0.64;
			w = 0.16;		h = 0.075;
			text = "0";
		};
	
	class price : RscText
	{
		x = safeZoneX + 0.115;		y = 0.73;
		w = 0.32;		h = 0.075;
		text = "PRICE";
		colorText[] = { 0, 0.8, 0.3, 0.8};
	};	
	
		class priceValue : RscText
		{
			idc = 3001;
			style = 2;
			x = safeZoneX + 0.115;		y = 0.82;
			w = 0.32;		h = 0.075;
			text = "$ 0";
		};
	
	class buy : RscButton
	{
		x = safeZoneX + 0.115;		y = 0.91;
		w = 0.1525;		h = 0.075;
		text = "BUY";
		action = "call AFAL_fnc_gunshop_buy";
	};
	
	class close : RscButton
	{
		x = safeZoneX + 0.2825;		y = 0.91;
		w = 0.1525;		h = 0.075;
		text = "CLOSE";
		action = "closeDialog 3000";
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.8};
	};
};
