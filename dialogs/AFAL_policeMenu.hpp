/*
	File: AFAL_policeMenu.hpp
	Author: Ballistic
	
	Description:
	Police interaction menu for After Altis
*/

class policeMenu {
	idd = 900;
	name = "policeMenu";
	movingEnable = false;
	onLoad = "";
	controlsBackground[] = {};
	controls[] = {
		target, person, check, search, 
		restrain, stand, sit, move, release, 
		fine, 
		radio, medical, jail, bank, pursuit, backup};
	
	class target : RscText {
		idc = 901;
		style = 2;
		x = 0.3;		y = 0.45;
		w = 0.4;		h = 0.1;
		text = "";
	};

	class person : RscButton {
		x = 0.4;		y = 0.25;
		w = 0.2;		h = 0.1;
		text = "PERSON";
		action = "[900, [912, 913], [ 902, 903, 904, 905, 906, 907, 908, 909, 910]] call AFAL_fnc_ctrlFade";
		colorBackground[] = { 0.212, 0.4, 0.55, 1};
		colorFocused[] = { 0.212, 0.4, 0.55, 1};
		colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.8};
	};
		
		class search : RscButton {
			idc = 912;
			x = 0.605;	 	y = 0.25;
			w = 0.2;		h = 0.1;
			text = "SEARCH";
			action = "";
			colorBackground[] = { 0.212, 0.4, 0.55, 0.6};
			colorFocused[] = { 0.212, 0.4, 0.55, 0.6};
			colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.4};
		};
		
		class check : RscButton {
			idc = 913;
			x = 0.195;	 	y = 0.25;
			w = 0.2;		h = 0.1;
			text = "CHECK ID";
			action = "closeDialog 900; [policeTarget] spawn AFAL_fnc_checkID";
			colorBackground[] = { 0.212, 0.4, 0.55, 0.6};
			colorFocused[] = { 0.212, 0.4, 0.55, 0.6};
			colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.4};
		};
	
	class restrain : RscButton {
		x = 0.7;		y = 0.45;
		w = 0.2;		h = 0.1;
		text = "RESTRAIN";
		action = "[900, [ 902, 903, 904, 905 ], [ 906, 907, 908, 909, 910, 912, 913]] call AFAL_fnc_ctrlFade";
		colorBackground[] = { 0.212, 0.4, 0.55, 1};
		colorFocused[] = { 0.212, 0.4, 0.55, 1};
		colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.8};
	};
	
		class stand : RscButton {
			idc = 902;
			x = 0.7;		y = 0.345;
			w = 0.2;		h = 0.1;
			text = "STAND";
			action = "";
			colorBackground[] = { 0.212, 0.4, 0.55, 0.6};
			colorFocused[] = { 0.212, 0.4, 0.55, 0.6};
			colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.4};
		};
		
		class sit : RscButton {
			idc = 903;
			x = 0.7;		y = 0.24;
			w = 0.2;		h = 0.1;
			text = "SIT";
			action = "";
			colorBackground[] = { 0.212, 0.4, 0.55, 0.6};
			colorFocused[] = { 0.212, 0.4, 0.55, 0.6};
			colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.4};
		};
		
		class move : RscButton {
			idc = 904;
			x = 0.7;		y = 0.555;
			w = 0.2;		h = 0.1;
			text = "MOVE";
			action = "";
			colorBackground[] = { 0.212, 0.4, 0.55, 0.6};
			colorFocused[] = { 0.212, 0.4, 0.55, 0.6};
			colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.4};
		};
		
		class release : RscButton {
			idc = 905;
			x = 0.7;		y = 0.66;
			w = 0.2;		h = 0.1;
			text = "RELEASE";
			action = " cursorTarget setVariable ['Restrain', false, true] ";
			colorBackground[] = { 0.212, 0.4, 0.55, 0.6};
			colorFocused[] = { 0.212, 0.4, 0.55, 0.6};
			colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.4};
		};
	
	class radio : RscButton {
		x = 0.4;		y = 0.65;
		w = 0.2;		h = 0.1;
		text = "RADIO";
		action = "[ 900, [ 906, 907, 908, 909, 910 ], [  902, 903, 904, 905, 912, 913] ] call AFAL_fnc_ctrlFade";
		colorBackground[] = { 0.212, 0.4, 0.55, 1};
		colorFocused[] = { 0.212, 0.4, 0.55, 1};
		colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.8};
	};
		
		class jail : RscButton {
			idc = 907;
			x = 0.195;		y = 0.65;
			w = 0.2;		h = 0.1;
			text = "JAILBREAK";
			colorBackground[] = { 0.212, 0.4, 0.55, 0.6};
			colorFocused[] = { 0.212, 0.4, 0.55, 0.6};
			colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.4};
		};
		
		class medical : RscButton {
			idc = 906;
			x = 0.195;		y = 0.755;
			w = 0.2;		h = 0.1;
			text = "MEDICAL";
			colorBackground[] = { 0.212, 0.4, 0.55, 0.6};
			colorFocused[] = { 0.212, 0.4, 0.55, 0.6};
			colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.4};
		};
		
		class bank : RscButton {
			idc = 908;
			x = 0.605;		y = 0.65;
			w = 0.2;		h = 0.1;
			text = "BANK";
			colorBackground[] = { 0.212, 0.4, 0.55, 0.6};
			colorFocused[] = { 0.212, 0.4, 0.55, 0.6};
			colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.4};		
		};
		
		class pursuit : RscButton {
			idc = 909;
			x = 0.605;		y = 0.755;
			w = 0.2;		h = 0.1;
			text = "PURSUIT";
			colorBackground[] = { 0.212, 0.4, 0.55, 0.6};
			colorFocused[] = { 0.212, 0.4, 0.55, 0.6};
			colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.4};		
		};
		
		class backup : RscButton {
			idc = 910;
			x = 0.4;	y = 0.755;
			w = 0.2;		h = 0.1;
			text = "BACKUP";
			colorBackground[] = { 0.212, 0.4, 0.55, 0.6};
			colorFocused[] = { 0.212, 0.4, 0.55, 0.6};
			colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.4};		
		};

	class fine : RscButton {
		x = 0.1;		y = 0.45;
		w = 0.2;		h = 0.1;
		text = "FINE";
		action = "";
		colorBackground[] = { 0.212, 0.4, 0.55, 1};
		colorFocused[] = { 0.212, 0.4, 0.55, 1};
		colorBackgroundActive[] = { 0.9, 0.9, 0.9, 0.8};
	};		
};
