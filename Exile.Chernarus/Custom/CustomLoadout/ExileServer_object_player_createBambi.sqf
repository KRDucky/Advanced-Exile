/**
 * ExileServer_object_player_createBambi
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_requestingPlayer","_spawnLocationMarkerName","_bambiPlayer","_accountData","_direction","_position","_spawnAreaPosition","_spawnAreaRadius","_clanID","_clanData","_clanGroup","_player","_devFriendlyMode","_devs","_parachuteNetID","_spawnType","_parachuteObject"];
_sessionID = _this select 0;
_requestingPlayer = _this select 1;
_spawnLocationMarkerName = _this select 2;
_bambiPlayer = _this select 3;
_accountData = _this select 4;
_direction = random 360;
if ((count ExileSpawnZoneMarkerPositions) isEqualTo 0) then 
{
	_position = call ExileClient_util_world_findCoastPosition;
	if ((toLower worldName) isEqualTo "namalsk") then 
	{
		while {(_position distance2D [76.4239, 107.141, 0]) < 100} do 
		{
			_position = call ExileClient_util_world_findCoastPosition;
		};
	};
}
else 
{
	_spawnAreaPosition = getMarkerPos _spawnLocationMarkerName;
	_spawnAreaRadius = getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "spawnZoneRadius");
	_position = [_spawnAreaPosition, _spawnAreaRadius] call ExileClient_util_math_getRandomPositionInCircle;
	while {surfaceIsWater _position} do 
	{
		_position = [_spawnAreaPosition, _spawnAreaRadius] call ExileClient_util_math_getRandomPositionInCircle;
	};
};
_name = name _requestingPlayer;
_clanID = (_accountData select 3);
if !((typeName _clanID) isEqualTo "SCALAR") then
{
	_clanID = -1;
	_clanData = [];
}
else
{
	_clanData = missionNamespace getVariable [format ["ExileServer_clan_%1",_clanID],[]];
	if(isNull (_clanData select 5))then
	{
		_clanGroup = createGroup independent;
		_clanData set [5,_clanGroup];
		_clanGroup setGroupIdGlobal [_clanData select 0];
		missionNameSpace setVariable [format ["ExileServer_clan_%1",_clanID],_clanData];
	}
	else
	{
		_clanGroup = (_clanData select 5);
	};
	[_player] joinSilent _clanGroup;
};
_bambiPlayer setPosATL [_position select 0,_position select 1,0];
_bambiPlayer disableAI "FSM";
_bambiPlayer disableAI "MOVE";
_bambiPlayer disableAI "AUTOTARGET";
_bambiPlayer disableAI "TARGET";
_bambiPlayer disableAI "CHECKVISIBLE";
_bambiPlayer setDir _direction;
_bambiPlayer setName _name;
_bambiPlayer setVariable ["ExileMoney", 0, true]; 
_bambiPlayer setVariable ["ExileScore", (_accountData select 0)];
_bambiPlayer setVariable ["ExileKills", (_accountData select 1)];
_bambiPlayer setVariable ["ExileDeaths", (_accountData select 2)];
_bambiPlayer setVariable ["ExileClanID", _clanID];
_bambiPlayer setVariable ["ExileClanData", _clanData];
_bambiPlayer setVariable ["ExileHunger", 100];
_bambiPlayer setVariable ["ExileThirst", 100];
_bambiPlayer setVariable ["ExileTemperature", 37];
_bambiPlayer setVariable ["ExileWetness", 0];
_bambiPlayer setVariable ["ExileAlcohol", 0]; 
_bambiPlayer setVariable ["ExileName", _name]; 
_bambiPlayer setVariable ["ExileOwnerUID", getPlayerUID _requestingPlayer]; 
_bambiPlayer setVariable ["ExileIsBambi", true];
_bambiPlayer setVariable ["ExileXM8IsOnline", false, true];
_bambiPlayer setVariable ["ExileLocker", (_accountData select 4), true];
_devFriendlyMode = getNumber (configFile >> "CfgSettings" >> "ServerSettings" >> "devFriendyMode");
if (_devFriendlyMode isEqualTo 1) then 
{
	_devs = getArray (configFile >> "CfgSettings" >> "ServerSettings" >> "devs");
	{
		if ((getPlayerUID _requestingPlayer) isEqualTo (_x select 0))exitWith 
		{
			if((name _requestingPlayer) isEqualTo (_x select 1))then
			{
				_bambiPlayer setVariable ["ExileMoney", 500000, true];
				_bambiPlayer setVariable ["ExileScore", 100000];
			};
		};
	}
	forEach _devs;
};
_parachuteNetID = "";
if ((getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "parachuteSpawning")) isEqualTo 1) then
{
	_position set [2, getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "parachuteDropHeight")]; 
	if ((getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "haloJump")) isEqualTo 1) then
	{
		_bambiPlayer addBackpackGlobal "B_Parachute";
		_bambiPlayer setPosATL _position;
		_spawnType = 2;
	}
	else 
	{
		_parachuteObject = createVehicle ["Steerable_Parachute_F", _position, [], 0, "CAN_COLLIDE"];
		_parachuteObject setDir _direction;
		_parachuteObject setPosATL _position;
		_parachuteObject enableSimulationGlobal true;
		_parachuteNetID = netId _parachuteObject;
		_spawnType = 1;
	};
}
else
{
	_spawnType = 0;	
};

// Custom Loadout Starts Here. Uncomment the lines you want your players to have..

	// Remove Anything already on the BambiSettings
	removeAllAssignedItems _bambiPlayer;
	removeGoggles _bambiPlayer;
	removeHeadgear _bambiPlayer;
	removeUniform _bambiPlayer;
	//removeBackpackGlobal _bambiPlayer; // Only Uncomment This if Not Using Paracutes
	
	// Clothing
	_bambiPlayer forceAddUniform "Exile_Uniform_ExileCustoms"; // Black Exile Overalls
	_bambiPlayer addVest "V_Rangemaster_belt"; // Change Vest Class Here
	//_bambiPlayer addHeadgear "H_Beret_gen_F"; // Change Headgear Class Here
	//_bambiPlayer addBackpack "B_ViperHarness_blk_F"; // Change Backpack Class Here
	
	// Navigation Items
	//_bambiPlayer linkItem "ItemGPS"; // This Puts The GPS Into The Correct Slot
	_bambiPlayer linkItem "Exile_Item_XM8"; // This Puts The XM8 Into The Correct Slot 
	//_bambiPlayer linkItem "ItemCompass"; //This Puts The Compass Into The Correct Slot
	_bambiPlayer linkItem "ItemMap"; //This Puts The Map Into The Correct Slot
	//_bambiPlayer linkItem "ItemRadio"; //This Puts The Radio Into The Correct Slot
	
	// Food and Drink Items
	_bambiPlayer addItem "Exile_Item_PlasticBottleCoffee"; // Change Drink Class Here
	_bambiPlayer addItem "Exile_Item_EMRE"; // Change Food Class Here
	
	// Medical Items
	_bambiPlayer addItem "ACE_fieldDressing"; // Change Meds Class Here
	_bambiPlayer addItem "ACE_fieldDressing"; // Change Meds Class Here
	_bambiPlayer addItem "ACE_fieldDressing"; // Change Meds Class Here
	_bambiPlayer addItem "ACE_fieldDressing"; // Change Meds Class Here
	_bambiPlayer addItem "ACE_morphine"; // Change Meds Class Here
	_bambiPlayer addItem "ACE_epinephrine"; // Change Meds Class Here
	//_bambiPlayer addItem "Exile_Item_Bandage"; // Change Meds Class Here
	//_bambiPlayer addItem "Exile_Item_InstaDoc"; // Change Meds Class Here
	
	// Ammo - Add ammo before weapons
	_bambiPlayer addItemToVest "ACE_MapTools"; // Ammo For Weapon Listed Below
	_bambiPlayer addItemToVest "ACE_EarPlugs"; // Ammo For Weapon Listed Below
	_bambiPlayer addItemToVest "ACE_Flashlight_XL50"; // Ammo For Weapon Listed Below
	_bambiPlayer addItemToVest "ACE_RangeCard"; // Ammo For Weapon Listed Below
	//_bambiPlayer addItemToVest "11Rnd_45ACP_Mag"; // Ammo For Weapon Listed Below
	//_bambiPlayer addItemToVest "11Rnd_45ACP_Mag"; // Ammo For Weapon Listed Below
	
	// Weapons
	//_bambiPlayer addWeapon "hgun_Pistol_heavy_01_F"; // Weapon
	
	// Weapons Attachments
	//_bambiPlayer addHandgunItem "optic_MRD"; // Adds Attachment to Handgun | Change Attachment Class Here
	//_bambiPlayer addHandgunItem "muzzle_snds_acp"; // Adds Attachment to Handgun | Change Attachment Class Here
	//_bambiPlayer addPrimaryWeaponItem "optic_AMS_khk"; // Adds Attachment to Primary Weapon | Change Attachment Class Here
	//_bambiPlayer addPrimaryWeaponItem "bipod_03_F_oli";// Adds Attachment to Primary Weapon | Change Attachment Class Here
	//_bambiPlayer addPrimaryWeaponItem "muzzle_snds_B_khk_F"; // Adds Attachment to Primary Weapon | Change Attachment Class Here
	
// Custom Loadout Ends Here. Uncomment the lines you want your players to have..

_bambiPlayer addMPEventHandler ["MPKilled", {_this call ExileServer_object_player_event_onMpKilled}];
_bambiPlayer call ExileServer_object_player_database_insert;
_bambiPlayer call ExileServer_object_player_database_update;
[
	_sessionID, 
	"createPlayerResponse", 
	[
		_bambiPlayer, 
		_parachuteNetID, 
		str (_accountData select 0),
		(_accountData select 1),
		(_accountData select 2),
		100,
		100,
		0,
		(getNumber (configFile >> "CfgSettings" >> "BambiSettings" >> "protectionDuration")) * 60, 
		_clanData,
		_spawnType
	]
] 
call ExileServer_system_network_send_to;
[_sessionID, _bambiPlayer] call ExileServer_system_session_update;
true