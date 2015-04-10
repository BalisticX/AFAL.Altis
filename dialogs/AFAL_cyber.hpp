/*
	File: AFAL_cyber.hpp
	Author: Ballistic
	
	Description:
	Cyber system dialogs for After Altis
*/

class cyberCommand
{
	idd = 1900;
	name= "cyberCommand";
	movingEnable = false;
	onLoad = "((findDisplay 1900) displayCtrl 1901) ctrlSetText format ['%1', time]";
	controlsBackground[] = {background1, background2, bar1, bar2};
	controls[] = {logout, playerName, time, cameraPic, cameraText, cameraButton, cameraList, atmPic, atmText, atmButton, atmList};
	
	class background1 : RscBground {
		x = 0;		y = 0;
		w = 1;		h = 0.92;
		colorBackground[] = { 0.275, 0.51, 0.706, 1};
	};
	
	class background2 : RscBground {
		x = 0.01;		y = 0.01;
		w = 0.98;		h = 0.92;
		colorBackground[] = { 0.31, 0.58, 0.804, 1};
	};
	
	class bar1 : RscBground {
		x = 0;		y = 0.92;
		w = 1;		h = 0.08;
		colorBackground[] = { 0.55, 0.55, 0.55, 1};
	};
	
	class bar2 : RscBground {
		x = 0.01;		y = 0.92;
		w = 0.98;		h = 0.07;
		colorBackground[] = { 0.6, 0.6, 0.6, 1};
	};
	
	class cameraPic : RscBground {
		style = 48 + 2048;
		x = 0.2;		y = 0.3;
		w = 0.2;		h = 0.175;
		text = "images\AFAL_camera.paa";
		colorText[] = {};
		colorBackground[] = {};
	};
	
	class cameraText : RscText {
		style = 2;
		x = 0.2;		y = 0.475;
		w = 0.2;		h = 0.1;
		text = "CAMERAS";
	};
	
	class cameraButton : RscButton {
		x = 0.2;		y = 0.3;
		w = 0.2;		h = 0.275;
		text = "";
		action = "if ( ctrlFade ((findDisplay 1900) displayCtrl 1901) > 0.5 ) then {	((findDisplay 1900) displayCtrl 1901) ctrlSetFade 0; ((findDisplay 1900) displayCtrl 1901) ctrlCommit 0.1;	} else {	((findDisplay 1900) displayCtrl 1901) ctrlSetFade 1; ((findDisplay 1900) displayCtrl 1901) ctrlCommit 0.1;	}";
		tooltip = "Access the surveillence system";
		colorBackground[] = { 0, 0, 0, 0};
		colorFocused[] = { 0, 0, 0, 0};
		colorBackgroundActive[] = { 1, 1, 1, 0.1};		
	};
	
	class cameraList : RscListBox {
		idc = 1901;
		style = 2;
		x = 0.2;		y = 0.575;
		w = 0.2;		h = 0.25;
		colorSelectBackground[] = { 0.9, 0.9, 0.9, 0.5};
		colorSelectBackground2[] = { 0.9, 0.9, 0.9, 0.5};
		colorBackground[] = { 1, 1, 1, 0.1};
		colorDisabled[] = { 0.275, 0.51, 0.706, 0};
		colorShadow[] = { 0.275, 0.51, 0.706, 0.5};
		onLbDblClick = "closeDialog 1900; createDialog 'cyberXray'; [] spawn AFAL_fnc_cyberXray";
		onLBSelChanged = "xrayCircut = ((findDisplay 1900) displayCtrl 1901) lbData lbCurSel ((findDisplay 1900) displayCtrl 1901)";
	};
	
	class atmPic : RscBground {
		style = 48 + 2048;
		x = 0.5;		y = 0.3;
		w = 0.2;		h = 0.175;
		text = "images\AFAL_atm.paa";
		colorText[] = {};
		colorBackground[] = {};
	};
	
	class atmText : RscText {
		style = 2;
		x = 0.5;		y = 0.475;
		w = 0.2;		h = 0.1;
		text = "ATMS";
	};
	
	class atmButton : RscButton {
		x = 0.5;		y = 0.3;
		w = 0.2;		h = 0.275;
		text = "";
		action = "if ( ctrlFade ((findDisplay 1900) displayCtrl 1904) > 0.5 ) then {	((findDisplay 1900) displayCtrl 1904) ctrlSetFade 0; ((findDisplay 1900) displayCtrl 1904) ctrlCommit 0.1;	} else {	((findDisplay 1900) displayCtrl 1904) ctrlSetFade 1; ((findDisplay 1900) displayCtrl 1904) ctrlCommit 0.1;	}";
		tooltip = "Access the ATM monitor system";
		colorBackground[] = { 0, 0, 0, 0};
		colorFocused[] = { 0, 0, 0, 0};
		colorBackgroundActive[] = { 1, 1, 1, 0.1};		
	};
	
	class atmList : RscListBox {
		idc = 1904;
		style = 2;
		x = 0.5;		y = 0.575;
		w = 0.2;		h = 0.15;
		colorSelectBackground[] = { 0.9, 0.9, 0.9, 0.5};
		colorSelectBackground2[] = { 0.9, 0.9, 0.9, 0.5};
		colorBackground[] = { 1, 1, 1, 0.1};
		colorDisabled[] = { 0.275, 0.51, 0.706, 0};
		colorShadow[] = { 0.275, 0.51, 0.706, 0.5};
		onLbDblClick = "";
	};
	
	class playerName : RscText {
		idc = 1902;
		x = 0.02;		y = 0.02;
		w = 0.4;		h = 0.075;
		text = "";
	};
	
	class time : RscText {
		idc = 1903;
		style = 1;
		x = 0.74;		y = 0.02;
		w = 0.24;		h = 0.075;
		text = "";
	};
	
	class logout : RscButton {
		x = 0.85;		y = 0.92;
		w = 0.14;		h = 0.07;
		text = "LOGOUT";
		action = "closeDialog 1900";
		colorBackground[] = {0,0,0,0};
		colorFocused[] = {0,0,0,0};
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 1};
	};
};

//////// SURVEILLENCE CAMERA DIALOG ////////

class cyberXRay
{
	idd = 1910;
	name= "cyberXRay";
	movingEnable = false;
	onLoad = "";
	controlsBackground[] = {};
	controls[] = {location, time, rec, previous, next, close};
	
	class location : RscText {
		idc = 1911;
		x = safeZoneX + safeZoneW * 0.25;		y = safeZoneY + safeZoneH * 0.1;
		w = 0.4;		h = 0.1;
		text = "";
	};
	
	class time : RscText {
		idc = 1912;
		x = safeZoneX + safeZoneW * 0.5;		y = safeZoneY + safeZoneH * 0.1;
		w = 0.4;		h = 0.1;
		text = "";
	};
	
	class rec : RscText {
		x = (safeZoneX + safeZoneW) - safeZoneW * 0.25;		y = safeZoneY + safeZoneH * 0.1;
		w = 0.2;		h = 0.1;
		text = "REC";
		colorText[] = { 0.8, 0.2, 0.2, 1};
	};
	
	class previous : RscButton {
		x = safeZoneX + safeZoneW * 0.25;		y = (safeZoneY + safeZoneH) - safeZoneH * 0.2;
		w = 0.2;		h = 0.1;
		text = "< PREVIOUS";
		action = "xrayCount = xrayCount - 1; [] spawn AFAL_fnc_cyberXray";
		colorBackground[] = { 0, 0, 0, 0};
		colorFocused[] = { 0, 0, 0, 0};
		colorBackgroundActive[] = { 1, 1, 1, 0.1};
	};
	
	class next : RscButton {
		x = safeZoneX + safeZoneW * 0.35;		y = (safeZoneY + safeZoneH) - safeZoneH * 0.2;
		w = 0.2;		h = 0.1;
		text = "NEXT >";
		action = "xrayCount = xrayCount + 1; [] spawn AFAL_fnc_cyberXray";
		colorBackground[] = { 0, 0, 0, 0};
		colorFocused[] = { 0, 0, 0, 0};
		colorBackgroundActive[] = { 1, 1, 1, 0.1};
	};
	
	class close : RscButton {
		x = (safeZoneX + safeZoneW) - safeZoneW * 0.3;		y = (safeZoneY + safeZoneH) - safeZoneH * 0.2;
		w = 0.2;		h = 0.1;
		text = "CLOSE";
		action = "closeDialog 1910";
		colorBackground[] = { 0, 0, 0, 0};
		colorFocused[] = { 0, 0, 0, 0};
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.2};
	};
};
