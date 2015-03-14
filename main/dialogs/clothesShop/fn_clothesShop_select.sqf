/*
	File: fn_clothesShop_select.sqf
	Author: Ballistic
	
	Description:
	Executes when you select an inventory option at the clothes shop for After Altis
*/

disableSerialization;

_selection = [ _this, 0, [], [[]]] call BIS_fnc_param;

_dialog = findDisplay 4000;
_control = _selection select 0;
_index = _selection select 1;
_selectList = _dialog displayCtrl 4015;
_price = _dialog displayCtrl 4001;

_value = _control lbValue _index;
_class = _control lbData _index;

_type = _class select [0, 1];

switch (_type) do {
	
	case "B" : {removeBackpack shopMannequin; shopMannequin addBackpack _class};
	
	case "G" : {shopMannequin addGoggles _class};
	
	case "H" : {shopMannequin addHeadgear _class};
	
	case "P" : {
	
		_clothes = [_class] call AFAL_fnc_clothesShop_presets;
		
		_uniform = _clothes select 0;
		_vest = _clothes select 1;
		_headclothes = _clothes select 2;
		_glasses = _clothes select 3;

		removeGoggles shopMannequin;
			shopMannequin addGoggles (_glasses select 2);
		removeHeadgear shopMannequin;
			shopMannequin addHeadgear (_headclothes select 2);
		removeVest shopMannequin;
			shopMannequin addVest (_vest select 2);
		removeUniform shopMannequin;
			shopMannequin forceAddUniform (_uniform select 2);
	};
	
	case "U" : {shopMannequin forceAddUniform _class;};
	
	case "V" : {shopMannequin addVest _class;};
};
