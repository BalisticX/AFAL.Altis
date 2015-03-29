/*
	File: fn_rotate.sqf
	Author: Ballistic
	
	Description:
	Sets up the shop pivot points and makes them rotate for After Altis
*/

private ["_pivotList", "_dir"];

_pivotList = [
	KavalaItemShop1, KavalaItemShop2, KavalaItemFish, KavalaItemEvidence, KavalaItemMuseum,
	KavalaVehicleCivilian,
	KavalaVehicleBoat1, KavalaVehicleBoat2,
	KavalaVehiclePoliceHeli, KavalaVehiclePoliceCar,
	KavalaVehicleMedicHeli, KavalaVehicleMedicCar, 
	KavalaClothesShop1, KavalaClothesShop2, KavalaClothesPress,
	KavalaClothesRace, KavalaItemRace,
	KavalaClothesScuba1, KavalaItemScuba1, KavalaClothesScuba2, KavalaItemScuba2,
	KavalaClothesPolice, KavalaGunPolice,
	KavalaGunShop, KavalaGunRange1, KavalaGunRange2,
	AltisVehiclePrison,
	TopoliaGunShop, TopoliaClothesShop
];

{
	_x allowDamage false;
	_x setVectorUp [0,0,1];
	// hideObjectGlobal _x;
} forEach _pivotList;

_dir = getDir TestRotate;	//// This is located atop the spawn pyramid

waitUntil {
	_dir = _dir + (
		if (_dir > 360) then [{-360},{1}]
	);
	
	TestRotate setDir _dir;
	
	{
		_x setDir _dir;
	} forEach _pivotList;
};
