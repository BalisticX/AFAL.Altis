/*
	File: fn_policeMenu.sqf
	Author: Ballistic
	
	Description:
	Opens the police interaction dialog for After Altis
*/

private ["_dialog", "_blur"];

if (!dialog && cursorTarget isKindOf "Man" && alive cursorTarget && player distance cursorTarget < 5) then {	createdialog "policeMenu"	} else {	systemChat "There is no target to interact with"	};

policeTarget = cursorTarget;

disableSerialization;

_dialog = findDisplay 900;

(_dialog displayCtrl 901) ctrlSetText format ["%1", name cursorTarget];

{	(_dialog displayCtrl _x) ctrlSetFade 1;	(_dialog displayCtrl _x) ctrlCommit 0;	} forEach [ 902, 903, 904, 905, 906, 907, 908, 909, 910, 912, 913];

_blur = ppEffectCreate ["dynamicBlur", 517];
	_blur ppEffectEnable true;
	_blur ppEffectAdjust [0.75];
	_blur ppEffectCommit 1;

waitUntil {	isNull _dialog };

_blur ppEffectAdjust [0];
_blur ppEffectCommit 1;
	sleep 1;
ppEffectDestroy _blur;
policeTarget = nil;
