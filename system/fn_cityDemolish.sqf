/*
	File: fn_cityDemolish.sqf
	Author: Ballistic
	
	Description:
	Used by server on mission start to demolish large areas of default ARMA map for After Altis
*/

private "_markerList";

_markerList = [
	["demolishSalt", 4000],
	["demolishSolar", 3000],
	["demolishSouth", 4500],
	["demolishSofia", 4000],
	["demolishNorth", 3750],
	["demolishSouthMid", 2250],
	["demolishMiddle", 2750],
	["demolishFactory", 2500],
	["demolishCentral", 2500],
	["demolishNorthMid", 2750],
	["demolishNeri", 1250],
	["demolishStavros", 500]
];
_count = 0;
{
	private ["_location", "_radius", "_demolishList"];
  
	_location = [ _x, 0, "", [""]] call BIS_fnc_param;
	_radius = [ _x, 1, 0, [0]] call BIS_fnc_param;
  
	_demolishList = nearestObjects [getMarkerPos _location, [
		//// COMMERCIAL
		"Land_Atm_01_F", "Land_Atm_02_F",
		"Land_i_Shop_01_V1_F", "Land_i_Shop_02_V1_F",
		"Land_Kiosk_blueking_F",
		"Land_CarService_F",
		//// RESIDENTIAL
		"Land_i_House_Small_01_V1_F", "Land_i_House_Small_02_V1_F", "Land_i_House_Small_03_V1_F",
		"Land_i_House_Big_01_V1_F", "Land_i_House_Big_02_V1_F",
		"Land_i_Stone_HouseBig_V1_F", "Land_i_Stone_HouseSmall_V1_F",
		"Land_u_Addon_01_V1_F", "Land_u_Addon_02_V1_F", "Land_i_Addon_03_V1_F", "Land_i_Addon_03mid_V1_F", "Land_i_Addon_04_V1_F",
		"Land_i_Stone_Shed_V1_F",
		"Land_i_Garage_V1_F",
		//// CULTURAL
		"Land_Chapel_V1_F", "Land_Chapel_V2_F",
		"Land_Chapel_Small_V1_F", "Land_Chapel_Small_V2_F",
		"Land_BellTower_01_V1_F", "Land_BellTower_02_V1_F",
		//// CONSTRUCTION
		"Land_Unfinished_Building_01_F", "Land_Unfinished_Building_02_F"
	], _radius];
	_count = _count + (count _demolishList);
	{
		_x setDamage 1; 
			sleep 0.0005;
	} forEach _demolishList;
} forEach _markerList;
_count;
systemChat format ["%1 Buildings demolished. Wreck it Ralph!", _count]; 
