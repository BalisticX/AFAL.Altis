/*
	File: fn_clothesShop_remove.sqf
	Author: Ballistic
	
	Description:
	Executes when you remove something from your cart at the clothes shop for After Altis
*/

disableSerialization;

_dialog = findDisplay 4000;
_selectList = _dialog displayCtrl 4015;
_price = _dialog displayCtrl 4001;

_index = lbCurSel _selectList;
_value = _selectList lbValue _index;
_class = _selectList lbData _index;

_type = _class select [0, 1];

switch (_type) do {
	
	case "B" : {
		(shopSelect select 4) set [2, ""];
		(shopSelect select 4) set [1, 0];
		(shopSelect select 4) set [0, ""];
	};
	
	case "G" : {
		(shopSelect select 3) set [2, ""];
		(shopSelect select 3) set [1, 0];
		(shopSelect select 3) set [0, ""];
	};
	
	case "H" : {
		(shopSelect select 2) set [2, ""];
		(shopSelect select 2) set [1, 0];
		(shopSelect select 2) set [0, ""];
	};
	
	case "P" : {};
	
	case "U" : {
		(shopSelect select 0) set [2, ""];
		(shopSelect select 0) set [1, 0];
		(shopSelect select 0) set [0, ""];
	};
	
	case "V" : {
		(shopSelect select 1) set [2, ""];
		(shopSelect select 1) set [1, 0];
		(shopSelect select 1) set [0, ""];
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
