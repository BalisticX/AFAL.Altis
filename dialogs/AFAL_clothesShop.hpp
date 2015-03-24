/*
	File: AFAL_clothesShop.hpp
	Author: Ballistic
	
	Description:
	Clothes shop dialog for After Altis
*/

class clothesShop
{
	idd = 4000;
	name= "clothesShop";
	movingEnable = true;
	onLoad = "";
	controlsBackground[] = {Background};
	controls[] = {Exit, Uniforms, Vests, Headgear, Facewear, Backpacks, Outfits, available, selected, price, priceValue, purchase};
		
	class Background : RscBground 
	{
		x = 0;		y = safeZoneY + safeZoneH - 0.53;
		w = 1;		h = 0.285;
	};
	
	class Exit : RscButton
	{
		x = 0.93;		y = safeZoneY + safeZoneH - 0.601;
		w = 0.07;		h = 0.07;
		text = "X";
		action = "closeDialog 4000";
		colorBackground[] = { 0.545, 0, 0 , 0.4};
		colorBackgroundActive[] = { 0.545, 0, 0, 0.8};
		colorFocused[] = { 0.545, 0, 0, 0.4};
	};
	
	class Uniforms : RscButton
	{
		x = 0;		y = safeZoneY + safeZoneH - 0.601;
		w = 0.155;		h = 0.07;
		text = "Uniforms";
		action = "[shopType, 'Uniforms'] call AFAL_fnc_clothesShop_switch";
		sizeEx = 0.04;
		colorBackgroundActive[] = { 1, 0.5, 0.14, 0.8};
	};
	
	class Vests : RscButton
	{
		x = 0.155;		y = safeZoneY + safeZoneH - 0.601;
		w = 0.155;		h = 0.07;
		text = "Vests";
		action = "[shopType, 'Vests'] call AFAL_fnc_clothesShop_switch";
		sizeEx = 0.04;
		colorBackgroundActive[] = { 0.855, 0.647, 0.125,0.8};
	};
	
	class Headgear : RscButton
	{
		x = 0.31;		y = safeZoneY + safeZoneH - 0.601;
		w = 0.155;		h = 0.07;
		text = "Headgear";
		action = "[shopType, 'Headgear'] call AFAL_fnc_clothesShop_switch";
		sizeEx = 0.04;
		colorBackgroundActive[] = { 0.42, 0.557, 0.137, 0.8};
	};
	
	class Facewear : RscButton
	{
		x = 0.466;		y = safeZoneY + safeZoneH - 0.601;
		w = 0.154;		h = 0.07;
		text = "Facewear";
		action = "[shopType, 'Facewear']  call AFAL_fnc_clothesShop_switch";
		sizeEx = 0.04;
		colorBackgroundActive[] = { 0.275, 0.51, 0.706, 0.8};
	};
	
	class Backpacks : RscButton
	{
		x = 0.62;		y = safeZoneY + safeZoneH - 0.601;
		w = 0.155;		h = 0.07;
		text = "Backpacks";
		action = "[shopType, 'Backpacks']  call AFAL_fnc_clothesShop_switch";
		sizeEx = 0.04;
		colorBackgroundActive[] = { 0.365, 0.278, 0.545, 0.8};
	};
	
	class Outfits : RscButton
	{
		x = 0.775;		y = safeZoneY + safeZoneH - 0.601;
		w = 0.155;		h = 0.07;
		text = "Outfits";
		action = "[shopType, 'Presets']  call AFAL_fnc_clothesShop_switch";
		sizeEx = 0.04;
		colorBackgroundActive[] = { 0.855, 0.44,0.84, 0.8};
	};
	
	class available : RscListBox 
	{
		idc = 4017;
		x = 0.015;		y = safeZoneY + safeZoneH - 0.515;
		w = 0.35;		h = 0.255;
		onLbDblClick = "[] call AFAL_fnc_clothesShop_add";
	};
	
	class selected : RscListBox 
	{
		idc = 4015;
		x = 0.38;		y = safeZoneY + safeZoneH - 0.515;
		w = 0.335;		h = 0.255;
		onLbDblClick = "[] call AFAL_fnc_clothesShop_remove";
	};
	
/*	

	class add : RscButton 
	{
		x = 0.38;		y = safeZoneY + safeZoneH - 0.335;
		w = 0.16;		h = 0.075;
		text = "ADD";
		action = "execVM 'scripts\dialogs\AFAL_clothesShop_add.sqf'";
		colorBackgroundActive[] = { 0, 0.8, 0.3, 0.8};
	};
	
	class remove : RscButton 
	{
		x = 0.555;		y = safeZoneY + safeZoneH - 0.335;
		w = 0.16;		h = 0.075;
		text = "REMOVE";
		action = "execVM 'scripts\dialogs\AFAL_clothesShop_remove.sqf'";
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.8};
	};
	
*/
	
	class price : RscText
	{
		x = 0.73;		y = safeZoneY + safeZoneH - 0.515;
		w = 0.17;		h = 0.075;
		text = "PRICE";
		colorText[] = { 0, 0.8, 0.3, 0.8};
	};
	
		class priceValue : RscText
		{
			idc = 4001;
			style = 2;
			x = 0.73;		y = safeZoneY + safeZoneH - 0.425;
			w = 0.255;		h = 0.075;
			text = "$ 0";
		};
		
	class purchase : RscButton
	{
		x = 0.73;		y = safeZoneY + safeZoneH - 0.335;
		w = 0.255;		h = 0.075;
		text = "PURCHASE";
		action = "[] call AFAL_fnc_clothesShop_buy";
	};
};
