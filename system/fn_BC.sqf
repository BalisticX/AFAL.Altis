/*
	file:	fn_BC.sqf
	Author:		2Dumb2bu
	
	Description:	
	Sends message in [system Chat || Hint format || Title Text centre of screen]
*/

private["_mode","_message"];
_mode = [_this,0,0,[0]] call bis_fnc_param;
_message = [_this,1,"",[""]] call bis_fnc_param;

switch (_mode) do
{
	case 0: {systemChat _message};
	case 1: {hint format["%1", _message]};
	case 2: {titleText[format["%1",_message],"PLAIN"];};
};
