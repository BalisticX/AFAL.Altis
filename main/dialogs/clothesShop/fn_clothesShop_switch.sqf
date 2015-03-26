/*
	File: AFAL_clothesShop_switch.sqf
	Author: Ballistic
	
	Description:
	Executes when you switch tabs at the clothes shop for After Altis
*/

private ["_type", "_dialog", "_clothesList", "_inventory", "_dir"];

disableSerialization;

_type = [_this, 0, "", [""]] call BIS_fnc_param;

_dialog = findDisplay 4000;
_clothesList = _dialog displayCtrl 4017;

_inventory = [shopType, _type] call AFAL_fnc_clothesShop_inventory;

lbClear _clothesList;
_clothesList lbSetCurSel -1;

{
	_index = _clothesList lbAdd format[ "%1", (_x select 0)];
	_clothesList lbSetValue [_index, (_x select 1)];	
	_clothesList lbSetData [_index, (_x select 2)];
	_clothesList lbSetToolTip [_index, (_x select 3)];
	_clothesList lbSetPicture [_index, (_x select 4)];
	_clothesList lbSetPictureColor [_index, [1, 1, 1, 1]];
} forEach _inventory;

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
	
if (_type in ["Headgear", "Facewear"]) then {
	_dir = getDir shopPivot;
	shopPivot setDir shopDir;
	shopCam camPreparePos (shopPivot modelToWorld [ 0, 1.25, 2]);
		shopCam camSetTarget (shopPivot modelToWorld [ 0, 0, 2]);
		shopCam camPrepareFOV 0.4;
		shopCam camCommitPrepared 1;
	shopPivot setDir _dir;
} else {
	_dir = getDir shopPivot;
	shopPivot setDir shopDir;
	shopCam camPreparePos (shopPivot modelToWorld [ 0, 3, 1.5]);
		shopCam camSetTarget (shopPivot modelToWorld [ 0, 0, 1]);
		shopCam camPrepareFov 0.9;
		shopCam camCommitPrepared 1;
	shopPivot setDir _dir;
};
