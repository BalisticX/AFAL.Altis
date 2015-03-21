/*
	File: AFAL_lockpick.hpp
	Author: Ballistic
	
	Description:
	Lockpicking dialog for After Altis
*/

class AFAL_lockpick 
{
	idd = 1700;
	name= "AFAL_lockpick";
	movingEnable = false;
	onLoad = "";
	controlsBackground[] = {overlay};
	controls[] = {lockpick, tumblers, lock, slider, value, attempt, strikes, strike1, strike2, strike3};
	
	class overlay : RscBground {
		x = safeZoneX - safeZoneW;		y = safeZoneY - safeZoneH;
		w = safeZoneW * 3;		h = safeZoneH * 3;
		colorBackground[] = { 0, 0, 0, 0.4};
	};
	
	class lockpick : RscBground {
		idc = 1701;
		style = 48 + 2048;
		x = -0.5;		y = 0.105;
		w = 0.9;		h = 0.45;
		text = "images\AFAL_lockpick.paa";
		colorText[] = {};
		colorBackground[] = {};
	};
	
	class tumblers : RscBground {
		idc = 1702;
		style = 48 + 2048;
		x = 0;		y = 0;
		w = 1;		h = 1;
		text = "images\AFAL_lockpick_tumblers.paa";
		colorText[] = {};
		colorBackground[] = {};
	};
	
	class lock : RscBground {
		style = 48 + 2048;
		x = 0;		y = 0;
		w = 1;		h = 1;
		text = "images\AFAL_lockpick_base.paa";
		colorText[] = {};
		colorBackground[] = {};
	};
	
	class slider : RscText {
		idc = 1717;
		type = 3; 
		style = 1024; 
		x = 0.15;		y = 0.43; 
		w = 0.63;		h = 0.075; 
		color[] = { 1, 1, 1, 1 }; 
		colorActive[] = { 1, 1, 1, 1};
		onSliderPosChanged = "((findDisplay 1700) displayCtrl 1703) ctrlSetText format ['%1', round (sliderPosition 1717 * 10)];((findDisplay 1700) displayCtrl 1701) ctrlSetPosition [-0.5 + ((sliderPosition 1717)*0.045), 0.105, 0.9, 0.45]; ((findDisplay 1700) displayCtrl 1701) ctrlCommit 0.1;";
	};
	
	class value : RscText {
		idc = 1703;
		style = 2;
		x = 0.2175;		y = 0.52;
		w = 0.1;		h = 0.075;
		text = "0";
		colorText[] = { 1, 1, 1, 0.75};
	};
	
	class attempt : RscButton {
		style = 2;
		x = 0.2175;		y = 0.615;
		w = 0.1;		h = 0.075;
		text = "TRY";
		action = "spawn AFAL_fnc_lockpick_attempt";
		colorText[] = { 1, 1, 1, 0.75};
		colorBackground[] = { 0, 0, 0, 0};
		colorFocused[] = { 0, 0, 0, 0};
		colorBackgroundActive[] = { 0, 0.8, 0.3, 0.2};
	};
	
	class strikes : RscText {
		x = 0.375;		y = 0.52;
		w = 0.2;		h = 0.075;
		text = "STRIKES";
		colorText[] = { 1, 1, 1, 0.75};
	};
	
	class strike1 : RscText {
		idc = 1711;
		style = 2;
		x = 0.4;		y = 0.585;
		w = 0.1;		h = 0.075;
		text = "X";
		sizeEx = 0.07;
		colorText[] = { 0, 0, 0, 0.5};
	};
	
	class strike2 : RscText {
		idc = 1712;
		style = 2;
		x = 0.475;		y = 0.585;
		w = 0.1;		h = 0.075;
		text = "X";
		sizeEx = 0.07;
		colorText[] = { 0, 0, 0, 0.5};
	};
	
	class strike3 : RscText {
		idc = 1713;
		style = 2;
		x = 0.55;		y = 0.585;
		w = 0.1;		h = 0.075;
		text = "X";
		sizeEx = 0.07;
		colorText[] = { 0, 0, 0, 0.5};
	};
};
