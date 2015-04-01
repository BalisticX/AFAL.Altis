/*
	Title: fn_zipLine
	
	Author: Terminal
	
	Description: Zipline script for After Altis
	Build: Alpha
	
*/
if (!(currentWeapon player == "arifle_MX_GL_F")) exitWith {systemChat "You need a Grappling Launcher!";};

if (currentWeapon player == "arifle_MX_GL_F") then {


	player addEventHandler ["Fired", {  
	_null = _this spawn {         
		_unit = _this select 0;         
		_ammo = _this select 4;         
		_projectile = _this select 6;     
			sleep 0.01;
			
			dirP = direction player;
			pos = position player;
			
			_vel = velocity player;
			_dir = direction player;
			_speed = 30;
			
			_projectile setVelocity [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed), 
				10
			];
			
			uav = "B_UAV_01_F" createVehicle position player;
			uav allowDamage false;
			grappleRope = ropeCreate[uav, [0,0,0], 56, 56, false];
			uav attachTo[_projectile, [0,0,0]];
			detach uav;
			deleteVehicle _projectile;
			
			
			
			[player, [0,0,1.4], [0,0,0]] ropeAttachTo grappleRope;
			
			uav setVelocity [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed), 
				10
			];
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			player addAction["Set up zipline", {
				
				startUAV = "B_UAV_01_F" createVehicle pos;
				startBall = "Sign_Sphere25cm_F" createVehicle position player;
				startBall attachTo[startUAV, [0,0,0.5]];
				startUAV setPosATL [getPosATL player select 0, getPosATL player select 1, (getPosATL player select 2)+0.1];
				startUAV allowDamage false;
				startUAV setDir dirP;
				startBall setDir dirP;
				
				ropeDestroy grappleRope;
				
				uav attachTo[startBall, [0,10,0]];
				
				
				{
					_pole = "Metal_Pole_Platform_F" createVehicle position uav;
					_pole attachTo[_x, [0,-1,1]];
					_pole allowdamage false;
				} forEach [uav, startUAV];
				
				zipRope = ropeCreate[uav, [0,0,2], (startBall distance uav)];
				[startUAV, [0,0,2], [0,0,0]] ropeAttachTo zipRope;
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				player addAction ["Take the Zipline!", {
					
					player setDir dirP;
					
					if (getPosATL uav select 2 > getPosATL startUAV select 2) exitWith {systemChat "Stop trying to defy gravity";};
					
					
					_a = (getPosASL startUAV select 2) - (getPosASL uav select 2);
					systemChat format["Difference in height (A): %1", _a];
					
					_c = startuav distance uav;
					systemChat format["Straight Distance (C): %1", _c];
					
					_b = sqrt((_c^2)-(_a^2));
					systemChat format["Ground to Ground Distance (B): %1", _b];
					
					_aP = (_a*0.01)/2;
					_bP = (_b*0.01)/2;
					
					_a = 0;
					_b = 0;
					_sleep = 0.02;
					
					while {getPosATL player select 2 > 0.5} do {
						player attachTo[startUAV, [0,_b,_a]];
						
						_a = _a-_aP;
						_b = _b+_bP;
						
						sleep _sleep;
					};
					
					detach player;
				}];
				
			}];
			
			
			
			
			
			
			
			
			
};
}];



};








