if (!isServer) exitWith {};
 
waitUntil {!isNil "ALiVE_STATIC_DATA_LOADED"};
 
ALiVE_PLACEMENT_CUSTOM_VEHICLEBLACKLIST = ["B_MBT_01_cannon_F","CUP_B_M1A1_Woodland_US_Army","CUP_B_M1A1_DES_US_Army","CUP_B_M1A2_TUSK_MG_US_Army","CUP_B_M1A2_TUSK_MG_DES_US_Army","B_MBT_01_TUSK_F","B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_AA_F","CUP_B_M7Bradley_USA_D","CUP_B_M2A3Bradley_USA_W"];