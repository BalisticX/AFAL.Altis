/*
	file: 	fn_keyboard.sqf
	Author:		2dumb2bu
	
	Description:	
	Sends message from keys to scripts another word a keyboard handler
*/

_keyCode = _this select 1;
_shiftKey = _this select 2;
_ctrlKey = _this select 3;
_altKey = _this select 4;
_hand = false;

switch (_keyCode) do
{
  case 21 : {
	  if(!dialog) then {createDialog "bigB_playerMenu"} 
	  [] spawn afal_fnc_playerMenu
  };
};

_hand;
