/*
	File: AFAL_playerMenu.hpp
	Author: Ballistic
	
	Description:
	Player menu mk. III dialog for After Altis
*/

class playerMenu {
	idd = 1000;
	name = "playerMenu";
	movingEnable = false;
	onLoad = "";
	controlsBackground[] = {};
	controls[] = {quick, phone, inventory, group, money, vehicles, settings, close};

	class quick : RscButton {
		x = 0.4;		y = 0.2;
		w = 0.2;		h = 0.1;
		text = "QUICK USE";
		action = "";
		colorBackground[] = { 0, 0, 0, 0.4};
		colorFocused[] = { 0, 0, 0, 0.4};
		colorBackgroundActive[] = { 0, 0, 0, 0.2};
	};
	
	class phone : RscButton {
		x = 0.65;		y = 0.275;
		w = 0.2;		h = 0.1;
		text = "PHONE";
		action = "closeDialog 1000; createDialog 'playerMenu_phone'";
		colorBackground[] = { 0, 0, 0, 0.4};
		colorFocused[] = { 0, 0, 0, 0.4};
		colorBackgroundActive[] = { 0, 0, 0, 0.2};
	};
	
	class inventory : RscButton {
		x = 0.7;		y = 0.45;
		w = 0.2;		h = 0.1;
		text = "INVENTORY";
		action = "closeDialog 1000; createDialog 'playerMenu_inventory'";
		colorBackground[] = { 0, 0, 0, 0.4};
		colorFocused[] = { 0, 0, 0, 0.4};
		colorBackgroundActive[] = { 0, 0, 0, 0.2};
	};
	
	class group : RscButton {
		x = 0.15;		y = 0.275;
		w = 0.2;		h = 0.1;
		text = "GROUP";
		action = "closeDialog 1000; createDialog 'playerMenu_group'";
		colorBackground[] = { 0, 0, 0, 0.4};
		colorFocused[] = { 0, 0, 0, 0.4};
		colorBackgroundActive[] = { 0, 0, 0, 0.2};
	};
	
	class money : RscButton {
		x = 0.1;		y = 0.45;
		w = 0.2;		h = 0.1;
		text = "MONEY";
		action = "closeDialog 1000; createDialog 'playerMenu_money'";
		colorBackground[] = { 0, 0, 0, 0.4};
		colorFocused[] = { 0, 0, 0, 0.4};
		colorBackgroundActive[] = { 0, 0, 0, 0.2};
	};
	
	class vehicles : RscButton {
		x = 0.65;		y = 0.625;
		w = 0.2;		h = 0.1;
		text = "VEHICLES";
		action = "closeDialog 1000; createDialog 'playerMenu_vehicles'";
		colorBackground[] = { 0, 0, 0, 0.4};
		colorFocused[] = { 0, 0, 0, 0.4};
		colorBackgroundActive[] = { 0, 0, 0, 0.2};
	};
	
	class settings : RscButton {
		x = 0.15;		y = 0.625;
		w = 0.2;		h = 0.1;
		text = "SETTINGS";
		action = "closeDialog 1000; createDialog 'playerMenu_settings'";
		colorBackground[] = { 0, 0, 0, 0.4};
		colorFocused[] = { 0, 0, 0, 0.4};
		colorBackgroundActive[] = { 0, 0, 0, 0.2};
	};
	
	class close : RscButton {
		x = 0.4;		y = 0.7;
		w = 0.2;		h = 0.1;
		text = "CLOSE";
		action = "closeDialog 1000;";
		colorBackground[] = { 0.8, 0.2, 0.2, 0.6};
		colorFocused[] = { 0.8, 0.2, 0.2, 0.6};
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.4};
	};
};

//////////////////////////////// INVENTORY MENU ////////////////////////////////

class playerMenu_inventory {
	idd = 1100;
	name = "playerMenu_inventory";
	movingEnable = true;
	onLoad = "";
	controlsBackground[] = {background};
	controls[] = {close, inventory, use, equip, edit, quick, target, give, drop};
	
	class background : RscBground {
		moving = true;
		x = 0.6;		y = 0;
		w = 0.4;		h = 1;
	};
	
	class inventory : RscListbox {
		idc = 1101;
		x = 0.615;		y = 0.015;
		w = 0.37;		h = 0.57;
	};
	
	class use : RscButton {
		x = 0.615;		y = 0.6;
		w = 0.1775;		h = 0.075;
		text = "USE";
		action = "";
	};
	
	class equip : RscButton {
		x = 0.8075;		y = 0.6;
		w = 0.1775;		h = 0.075;
		text = "EQUIP";
		action = "";
	};
	
	class edit : RscEdit {
		idc = 1102;
		style = 2;
		x = 0.615;		y = 0.71;
		w = 0.1775;		h = 0.075;
		text = "0";
		sizeEx = 0.04;
	};
	
	class quick : RscText {
		idc = 1103;
		style = 2;
		x = 0.8075;		y = 0.71;
		w = 0.1775;		h = 0.075;
		text = "Quick Use";
		sizeEx = 0.04;
	};
	
	class target : RscCombo {
		idc = 1104;
		x = 0.615;		y = 0.82;
		w = 0.37;		h = 0.075;
	};
	
	class give : RscButton {
		x = 0.615;		y = 0.91;
		w = 0.1775;		h = 0.075;
		text = "GIVE";
		action = "";
	};
	
	class drop : RscButton {
		x = 0.8075;		y = 0.91;
		w = 0.1775;		h = 0.075;
		text = "DROP";
		action = "";
	};
	
	class close : RscButton {
		x = 0.95;		y = 0;
		w = 0.05;		h = 0.05;
		text = "X";
		action = "closeDialog 1100";
		colorBackground[] = { 0, 0, 0, 0};
		colorFocused[] = { 0, 0, 0, 0};
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.4};
	};
};

//////////////////////////////// PHONE MENU ////////////////////////////////

class playerMenu_phone 
{
	idd = 1200;
	name = "playerMenu_phone";
	movingEnable = true;
	onLoad = "";
	controlsBackground[] = {background, phone};
	controls[] = {close, message, edit, to, contacts, send};
	
	class background : RscBground {
		x = 0.65;		y = 0.2;
		w = 0.32;		h = 0.65;
		colorBackground[] = { 0, 0, 0, 0.75};
	};
	
	class phone : RscBground {
		moving = true;
		style = 48 + 2048;
		x = 0.6;		y = 0;
		w = 0.4;		h = 1;
		text = "images\AFAL_phone.paa";
		colorText[] = {};
		colorBackground[] = {};
	};
	
	class close : RscButton {
		x = 0.9025;		y = 0.22;
		w = 0.05;		h = 0.05;
		text = "X";
		action = "closeDialog 1200";
		colorBackground[] = { 0, 0, 0, 0};
		colorFocused[] = { 0, 0, 0, 0};
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.4};
	};
	
	class message : RscText {
		x = 0.67;		y = 0.23;
		w = 0.27;		h = 0.06;
		text = "> Message";
		shadow = 2;
	};
	
	class edit : RscEdit {
		idc = 1201;
		style = 16;
		x = 0.67;		y = 0.3;
		w = 0.27;		h = 0.28;
		text = "";
		lineSpacing = 1;
	};
	
	class to : RscText {
		x = 0.67;		y = 0.57;
		w = 0.27;		h = 0.06;
		text = "> To";
		shadow = 2;
	};
	
	class contacts : RscCombo {
		idc = 1202;
		x = 0.67;		y = 0.64;
		w = 0.27;		h = 0.06;
	};
		
	class send : RscButton {
		x = 0.67;		y = 0.715;
		w = 0.27;		h = 0.06;
		text = "SEND";
		action = "";
		colorBackgroundActive[] = { 0, 0.8, 0.3, 0.8};
	};
};

//////////////////////////////// MONEY MENU ////////////////////////////////

class playerMenu_money {
	idd = 1300;
	name = "playerMenu_money";
	movingEnable = true;
	onLoad = "";
	controlsBackground[] = {background};
	controls[] = {cash, cashValue, bank, bankValue, edit, target, give, close};
	
	class background : RscBground {
		moving = true;
		x = 0;		y = 0.2;
		w = 0.3;		h = 0.715;
	};
	
	class cash : RscText {
		x = 0.015;		y = 0.215;
		w = 0.27;		h = 0.1;
		text = "CASH";
		colorText[] = { 0, 0.8, 0.3, 0.8};
	};
	
	class cashValue : RscText {
		idc = 1301;
		style = 2;
		x = 0.015;		y = 0.315;
		w = 0.27;		h = 0.1;
		text = "$ 3,000";
	};
	
	class bank : RscText {
		x = 0.015;		y = 0.415;
		w = 0.27;		h = 0.1;
		text = "BANK";
		colorText[] = { 0, 0.8, 0.3, 0.8};
	};
	
	class bankValue : RscText {
		idc = 1302;
		style = 2;
		x = 0.015;		y = 0.515;
		w = 0.27;		h = 0.1;
		text = "$ 150,000";
	};
	
	class edit : RscEdit {
		idc = 1303;
		style = 2;
		x = 0.015;		y = 0.645;
		w = 0.27;		h = 0.075;
		text = 0;
	};
	
	class target : RscCombo {
		idc = 1304;
		x = 0.015;		y = 0.735;
		w = 0.27;		h = 0.075;
	};
	
	class give : RscButton {
		x = 0.015;		y = 0.825;
		w = 0.27;		h = 0.075;
		text = "GIVE";
		action = "";
	};
	
	class close : RscButton {
		x = 0.25;		y = 0.2;
		w = 0.05;		h = 0.05;
		text = "X";
		action = "closeDialog 1300";
		colorBackground[] = { 0, 0, 0, 0};
		colorFocused[] = { 0, 0, 0, 0};
		colorBackgroundActive[] = { 0.8, 0.2, 0.2, 0.4};	
	};
};

//////////////////////////////// LICENSE CARD ////////////////////////////////

class playerMenu_license 
{
	idd = 1400;
	name = "playerMenu_license";
	movingEnable = true;
	onLoad = "";
	controlsBackground[] = {license};
	controls[] = {playerName, playerSide, playerTitle, playerPicture};
	
	class license : RscBground {
		moving = true;
		style = 48 + 2048;
		x = 0;		y = 0;
		w = 0.6;		h = 1;
		text = "images\AFAL_license.paa";
		colorText[] = {};
		colorBackground[] = {};
	};
	
	class playerName : RscText {
		idc = 1401;
		x = 0.21;		y = 0.26;
		w = 0.35;		h = 0.1;
		text = "";
		colorText[] = { 0, 0, 0, 0.7};
	};
	
	class playerTitle : RscText {
		idc = 1402;
		x = 0.21;		y = 0.3625;
		w = 0.3;		h = 0.1;
		text = "";
		sizeEx = 0.045;
		colorText[] = { 0, 0, 0, 0.7};
	};
	
	class playerSide : RscText {
		idc = 1403;
		x = 0.21;		y = 0.465;
		w = 0.3;		h = 0.1;
		text = ""
		sizeEx = 0.045;
		colorText[] =  {0, 0, 0, 0.7};
	};
	
	class playerPicture : RscBground {
		idc = 1404;
		style = 48 + 2048;
		x = 0.05;		y = 0.295;
		w = 0.143;		h = 0.255;
		text = "";
		colorText[] = {};
		colorBackground[] = {};
	};
};
