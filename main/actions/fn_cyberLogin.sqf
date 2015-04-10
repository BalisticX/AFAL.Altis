/*
	File: fn_cyberLogin.sqf
	Author: Ballistic
	
	Description:
	Login to the BLUFOR command network for After Altis
*/

private ["_chair", "_pos", "_dialog", "_cameraList", "_atmList", "_name", "_time", "_cameraIndex", "_atmIndex"];

_chair = [ _this, 0, objNull, [objNull]] call BIS_fnc_param;
	_chair setVariable ["inUse", true, true];
	
_pos = getPosATL player;
	
player switchMove "HubSittingAtTableU_idle3";
	sleep 0.1;
player attachTo [_chair, [0,-0.25,-0.3]];
detach player;
player setDir (getDir player - 180);

if (!dialog) then {		createdialog "cyberCommand"	};

disableSerialization;
_dialog = findDisplay 1900;
_cameraList = _dialog displayCtrl 1901;
_atmList = _dialog displayCtrl 1904;
_name = _dialog displayCtrl 1902;
_time = _dialog displayCtrl 1903;

_name ctrlSetText format ["USER : %1", profileName];


{
	_cameraIndex = _cameraList lbAdd format ["%1", (_x select 0)];
	_cameraList lbSetData [_cameraIndex, (_x select 1)];
} forEach [		["POLICE HQ", "Police"], ["BANK", "Bank"], ["PRISON", "Bank"], ["HOSPITAL", "Hospital"], ["TRAFFIC", "Traffic"]		];

{
	_atmIndex = _atmList lbAdd format ["%1", _x];
} forEach ["AREA MAP", "CAMERAS"];

{	_x ctrlSetFade 1;	_x ctrlCommit 0;	} forEach [_cameraList, _atmList];

waitUntil {
	_time ctrlSetText format ["%1", [daytime] call BIS_fnc_TimeToString];
	isNull _dialog || !alive player;
};

_chair setVariable ["inUse", false, true];

player switchMove "";
player setPos _pos;
player setDir getDir _chair;
