/*
	File: fn_ctrlFade.sqf
	Author: Ballistic
	
	Description:
	Fade and animates ctrls for interactive dialogs in After Altis
	
	Parameters:
	0 : IDD of the dialog
	1 : ARRAY IDC's of controls to reveal
	2 : ARRAY IDC's of controls to hide
*/

private ["_dialog", "_show", "_hide", "_dialog"];

disableSerialization;

_IDD = [ _this, 0, 0, [0]] call BIS_fnc_param;
_show = [ _this, 1, [], [[]]] call BIS_fnc_param;
_hide = [ _this, 2, [], [[]]] call BIS_fnc_param;
	
_dialog = findDisplay _IDD;

if ( ctrlFade (_dialog displayCtrl (_show select 0)) > 0.5 ) then {
	{ 
		(_dialog displayCtrl _x) ctrlSetFade 0; 
		(_dialog displayCtrl _x) ctrlCommit 0.1 
	} forEach _show; 
	{
		(_dialog displayCtrl _x) ctrlSetFade 1; 
		(_dialog displayCtrl _x) ctrlCommit 0.1 
	} forEach _hide;
} else { 
	{
		(_dialog displayCtrl _x) ctrlSetFade 1; 
		(_dialog displayCtrl _x) ctrlCommit 0.1 
	} forEach _show;
};
