// Vehicle Service Point by Axe Cop +fix to rearm all weapons from driver+only delete ammo in rearmed weapon only (not entire turret) by HALV
//reworked for a3 epoch by Halv
//reworked for a3 exile by Dodo
 
private ["_curturret","_folder","_servicePointClasses","_maxDistance","_costsFree","_message","_messageShown","_repair_enable","_repair_costs","_repair_repairTime","_rearm_enable","_rearm_costs","_lastVehicle","_lastRole","_fnc_removeActions","_fnc_getCosts","_fnc_actionTitle","_fnc_getWeapons"];
 
//====================== general settings
_folder = "Custom\rearm\"; // folder where the service point scripts are saved, relative to the mission file
_servicePointClasses = ["StorageBladder_02_water_sand_F"]; // service point classes (can be house, vehicle and unit classes)
_maxDistance = 50; // maximum distance from a service point for the options to be shown
_costsFree = "free"; // text for no costs
_message = "-- Vehicle Service Point --"; // message to be shown when in range of a service point (set to "" to disable)
_actionColour = "#0096ff"; //the colour of the scroll action Blue: "#0096ff"
 
//====================== repair settings
_repair_enable = true; // enable or disable the repair option
_repair_repairTime = 2; // time needed to repair each damaged part (in seconds)
 
_repair_costs = [  //Need Money
		["Air",1000],
        ["AllVehicles",800] 
];
 
//====================== rearm settings
_rearm_enable = true; // enable or disable the rearm option
 
//deny re-arm if more than this amount of current weapons magazines already in the vehicle
_deny_already_armed_with = 4;
//deny re-arm if more than this amount of magazines already in the vehicle
_GlobalMagazineMAX = 4; 
 
//weapon classes disabled from re-arming
_NoGoWeapCName = [
        //irrelevant ones
        "Horn","SmokeLauncher","MiniCarHorn","SportCarHorn","TruckHorn2","TruckHorn","BikeHorn","CarHorn","TruckHorn3",
 		//PAWNEE Missiles
		"missiles_DAR","missiles_DAGR"
];
 
//magazine classnames not allowed to be rearmed
_NoGoAmmoCName = [ 
		//Gunship Missiles
		"24Rnd_missiles", "12Rnd_PG_missiles"
];
 
//cost per magazine for individual vehicles
_rearm_costs = [ 
		["B_MRAP_01_hmg_F",500],
		["O_MRAP_02_hmg_F",500],
		["I_MRAP_03_hmg_F",500],
		["B_Heli_Light_01_Armed_F",800],
		["O_Heli_Light_02_F",800],
		["I_Heli_Light_03_F",800],
		["B_Heli_Transport_01_F",800],
        ["AllVehicles",500],
        ["Air",800]
];
 
//debug weapons to see classnames in chat/rpt
_debugWeapon = false;
 
 
//=================================== CONFIG END
_lastVehicle = objNull;
_lastRole = [];
 
SP_repair_action = -1;
SP_rearm_actions = [];
 
_messageShown = false;
 
_fnc_removeActions = {
        if (isNull _lastVehicle) exitWith {};
        _lastVehicle removeAction SP_repair_action;
        SP_repair_action = -1;
        {
                _lastVehicle removeAction _x;
        } forEach SP_rearm_actions;
        SP_rearm_actions = [];
        _lastVehicle = objNull;
        _lastRole = [];
};
 
_fnc_getCosts = {
        private ["_vehicle","_costs","_cost"];
        _vehicle = _this select 0;
        _costs = _this select 1;
        _cost = [];
        {
                private "_typeName";
                _typeName = _x select 0;
                if (_vehicle isKindOf _typeName) exitWith {
                        _cost = _x select 1;
                };
        } forEach _costs;
        _cost
};
 
_fnc_actionTitle = {
        private ["_actionName","_costs","_costsText","_actionTitle"];
        _actionName = _this select 0;
        _costs = _this select 1;
        _costsText = _costsFree;
        if (_costs > 0) then {
                private ["_itemName","_displayName"];
                _costsText = format ["%1 Pop tabs",_costs];
        };
        _actionTitle = format ["<t color='%3'>%1 (%2)</t>", _actionName, _costsText,_actionColour];
        _actionTitle
};
 
_fnc_getWeapons = {
        private ["_vehicle","_role","_weapons"];
        _vehicle = _this select 0;
        //turrets positions to search for weapons
        _turrets = [[-1],[0],[1],[2],[0,0],[1,0],[2,0],[0,1],[0,2]];
        _weapons = [];
        {
                _turret = _x;
                _weaponsTurret = _vehicle weaponsTurret _turret;
                {
                        _weapon = _x;
                        if !(_weapon in _NoGoWeapCName) then{
                                _weaponName = getText (configFile >> "CfgWeapons" >> _weapon >> "displayName");
                                _weapons pushBack [_weapon, _weaponName, _turret];
                        };
                }forEach _weaponsTurret;
        }forEach _turrets;
        _weapons
};
 
_fnc_getAmmo = {
        private ["_vehicle","_role","_weapons"];
        _vehicle = _this select 0;
        _weapon = _this select 1;
        _allammo = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
        _ammoreturn = [];
        {
                _curammo = _x;
                if !(_curammo in _NoGoAmmoCName) then{
                        _ammoname = getText (configFile >> "Cfgmagazines" >> _curammo >> "displayName");
                        _ammoreturn pushBack [_curammo, _ammoname];
                };
        }forEach _allammo;
        _ammoreturn
};
 
while {true} do {
        private ["_vehicle","_inVehicle"];
        _vehicle = vehicle player;
        _inVehicle = _vehicle != player;
        if (local _vehicle && _inVehicle) then {
                private ["_pos","_servicePoints","_inRange"];
                _pos = getPosATL _vehicle;
                _servicePoints = (nearestObjects [_pos, _servicePointClasses, _maxDistance]) - [_vehicle];
                _inRange = count _servicePoints > 0;
                if (_inRange && (speed (_vehicle) < 1) && (speed (_vehicle) > -1)) then {
                        private ["_servicePoint","_role","_actionCondition","_costs","_actionTitle"];
                        _servicePoint = _servicePoints select 0;
                        _role = assignedVehicleRole player;
                        if (((str _role) != (str _lastRole)) || (_vehicle != _lastVehicle)) then {
                                // vehicle or seat changed
                                call _fnc_removeActions;
                        };
                        _lastVehicle = _vehicle;
                        _lastRole = _role;
                        _actionCondition = "vehicle _this == _target && local _target";
                        if (SP_repair_action < 0 && _repair_enable) then {
                                _costs = [_vehicle, _repair_costs] call _fnc_getCosts;
                                _actionTitle = [format["Repair %1",getText (configFile >> "Cfgvehicles" >> typeOf _vehicle >> "displayName")], _costs] call _fnc_actionTitle;
                                SP_repair_action = _vehicle addAction [format["<img size='1.5'image='\a3\Ui_f\data\IGUI\Cfg\Cursors\iconrepairvehicle_ca.paa'/> %1",_actionTitle], _folder + "service_point_repair.sqf", [_servicePoint, _costs, _repair_repairTime], -1, false, true, "", _actionCondition];
                        };
                        if ((count SP_rearm_actions == 0) && _rearm_enable) then {
                                private ["_weapons"];
                                _costs = [_vehicle, _rearm_costs] call _fnc_getCosts;
                                _weapons = [_vehicle, _role] call _fnc_getWeapons;
                                {
										private "_weaponName";
                                        _curweapon = _x select 0;
                                        _weaponName = _x select 1;
                                        _curturret = _x select 2;
                                        if(_debugWeapon)then{_msg = format["WEAPONS DEBUG: %1",_x];diag_log _msg;systemChat _msg;};
                                        _ammo = [_vehicle,_curweapon] call _fnc_getAmmo;
                                        {
                                                _ammoclass = _x select 0;
                                                _ammoname = _x select 1;
												_actionTitle = [format["Rearm %1 %2 with %3", _weaponName,_curturret,_ammoname], _costs] call _fnc_actionTitle;  
												SP_rearm_action = _vehicle addAction [format["<img size='1.5'image='\a3\Ui_f\data\IGUI\Cfg\WeaponIcons\mg_ca.paa'/> %1",_actionTitle], _folder + "service_point_rearm.sqf", [_servicePoint, _costs, [_weaponName,_ammoclass,_ammoname,_GlobalMagazineMAX,_deny_already_armed_with,_curturret]], -1, false, true, "", _actionCondition];
                                                SP_rearm_actions set [count SP_rearm_actions, SP_rearm_action];
                                        }forEach _ammo;
                                       
                                } forEach _weapons;
                        };
                        if (!_messageShown && _message != "") then {
                                _messageShown = true;
                                _vehicle vehicleChat _message;
                        };
                } else {
                        call _fnc_removeActions;
                        _messageShown = false;
                };
        } else {
                call _fnc_removeActions;
                _messageShown = false;
        };
        sleep 2;
};
