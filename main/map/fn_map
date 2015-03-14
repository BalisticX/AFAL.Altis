/*
	File: fn_map.sqf
	Author: Ballistic
	
	Description:
	Creates the interactive map board dialog and lists locations
*/

_location = [ _this, 0, "", [""]] call BIS_fnc_param;
_caller = [ _this, 1, player, [objNull]] call BIS_fnc_param;

if (!dialog) then {createdialog "AFAL_map"};

disableSerialization;

_dialog = findDisplay 500;
_listbox = _dialog displayCtrl 517;

_array = [_location, _caller] call AFAL_fnc_map_locations;

{
	_index = _listbox lbAdd format[ "%1", (_x select 0)];
	_listbox lbSetData [_index, (_x select 1)];
	_listbox lbSetValue [_index, (_x select 2)];	
	_listbox lbSetPicture [_index, (_x select 3)];
	_listbox lbSetPictureColor [_index, [1, 1, 1, 1]];

} forEach _array;

_listbox ctrlAddEventHandler [ "LBSelChanged", "[] call AFAL_fnc_map_move"];
