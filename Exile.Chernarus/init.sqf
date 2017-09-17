SA_TOW_IN_EXILE_SAFEZONE_ENABLED = true;
ASL_EXILE_SAFEZONE_ENABLED = true;

[] execVM "Custom\rearm\takegive_poptab_init.sqf";

if(hasInterface) then{
    [] execVM "Custom\rearm\service_point.sqf";
};
// Enable ALiVE
//call compile preprocessFile "staticData.sqf";
