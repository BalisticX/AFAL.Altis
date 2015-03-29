/*
	File: fn_ambientNPC.sqf
	Author: Ballistic
	
	Description:
	Sets up the ambient NPCs for shops around After Altis
*/

private ["_uniform", "_NPCList"];

{	
	_uniform = ["U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour", "U_C_Poloshirt_salmon", "U_C_Poloshirt_redwhite"] call BIS_fnc_selectRandom;
	removeUniform _x;
	_x forceAddUniform _uniform;
} forEach [KavalaClothesNPC1, KavalaClothesNPC2, KavalaGunShopNPC, KavalaItemShopNPC1, KavalaItemShopNPC2, KavalaMuseumNPC, KavalaBoatNPC2, KavalaBoatNPC1, KavalaFishNPC];

{
	_x setObjectTextureGlobal [0, "images\AFAL_uniform_sheriff.paa"];
} forEach [KavalaItemEvidenceNPC, KavalaGunPoliceNPC];

_NPCList = [
	[KavalaItemEvidenceNPC, "GUARD"], [KavalaGunPoliceNPC, "GUARD"],
	[KavalaItemShopNPC1, "STAND_U2"], [KavalaItemShopNPC2, "STAND_U2"], [KavalaRacingNPC, "STAND_U2"], [KavalaMedicGearNPC,"STAND_U2"], [KavalaVehicleScrapNPC, "STAND_U2"], [TopoliaGunShopNPC, "STAND_U2"],
	[KavalaClothesNPC1, "STAND_U3"], [KavalaVehicleScrapNPC, "STAND_U3"],
	[KavalaScubaNPC2, "LEAN"], [KavalaScubaNPC1, "LEAN"], [KavalaMedicCarNPC, "LEAN"], [KavalaPoliceAirNPC, "LEAN"], [KavalaDeliveryFactoryNPC2, "LEAN"],
	[KavalaBoatNPC2, "SIT_U1"], [KavalaClothesNPC2, "SIT_U1"], [KavalaDeliveryFactoryNPC1, "SIT_U1"],
	[KavalaMedicAirNPC, "SIT_U2"], [KavalaMuseumNPC, "SIT_U2"],
	[KavalaDeliveryFactoryNPC3, "SIT_HIGH2"], [TopoliaClothesShopNPC, "SIT_HIGH2"],
	[KavalaFishNPC, "SIT_U3"], [KavalaBoatNPC1, "SIT_U3"], [KavalaGunShopNPC, "SIT_U3"],
	[KavalaPoliceCarNPC, "REPAIR_VEH_STAND"], [AltisVehiclePrisonNPC, "REPAIR_VEH_KNEEL"]
];

{
	(_x select 0) allowDamage false;
	(_x select 0) setPos getPosATL (_x select 0);
	removeAllWeapons (_x select 0);
} forEach _NPCList;

{	[(_x select 0), (_x select 1), "MEDIUM"] call BIS_fnc_ambientAnim	} forEach _NPCList;
