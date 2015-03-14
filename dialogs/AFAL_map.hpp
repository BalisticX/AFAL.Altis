/*
	File: AFAL_Map.hpp
	Author: Ballistic
	
	Description:
	The interactive County map for After Altis
*/

class AFAL_map 
{
	idd = 500;
	name= "AFAL_map";
	movingEnable = true;
	controlsBackground[] = {Background};
	controls[] = {map, locations, waypoint, close};
		
	class Background : RscBground 
	{
		x = 0;		y = 0;
		w = 1;		h = 1;
	};
	
	class map : RscMapControl 
	{
		idc = 515;
		x = 0.015;		y = 0.015;
		w = 0.685;		h = 0.97;
	};

	class locations : RscListBox 
	{
		idc = 517;
		x = 0.715;		y = 0.015;
		w = 0.27;		h = 0.79;
	};
	
	class waypoint : RscButton
	{
		x = 0.715;		y = 0.82;
		w = 0.27;		h = 0.075;
		text = "WAYPOINT";
		action = "";
	};
	
	class close : RscButton
	{
		x = 0.715;		y = 0.91;
		w = 0.27;		h = 0.075;
		text = "CLOSE";
		action = "closeDialog 500";
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.8};
	};
};
