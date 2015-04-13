/*
	File: AFAL_death.hpp
	Author: Ballistic
	
	Description:
	Death screen dialog for After Altis
*/

class deathScreen 
{
	idd = 100;
	name= "deathScreen";
	movingEnable = false;
	onLoad = "";
	controlsBackground[] = {Background};
	controls[] = {bar, timer, respawn, killer, revive, secret};
		
	class Background : RscBground {
		x = 0;		y = safeZoneY + safeZoneH - 0.45;
		w = 1;		h = 0.225;
	};
	
	class bar : RscBground {
		idc = 101;
		x = 0;		y = safeZoneY + safeZoneH - 0.425;
		w = 1;		h = 0.05;
		colorBackground[] = { 0.8, 0.15, 0.15, 0.7 };
	};
	
	class timer : RscText {
		idc = 102;
		style = 2;
		x = 0;		y = safeZoneY + safeZoneH - 0.425;
		w = 1;		h = 0.05;
		text = "100";
	};
	
	class secret : RscButton {
		x = safeZoneX;		y = safeZoneY;
		w = 0.01;		h = 0.01;
		action = "player setVariable ['Dying', 0, true]; [] spawn AFAL_fnc_life";
		colorBackground[] = { 0, 0, 0, 0 };
		colorFocused[] = { 0, 0, 0, 0 };
		colorBackgroundActive[] = { 0.5, 0.5, 0.5, 0.1 };
	};
	
	class respawn : RscButton {
		idc = 103;
		x = 0.775;		y = safeZoneY + safeZoneH - 0.35;
		w = 0.2;		h = 0.1;
		text = "RESPAWN";
		action = "player setVariable ['Dying', 0, true]; player setDamage 1; [] spawn AFAL_fnc_life";
		colorBackground[] = { 0.8, 0.15, 0.15, 0.7 };
		colorFocused[] = { 0.8, 0.15, 0.15, 0.7 };
		colorDisabled[] = {  0.8, 0.15, 0.15, 0.35 };
		colorBackgroundActive[] = { 0.7, 0.7, 0.7, 0.5 };
	};
	
	class killer : RscText {
		idc = 104;
		style = 2;
		x = 0.025;		y = safeZoneY + safeZoneH - 0.35;
		w = 0.5;		h = 0.1;
		text = "";
	};
	
	class revive : RscButton {
		idc = 105;
		x = 0.55;		y = safeZoneY + safeZoneH - 0.35;
		w = 0.2;		h = 0.1;
		text = "REVIVE";
		action = "";
		colorBackground[] = { 0.18, 0.545, 0.34, 0.7 };
		colorFocused[] = { 0.18, 0.545, 0.34, 0.7 };
		colorDisabled[] = { 0.18, 0.545, 0.34, 0.35 };
		colorBackgroundActive[] = { 0.7, 0.7, 0.7, 0.5 };
	};
};
