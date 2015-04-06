/*

	Title: fn_initHack.sqf
	Author: Terminal
	
	Description: Lines for After Altis hacking system
	
*/



	
	
	call BIS_fnc_VRFadeIn;
	
	_chroma = ppEffectCreate ["chromAberration", 217];
	_chroma ppEffectEnable true;
	_chroma ppEffectAdjust [ 0.005, 0.005, true];
	_chroma ppEffectCommit 1;

	
	
	playerPhone = "Land_MobilePhone_smart_F" createVehicle position player;
	playerPhone attachTo[player, [0,0,0], "RightHand"];
	
	
	
	onEachFrame {
	
		_connections = [
						"Land_LampStreet_F",
						"Land_PowLines_Transformer_F", 
						"Land_Laptop_unfolded_F",
						"Land_MobilePhone_smart_F",
						"Land_PhoneBooth_01_F",
						"Land_Atm_01_F",
						"Land_Atm_02_F",
						"B_MRAP_01_F"];

		_nObjects = nearestObjects [player, _connections, 40];
		
		//systemChat format["%1", _nObjects];
		
		_xOff = 0;
		_yOff = 0;
		_zOff = 0;
		_colour = [1,1,1,1];
		_text = "";
		
		{	
			switch (typeOf _x) do {
				case "Land_LampStreet_F": {
					_xOff = 0;
					_yOff = 3;
					_zOff = 12.5;
					_text = "Street Lamp";
				};
				case "Land_PowLines_Transformer_F": {
					_xOff = 0;
					_yOff = 0;
					_zOff = 2.5;
					_text = "Power Transformer";
				};
				case "Land_Laptop_unfolded_F": {
					_xOff = 0;
					_yOff = 0;
					_zOff = 0;
					_text = "Laptop";
				};
				case "Land_MobilePhone_smart_F": {
					_xOff = 0;
					_yOff = 0;
					_zOff = 0;
					_text = "Mobile Phone";
				};
				case "Land_PhoneBooth_01_F": {
					_xOff = 0;
					_yOff = 0;
					_zOff = 1.5;
					_text = "Phone Booth";
				};
				case "Land_Atm_01_F": {
					_xOff = 0;
					_yOff = 0;
					_zOff = 1.5;
					_text = "ATM";
				};
				case "Land_Atm_02_F": {
					_xOff = 0;
					_yOff = 0;
					_zOff = 1.4;
					_text = "ATM";
				};
				case "B_MRAP_01_F": {
					_xOff = 0;
					_yOff = 0;
					_zOff = 1.5;
					_text = "Vehicle";
				};
			};
			_colour = [1,1,1,1];
			
			//drawIcon3D ["", [1,1,1,1], [((getPos _x select 0)+_xOff), ((getPos _x select 1)+_yOff), (((getPos _x select 2)+_zOff)+1)], 0, 0, 0, _text, 1, 0.025, "TahomaB"];	//Text for connectables
			
			drawIcon3D ["a3\ui_f\data\IGUI\Cfg\Cursors\watch_ca.paa", [1,1,1,1], [((getPos _x select 0)+_xOff), ((getPos _x select 1)+_yOff), ((getPos _x select 2)+_zOff)], 1, 1, 45, "", 1, 0.05, "TahomaB"];									//Icon for connectables
			
			drawLine3D [
				[(getPos playerPhone select 0), (getPos playerPhone select 1), (getPos playerPhone select 2)], 
				[((getPos _x select 0)+_xOff), ((getPos _x select 1)+_yOff), ((getPos _x select 2)+_zOff)], 
				_colour
			];
			
			

		} forEach _nObjects;
		
	};

		(findDisplay 46) displayAddEventHandler ["KeyDown",{
		_connections = [
						"Land_LampStreet_F",
						"Land_PowLines_Transformer_F", 
						"Land_Laptop_unfolded_F",
						"Land_MobilePhone_smart_F",
						"Land_PhoneBooth_01_F",
						"Land_Atm_01_F",
						"Land_Atm_02_F",
						"B_MRAP_01_F"];
		
			if ((_this select 1 == 57) && (typeOf cursorTarget in _connections) && (player distance cursorTarget < 40)) then {
			
				[typeOf cursorTarget, getPos cursorTarget]execVM "hack.sqf";
			};
		}];
