/*
	File: initServer.sqf
	Author : Nuke & Ballistic
	
	Description:	
  	Gives the server some smarts
*/

private ["uniformList", "_uniform", "_NPCList"];

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call AFAL_fnc_MPexec};

[] call compile PreprocessFileLineNumbers "\AFAL_brain\init.sqf";

[] spawn AFAL_fnc_cityBarricade;

_uniformList = ["U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour", "U_C_Poloshirt_salmon", "U_C_Poloshirt_redwhite"];

{	_uniform = _uniformList select floor random count _uniformList;
	removeUniform _x;
	_x forceAddUniform _uniform;
} forEach [KavalaGeneralStoreNPC, KavalaClothesNPC1, KavalaClothesNPC2, KavalaPortNPC, KavalaFishNPC, KavalaGunShopNPC ];

_NPCList = [
	[KavalaGeneralStoreNPC, "STAND_U1"], 
	[KavalaPoliceGearNPC, "GUARD"],
	[KavalaMedicCarNPC, "LEAN"], [KavalaScubaNPC, "LEAN"], [KavalaPoliceAirNPC, "LEAN"],
	[KavalaMedicGearNPC, "LEAN_ON_TABLE"], [KavalaClothesNPC1, "LEAN_ON_TABLE"],
	[KavalaMedicAirNPC, "SIT_U1"], [KavalaGunShopNPC, "SIT_U1"], [KavalaStudioNPC, "SIT_U1"], [KavalaPortNPC, "SIT_U1"], [KavalaFishNPC, "SIT_U1"], [KavalaClothesNPC2, "SIT_U1"],
	[KavalaPoliceCarNPC, "REPAIR_VEH_STAND"]
];

{	[(_x select 0), (_x select 1), "MEDIUM"] call BIS_fnc_ambientAnim	} forEach _NPCList;
