/*
	File: fn_cityDemolish.sqf
	Author: Ballistic
	
	Description:
	Used on mission start to demolish large areas of default Altis map for After Altis
*/

private ["_markerList"];

_markerList = [

];

{
  private ["_location", "_radius", "_demolishList"];
  
  _location = getMarkerPos _x select 0;
  _radius = _x select 1;
  
_demolishList = nearestObjects [(position _location), [
	"Land_Atm_01_F", "Land_Atm_02_F",
	"Land_i_Shop_01_V1_F", "Land_i_Shop_02_V1_F",
	"Land_Kiosk_blueking_F",
	"Land_CarService_F",

	"Land_i_House_Small_01_V1_F", "Land_i_House_Small_02_V1_F", "Land_i_House_Small_03_V1_F",
	"Land_i_House_Big_01_V1_F", "Land_i_House_Big_02_V1_F",
	"Land_i_Stone_HouseBig_V1_F", "Land_i_Stone_HouseSmall_V1_F",
	"Land_u_Addon_01_V1_F", "Land_u_Addon_02_V1_F", "Land_i_Addon_03_V1_F", "Land_i_Addon_03mid_V1_F", "Land_i_Addon_04_V1_F",
	"Land_i_Stone_Shed_V1_F",
	"Land_i_Garage_V1_F",
	
	"Land_Chapel_V1_F", "Land_Chapel_V2_F",
	"Land_Chapel_Small_V1_F", "Land_Chapel_Small_V2_F",
	"Land_BellTower_01_V1_F", "Land_BellTower_02_V1_F",
	
	"Land_Unfinished_Building_01_F", "Land_Unfinished_Building_02_F"
	], _radius];
	
{_x setDamage 1; sleep 0.005;} forEach _demolishList;

} forEach _markerList;
