///////////////////////////////////////////////////////////////////////////////
// Static Objects
///////////////////////////////////////////////////////////////////////////////

if (!hasInterface || isServer) exitWith {};

///////////////////////////////////////////////////////////////////////////
// Vybor Traders
///////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
// Vybor Vehicle Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Vehicle",
	"Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3780.82,8960.52,0.101166],
    157.522
]
call ExileClient_object_trader_create;
  
///////////////////////////////////////////////////////////////////////////
// Vybor Hardware Trader
///////////////////////////////////////////////////////////////////////////

_workBench = "Land_Workbench_01_F" createVehicleLocal [0,0,0];
_workBench setDir 204.239;
_workBench setPosATL [3816.36,8954.08,0.0464783];

_trader = 
[
    "Exile_Trader_Hardware",
	"Exile_Trader_Hardware",
    "WhiteHead_17",
    ["InBaseMoves_sitHighUp1"],
    [0, 0, -0.5],
    170,
    _workBench
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Armory Trader
///////////////////////////////////////////////////////////////////////////
_chair = "Land_CampingChair_V2_F" createVehicleLocal [0,0,0];
_chair setDir 307.332;    
_chair setPosATL [3802.79,8948.49,0.0621948];

_trader =
[
    "Exile_Trader_Armory",
	"Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["InBaseMoves_SittingRifle1"],
    [0, -0.15, -0.45],
    180,
    _chair
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Specops Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_SpecialOperations",
	"Exile_Trader_SpecialOperations",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3815.71,8937.93,0.0636292],
    33.4256
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Vehicle Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_VehicleCustoms",
	"Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [3798.62,8954.57,0.00149536],
    306.098
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Food Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Food",
	"Exile_Trader_Food",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3813.74,8948.08,0.0636902],
    187.627
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Equipment Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Equipment",
	"Exile_Trader_Equipment",
    "WhiteHead_19",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3819.96,8945.24,0.0636292],
    202.523
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Mafia Trader Office
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Office",
	"Exile_Trader_Office",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3803.36,8955.37,0.0636902],
    72.2944
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_WasteDump",
	"Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3804,8964.08,0.00137329],
    110.134
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Guard 01
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Guard_01",
	"",
    "WhiteHead_17",
    ["InBaseMoves_patrolling1"],
    [3819.38,8937.03,4.75092],
    141.103
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Guard 02
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Guard_02",
	"",
    "WhiteHead_03",
    ["InBaseMoves_patrolling2"],
    [3827.68,8944.11,0.00143433],
    150.082
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Guard 03
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Guard_03",
	"",
    "AfricanHead_03",
    ["InBaseMoves_patrolling1"],
    [3800.61,8950,4.74426],
    277.653
]
call ExileClient_object_trader_create;

/*
///////////////////////////////////////////////////////////////////////////
// Elektro Trader Zone
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
// Elektro Armory Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Armory",
	"Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [10171.8,1810.96,0.000988007],
    146
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Elektro Equipment Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Equipment",
	"Exile_Trader_Equipment",
    "WhiteHead_19",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [10161.8,1804.92,0.00145578],
    91.328
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Elektro Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_WasteDump",
	"Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [10147.6,1857.78,0.00143909],
    118.105
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Elektro Vehicle Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Vehicle",
	"Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [10157.6,1814.12,0.00143909],
    255.925
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Elektro Hardware Trader
///////////////////////////////////////////////////////////////////////////
_workBench = "Land_Workbench_01_F" createVehicleLocal [0,0,0];
_workBench setDir 0;
_workBench setPosATL [10158.1, 1825.38, 0];

_trader=
[
    "Exile_Trader_Hardware",
	"Exile_Trader_Hardware",
    "WhiteHead_17",
    ["InBaseMoves_sitHighUp1"],
    [0, 0, -0.5],
    170,
    _workBench
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Elektro Fast Food Trader
///////////////////////////////////////////////////////////////////////////
_cashDesk = "Land_CashDesk_F" createVehicleLocal [0,0,0];
_cashDesk setDir 0;
_cashDesk setPosATL [10163.3, 1817.1, 0.112376];

_microwave = "Land_Microwave_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _microwave;         
_microwave disableCollisionWith _cashDesk; 
_microwave attachTo [_cashDesk, [-0.6, 0.2, 1.1]];

_ketchup = "Land_Ketchup_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _ketchup;         
_ketchup disableCollisionWith _cashDesk; 
_ketchup attachTo [_cashDesk, [-0.6, 0, 1.1]];

_mustard = "Land_Mustard_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _mustard;         
_mustard disableCollisionWith _cashDesk; 
_mustard attachTo [_cashDesk, [-0.5, -0.05, 1.1]];

_trader = 
[
    "Exile_Trader_Food",
	"Exile_Trader_Food",
    "GreekHead_A3_01",
    ["InBaseMoves_table1"],
    [0.1, 0.5, 0.2],
    170,
    _cashDesk
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Elektro Specops Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_SpecialOperations",
	"Exile_Trader_SpecialOperations",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [10168.8,1802.02,0.076],
    0
]
call ExileClient_object_trader_create;


///////////////////////////////////////////////////////////////////////////
// Elektro Mafia Trader Office
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Office",
	"Exile_Trader_Office",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [10161.2,1815.76,3.44215],
    123.299
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Elektro Guard 01
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Guard_01",
	"",
    "WhiteHead_17",
    ["InBaseMoves_patrolling1"],
    [10153.6,1837.15,10.0015],
    179.438
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Elektro Guard 02
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Guard_02",
	"",
    "WhiteHead_17",
    ["InBaseMoves_patrolling1"],
    [10160.9,1801.15,12.3602],
    241.436
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Elektro Guard 03
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Guard_03",
	"",
    "WhiteHead_17",
    ["InBaseMoves_patrolling1"],
    [10184.1,1814.77,1.05854],
    42.7191
]
call ExileClient_object_trader_create;
*/

///////////////////////////////////////////////////////////////////////////
// Polana
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
// Polana Armory Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Armory",
	"Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [11464.6,7481.61,0.560],
    291.762
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Polana Equipment Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Equipment",
	"Exile_Trader_Equipment",
    "WhiteHead_19",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [11452.4,7482.59,0.451],
    106.544
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Polana Fast Food Trader
///////////////////////////////////////////////////////////////////////////
_cashDesk = "Land_CashDesk_F" createVehicleLocal [0,0,0];
_cashDesk setDir 108;
_cashDesk setPosATL [11479, 7481.87, 0.508];

_microwave = "Land_Microwave_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _microwave;         
_microwave disableCollisionWith _cashDesk; 
_microwave attachTo [_cashDesk, [-0.6, 0.2, 1.1]];

_ketchup = "Land_Ketchup_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _ketchup;         
_ketchup disableCollisionWith _cashDesk; 
_ketchup attachTo [_cashDesk, [-0.6, 0, 1.1]];

_mustard = "Land_Mustard_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _mustard;         
_mustard disableCollisionWith _cashDesk; 
_mustard attachTo [_cashDesk, [-0.5, -0.05, 1.1]];

_trader =
[
    "Exile_Trader_Food",
	"Exile_Trader_Food",
    "GreekHead_A3_01",
    ["InBaseMoves_table1"],
    [0.1, 0.5, 0.2],
    170,
    _cashDesk
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Polana Hardware Trader
///////////////////////////////////////////////////////////////////////////
_workBench = "Land_Workbench_01_F" createVehicleLocal [0,0,0];
_workBench setDir 197.761;
_workBench setPosATL [11467.7, 7475.27, 0.504];

_trader =
[
    "Exile_Trader_Hardware",
	"Exile_Trader_Hardware",
    "WhiteHead_17",
    ["InBaseMoves_sitHighUp1"],
    [0, 0, -0.5],
    170,
    _workBench
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Polana Specops Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_SpecialOperations",
	"Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [11454.4, 7487.59, 0.486],
    73.656
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Polana Vehicle Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Vehicle",
	"Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["InBaseMoves_repairVehicleKnl", "InBaseMoves_repairVehiclePne"],
    [11448.899, 7534.427, 0],
    270
]
call ExileClient_object_trader_create;

_carWreck = "Land_Wreck_CarDismantled_F" createVehicleLocal [0,0,0];
_carWreck setDir 175.455;    
_carWreck setPosATL [11447, 7534.427, 0.0208359];

///////////////////////////////////////////////////////////////////////////
// Polana Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
	"Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [11455.325,7509.269,0],
    77.147
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Polana Vehicle Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_VehicleCustoms",
	"Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [11448.8, 7552.76, 0.783],
    96.353
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Polana Office Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Office",
	"Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [11448.1, 7495.66, 0.504],
    90.307
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Polana Guard 01
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Guard_01",
	"",
    "WhiteHead_17",
    ["InBaseMoves_patrolling1"],
    [11478.6,7551.02,3.299],
    331.436
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Polana Guard 02
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Guard_02",
	"",
    "WhiteHead_03",
    ["InBaseMoves_patrolling2"],
    [11473.5,7489.53,12.352],
    0
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Polana Guard 03
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Guard_03",
	"",
    "AfricanHead_03",
    ["InBaseMoves_patrolling1"],
    [11465.6,7498.4,5.122],
    0
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Krasnostav Trader Zone
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
// Krasnostav Aircraft Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Aircraft",
	"Exile_Trader_Aircraft",
    "WhiteHead_17",
    ["LHD_krajPaluby"],
    [12191.7,12601.1,9.419],
    145.82
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Krasnostav Aircraft Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_AircraftCustoms",
	"Exile_Trader_AircraftCustoms",
    "GreekHead_A3_07",
    ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"],
    [12156.1,12610.4,0.00143433],
    32.369
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Krasnostav Guard 01
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Guard_01",
	"",
    "WhiteHead_17",
    ["InBaseMoves_patrolling1"],
    [12189.7,12597.7,13.276],
    291
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Krasnostav Guard 02
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Guard_02",
	"",
    "WhiteHead_03",
    ["InBaseMoves_patrolling2"],
    [12139.1,12604,0.00268555],
    191.710
]

call ExileClient_object_trader_create;