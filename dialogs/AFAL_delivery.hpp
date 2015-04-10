/*
	File: AFAL_delivery.hpp
	Author: Ballistic
	
	Description:
	Delivery job dialog for After Altis
*/

class AFAL_delivery
{
	idd = 1800;
	name= "AFAL_delivery";
	movingEnable = true;
	onLoad = "";
	controlsBackground[] = {background, border, close};
	controls[] = {map, start, to, finish, distance, distanceValue, payment, paymentValue, accept};
		
	class background : RscBground {
		x = 0;		y = 0.075;
		w = 1;		h = 0.725;
	};
	
	class border : RscText {
		style = 2;
		moving = true;
		x = 0;		y = 0;
		w = 0.925;		h = 0.075;
		text = "DELIVERY OVERVIEW";
		colorBackground[] = { 0.2, 0.2, 0.2, 0.8};
	};
	
	class close : RscButton {
		x = 0.925;		y = 0;
		w = 0.075;		h = 0.075;
		text = "X";
		sizeEx = 0.075;
		action = "isDelivery = false; closeDialog 1800";
		colorBackground[] = { 0.545, 0, 0 , 0.8};
		colorFocused[] = { 0.545, 0, 0, 0.8};
		colorBackgroundActive[] = { 0.545, 0, 0, 0.6};
	};
	
	class map : RscMapControl {
		idc = 1801;
		x = 0.015;		y = 0.09;
		w = 0.97;		h = 0.5;
	};
	
	class start : RscText {
		idc = 1802;
		style = 2;
		x = 0.015;		y = 0.605;
		w = 0.4;		h = 0.075;
		text = "";
	};
	
	class to : RscText {
		style = 2;
		x = 0.415;		y = 0.605;
		w = 0.17;		h = 0.075;
		text = "TO";
	};
	
	class finish : RscText {
		idc = 1803;
		style = 2;
		x = 0.585;		y = 0.605;
		w = 0.4;		h = 0.075;
		text = "";
	};
	
	class distance : RscText {
		x = 0.015;		y = 0.695;
		w = 0.15;		h = 0.075;
		text = "DISTANCE";
	};
	
		class distanceValue : RscText {
			idc = 1804;
			style = 2;
			x = 0.18;		y = 0.695;
			w = 0.2;		h = 0.075;
			text = "";
		};
		
	class payment : RscText {
		x = 0.395;		y = 0.695;
		w = 0.15;		h = 0.075;
		text = "PAYMENT";
	};
	
		class paymentValue : RscText {
			idc = 1805;
			style = 2;
			x = 0.56;		y = 0.695;
			w = 0.15;		h = 0.075;
			text = "";
		};
	
	class accept : RscButton {
		x = 0.74;		y = 0.695;
		w = 0.23;		h = 0.075;
		text = "ACCEPT";
		action = "isDelivery = true; closeDialog 1800";
		colorBackgroundActive[] = { 0, 0.8, 0.3, 0.8};
	};
};
