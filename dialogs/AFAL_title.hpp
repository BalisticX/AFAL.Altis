/*
	File: AFAL_title.hpp
	Author: Ballistic
	
	Description:
	Title card resource for After Altis
*/

class AFAL_title
{
	idd = 17;
	name= "AFAL_title";
	onLoad = "";
	controlsBackground[] = {title};
	controls[] = {};
	duration = 25;
		
	class title {
		idc = -1;
		type = 0;
		style = 48 + 2048;
		x = 0;		y = 0;
		w = 1;		h = 1;
		text = "images\AFAL_title.paa";
		sizeEx = 1;
		font = "PuristaMedium";
		colorText[] = {};
		colorBackground[] = {};
	};
};
