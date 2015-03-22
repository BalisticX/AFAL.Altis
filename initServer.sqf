/*
	File: initServer.sqf
	Author : Nuke & Ballistic
	
	Description:	
  	Sets up server side stuff at mission start for After Altis
*/

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call AFAL_fnc_MPexec};

////	Gives the server some brains	////

[] call compile PreprocessFileLineNumbers "\AFAL_brain\init.sqf";

////	Barricades Kavala and demolishes rest of the map	////

[] spawn AFAL_fnc_cityBarricade;
[] spawn AFAL_fnc_cityDemolish;

////	Randomizes and sets NPCs uniforms	////

_uniformList = ["U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour", "U_C_Poloshirt_salmon", "U_C_Poloshirt_redwhite"];

{	_uniform = _uniformList select floor random count _uniformList;
	removeUniform _x;
	_x forceAddUniform _uniform;
} forEach [KavalaGeneralStoreNPC, KavalaClothesNPC1, KavalaClothesNPC2, KavalaPortNPC, KavalaFishNPC, KavalaGunShopNPC ];

KavalaPoliceGearNPC setObjectTextureGlobal "images/AFAL_sheriff.paa";

////	Sets up ambient animations for NPCs	////

_NPCList = [
	[KavalaGeneralStoreNPC, "STAND_U1"], 
	[KavalaPoliceGearNPC, "GUARD"],
	[KavalaMedicCarNPC, "LEAN"], [KavalaScubaNPC, "LEAN"], [KavalaPoliceAirNPC, "LEAN"],
	[KavalaMedicGearNPC, "LEAN_ON_TABLE"], [KavalaClothesNPC1, "LEAN_ON_TABLE"],
	[KavalaMedicAirNPC, "SIT_U1"], [KavalaGunShopNPC, "SIT_U1"], [KavalaStudioNPC, "SIT_U1"], [KavalaPortNPC, "SIT_U1"], [KavalaFishNPC, "SIT_U1"], [KavalaClothesNPC2, "SIT_U1"],
	[KavalaPoliceCarNPC, "REPAIR_VEH_STAND"]
];
{	[(_x select 0), (_x select 1), "MEDIUM"] call BIS_fnc_ambientAnim	} forEach _NPCList;

////	Locks down jail cells and building	////

{	_x setVariable ["BIS_disabled_Door_1", 1, true]	} forEach [
	jailCell1, jailCell2, jailCell3, jailCell4, 
	jailCell5, jailCell6, jailCell7, jailCell8, 
	jailMedical1, jailMedical2, jailMedical3
	];
	
jailBuilding1 setVariable ["BIS_disabled_Door_3", 1, true];
jailBuilding1 setVariable ["BIS_disabled_Door_4", 1, true];
