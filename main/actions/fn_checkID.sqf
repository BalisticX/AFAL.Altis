/*
	File: fn_checkID.sqf
	Author: 
	
	Description:
	Player check ID function for AfterAltis
*/

private ["_target", "_dialog", "_name", "_role", "_side", "_picture", "_face", "_race"];

_target = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
	if (isNull _target) exitWith {};
	
if (!dialog) then {		createDialog "playerMenu_license"		};

disableSerialization;

_dialog = findDisplay 1400;
_name = _dialog displayCtrl 1401;
_role = _dialog displayCtrl 1402;
_side = _dialog displayCtrl 1403;
_picture = _dialog displayCtrl 1404;

_name ctrlSetText format ["%1", name _target];
_role ctrlSetText format ["%1", _target getVariable "Role"];
_side ctrlSetText format ["%1", side _target];

switch (side _target) do {
		case west : 		{		_side ctrlSetTextColor [ 0.3, 0.6, 0.8, 1]		};
		case east : 		{		_side ctrlSetTextColor [ 0.7, 0.1, 0.12, 1]		};
		case resistance : 	{		_side ctrlSetTextColor [ 0.49, 0.8, 0.49, 1]	};
		case civilian : 	{		_side ctrlSetTextColor [ 0.6, 0.2, 0.8, 1]		};
};

_face = face _target;
	
if ( _face in ["PersianHead_A3_01", "PersianHead_A3_02", "PersianHead_A3_03", "PersianHead_A3_04_a", "PersianHead_A3_04_l", "PersianHead_A3_04_sa"] ) then { _race = "persian" } else {
	if ( _face in ["GreekHead_A3_01", "GreekHead_A3_02", "GreekHead_A3_03", "GreekHead_A3_10_a", "GreekHead_A3_10_l", "GreekHead_A3_10_sa", "WhiteHead_11"] ) then { _race = "greek" } else {
		if ( _face in ["AfricanHead_01", "AfricanHead_02", "AfricanHead_03"] ) then { _race = "african" } else {
			if ( _face in ["AsianHead_A3_01", "AsianHead_A3_02", "AsianHead_A3_03"] ) then { _race = "asian" } else {
				if ( _face in ["GreekHead_A3_04", "GreekHead_A3_05", "WhiteHead_01", "WhiteHead_15"] ) then { _race = "shaved" } else {
					if ( _face in ["GreekHead_A3_07", "WhiteHead_03", "WhiteHead_09", "WhiteHead_10", "WhiteHead_13"] ) then { _race = "redhead" } else {
						if ( _face in ["GreekHead_A3_08", "WhiteHead_04", "WhiteHead_14"] ) then { _race = "blonde" } else {
							_race = "brown"
						};
					};
				};
			};
		};
	};
};

switch (_race) do {
	case "persian" :		{	_picture ctrlSetText "images\AFAL_face_persian.paa"		};
	case "african" :		{	_picture ctrlSetText "images\AFAL_face_african.paa"		};
	case "asian" :			{	_picture ctrlSetText "images\AFAL_face_asian.paa"		};
	case "greek" :			{	_picture ctrlSetText "images\AFAL_face_greek.paa"		};
	case "shaved" :			{	_picture ctrlSetText "images\AFAL_face_shaved.paa"		};
	case "redhead" :		{	_picture ctrlSetText "images\AFAL_face_redhead.paa"		};
	case "blonde" :			{	_picture ctrlSetText "images\AFAL_face_blonde.paa"		};
	case "brown" :			{	_picture ctrlSetText "images\AFAL_face_brown.paa"		};
};
