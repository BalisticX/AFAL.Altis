/*
	File: fn_gunShop_camo.sqf
	Author: Ballistic
	
	Description:
	Function returning the camo weapon classnames for the gun shop in After Altis
	
	Parameters:
	0: STRING camo AFAL camo classname of selected gun
	
	Returns:
	ARRAY Different camo for the gun default first then camo followed by default UGL and camo (Optional)
*/

private ["_class", "_array"];

_class = [ _this, 0, "", [""]] call BIS_fnc_param;
	if (_class == "") exitWith {};

switch (_class) do {
	
	case "srifle_GM6_F" : 				{	_array = [		"srifle_GM6_F", "srifle_GM6_camo_F"			]	};
	
	case "srifle_LRR_F" : 				{	_array = [		"srifle_LRR_F", "srifle_LRR_camo_F"			]	};	
	
	case "arifle_Mk20C_plain_F" : 			{	_array = [		"arifle_Mk20C_plain_F", "arifle_Mk20C_F"		]	};
	
	case "arifle_Mk20_plain_F" : 			{	_array = [		"arifle_Mk20_plain_F", "arifle_Mk20_F"			]	};
	
	case "arifle_Mk20_GL_plain_F" : 		{	_array = [		"arifle_Mk20_GL_plain_F", "arifle_Mk20_GL_F"	]	};	
	
	case "arifle_MXC_F" : 				{	_array = [		"arifle_MXC_F", "arifle_MXC_Black_F"			]	};
	
	case "arifle_MX_F" : 				{	_array = [		"arifle_MX_F", "arifle_MX_Black_F"				]	};
	
	case "arifle_MX_GL_F" : 			{	_array = [		"arifle_MX_GL_F", "arifle_MX_GL_Black_F" 		]	};
	
	case "arifle_MXM_F" :				{	_array = [		"arifle_MXM_F", "arifle_MXM_Black_F"			]	};
	
	case "arifle_MX_SW_F" : 			{	_array = [		"arifle_MX_SW_F", "arifle_MX_SW_Black_F"		]	};
};

_array
