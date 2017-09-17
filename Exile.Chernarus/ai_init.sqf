private "_this";
_this = _this select 0;

if (side _this == east) then
{
	_poptabs = round random 200;
	_this setVariable ["ExileMoney",_poptabs,true];
	_this addMPEventHandler ["MPKilled",'if (isServer) then {_this call DMS_fnc_OnKilled;};'];
	_this setVariable ["DMS_AI_Side", "Bandit"];
	_this setVariable ["DMS_AI_Type", "Soldier"];
	_this setVariable
	[
		"DMS_AI_Respect",
		missionNamespace getVariable [format ["DMS_%1_%2_RepGain","Bandit","Soldier"],0]
	];
};
