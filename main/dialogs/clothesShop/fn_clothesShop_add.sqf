/*
	File: fn_clothesShop_add.sqf
	Author: Ballistic
	
	Description:
	Executes when you add an item to the cart at the clothes shop for After Altis
*/

disableSerialization;

_dialog = findDisplay 4000;
_clothesList = _dialog displayCtrl 4017;
_selectList = _dialog displayCtrl 4015;
_price = _dialog displayCtrl 4001;

_index = lbCurSel _clothesList;
_text = _clothesList lbText _index;
_value = _clothesList lbValue _index;
_class = _clothesList lbData _index;

_type = _class select [0, 1];

switch (_type) do {
	
	case "B" : {
		(shopSelect select 4) set [2, _class];
		(shopSelect select 4) set [1, _value];
		(shopSelect select 4) set [0, _text];
	};
	
	case "G" : {
		(shopSelect select 3) set [2, _class];
		(shopSelect select 3) set [1, _value];
		(shopSelect select 3) set [0, _text];
	};
	
	case "H" : {
		(shopSelect select 2) set [2, _class];
		(shopSelect select 2) set [1, _value];
		(shopSelect select 2) set [0, _text];
	};
	
	case "P" : {

		_clothes = [_class] call AFAL_fnc_clothesShop_presets;
		
		_uniform = _clothes select 0;
		_vest = _clothes select 1;
		_headgear = _clothes select 2;
		_glasses = _clothes select 3;
		
		(shopSelect select 0) set [2, (_uniform select 2)];
		(shopSelect select 0) set [1, (_uniform select 1)];
		(shopSelect select 0) set [0, (_uniform select 0)];
		
		(shopSelect select 1) set [2, (_vest select 2)];
		(shopSelect select 1) set [1, (_vest select 1)];
		(shopSelect select 1) set [0, (_vest select 0)];
		
		(shopSelect select 2) set [2, (_headgear select 2)];
		(shopSelect select 2) set [1, (_headgear select 1)];
		(shopSelect select 2) set [0, (_headgear select 0)];
		
		(shopSelect select 3) set [2, (_glasses select 2)];
		(shopSelect select 3) set [1, (_glasses select 1)];
		(shopSelect select 3) set [0, (_glasses select 0)];
	};
	
	case "U" : {
		(shopSelect select 0) set [2, _class];
		(shopSelect select 0) set [1, _value];
		(shopSelect select 0) set [0, _text];
	};
	
	case "V" : {
		(shopSelect select 1) set [2, _class];
		(shopSelect select 1) set [1, _value];
		(shopSelect select 1) set [0, _text];
	};
};

lbClear _selectList;
	
{

	_selectIndex = _selectList lbAdd format ["%1", (_x select 0)];
	_selectList lbSetValue [_selectIndex, (_x select 1)];
	_selectList lbSetData [_selectIndex, (_x select 2)];
	_selectList lbSetColor [_selectIndex, (_x select 3)];

} forEach shopSelect;

removeUniform shopMannequin;
	shopMannequin forceAddUniform ((shopSelect select 0) select 2);
removeVest shopMannequin;
	shopMannequin addVest ((shopSelect select 1) select 2);
removeHeadgear shopMannequin;
	shopMannequin addHeadgear ((shopSelect select 2) select 2);
removeGoggles shopMannequin;
	shopMannequin addGoggles ((shopSelect select 3) select 2);
removeBackpack shopMannequin; 
	shopMannequin addBackpack ((shopSelect select 4) select 2);
