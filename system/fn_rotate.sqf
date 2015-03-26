/*
	File: fn_rotate.sqf
	Author: Ballistic
	
	Description:
	Sets up the shop pivot points and makes them rotate for After Altis
*/

private ["_pivotList", "_dir"];

_pivotList = [
	KavalaItemShop1,
	KavalaVehicleCivilian,
	KavalaVehicleBoat1, KavalaVehicleBoat2,
	KavalaVehiclePoliceHeli, KavalaVehiclePoliceCar,
	KavalaVehicleMedicHeli, KavalaVehicleMedicCar, 
	KavalaClothesShop1, KavalaClothesShop2, 
	KavalaClothesRace, KavalaItemRace,
	KavalaClothesScuba1, KavalaItemScuba1, KavalaClothesScuba2, KavalaItemScuba2,
	KavalaClothesPress,
	KavalaItemFish
];

{
	_x allowDamage false;
	_x setVectorUp [0,0,1];
	// hideObjectGlobal _x;
} forEach _pivotList;

_dir = getDir TestRotate;

waitUntil {
	_dir = _dir + (
		if (_dir > 360) then [{-360},{1}]
	);
	
	TestRotate setDir _dir;
	
	{
		_x setDir _dir;
	} forEach _pivotList;
};
