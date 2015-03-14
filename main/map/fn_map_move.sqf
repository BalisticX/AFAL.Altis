/*
	File: fn_map_move.sqf
	Author: Ballistic
	
	Description:
	Moves the interactive map to the chosen location
*/

disableSerialization;

_dialog = findDisplay 500;
_listbox = _dialog displayCtrl 517;
_map = _dialog displayCtrl 515;

_index = lbCurSel _listbox;
_text = _listbox lbText _index;
_marker = _listbox lbData _index;
_zoom = (_listbox lbValue _index) * 0.01;

ctrlMapAnimClear _map;

if (_marker == "You") then {
	_map ctrlMapAnimAdd [ 3, _zoom, getPos player];
} else {
	_map ctrlMapAnimAdd [ 3, _zoom, getMarkerPos _marker];
};

ctrlMapAnimCommit _map;
