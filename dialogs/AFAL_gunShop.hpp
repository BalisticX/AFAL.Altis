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
	movingEnable = true;
	onLoad = "";
	controlsBackground[] = {WeaponBground, ExtraBground};
	controls[] = {weapons, extras, add, remove, mags, magValue, price, priceValue, weaponBuy, close};
		
	class WeaponBground : RscBground 
	{
		x = safeZoneX + 0.1;		y = 0;
		w = 0.3;		h = 1;
	};
	
	class ExtraBground : RscBground 
	{
		x = safeZoneX + safeZoneW - 0.4;		y = 0;
		w = 0.3;		h = 0.56;
	};

	class weapons : RscListBox 
	{
		idc = 3017;
		x = safeZoneX + 0.115;		y = 0.015;
		w = 0.27;		h = 0.52;
	};
	
	class extras : RscListBox 
	{
		idc = 3015;
		x = safeZoneX + safeZoneW - 0.385;		y = 0.015;
		w = 0.27;		h = 0.35;
	};
	
		class add : RscButton
		{
			x = safeZoneX + safeZoneW - 0.385;		y = 0.38;
			w = 0.27;		h = 0.075;
			text = "ADD";
			action = "[] spawn AFAL_fnc_gunShop_add";
			colorBackgroundActive[] = { 0, 0.8, 0.3, 0.8};
		};
		
		class remove : RscButton
		{
			x = safeZoneX + safeZoneW - 0.385;		y = 0.47;
			w = 0.27;		h = 0.075;
			text = "REMOVE";
			action = "[] spawn AFAL_fnc_gunShop_remove";
			colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.8};
		};
		
	class mags : RscText
	{
		x = safeZoneX + 0.115;		y = 0.55;
		w = 0.135;		h = 0.075;
		text = "MAGS";
	};
	
		class magValue : RscText
		{
			idc = 3002
			style = 2;
			x = safeZoneX + 0.25;		y = 0.55;
			w = 0.135;		h = 0.075;
			text = "0";
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
			idc = 3001;
			style = 2;
			x = safeZoneX + 0.115;		y = 0.73;
			w = 0.27;		h = 0.075;
			text = "$ 0";
		};
	
	class weaponBuy : RscButton
	{
		x = safeZoneX + 0.115;		y = 0.82;
		w = 0.27;		h = 0.075;
		text = "BUY";
		action = "deleteVehicle extraHolder; [] spawn AFAL_fnc_gunShop_buy";
	};
	
	class close : RscButton
	{
		x = safeZoneX + 0.115;		y = 0.91;
		w = 0.27;		h = 0.075;
		text = "CLOSE";
		action = "closeDialog 3000";
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.8};
	};
};
