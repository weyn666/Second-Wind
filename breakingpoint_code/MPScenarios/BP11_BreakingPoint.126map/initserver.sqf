/*// by ALIAS

enable_toxic_grenade		= true; publicVariable "enable_toxic_grenade";
enable_incendiary_grenade	= true; publicVariable "enable_incendiary_grenade";
enable_stun_grenade			= true; publicVariable "enable_stun_grenade";
enable_emp_grenade			= true; publicVariable "enable_emp_grenade";

// damage done on units
tox_damage		= 0.1; publicVariable "tox_damage"; // damage inflicted over time by toxic gas
emp_damage		= 0.1; publicVariable "emp_damage"; // damage on units inflicted by electroshock
incend_damage	= 0.02; publicVariable "incend_damage"; // damage inflicted on players by incendiary grenade over time 

// damage done by fire on buildings
building_dam = 0.5; publicVariable "building_dam";

// protective gear against toxic gas
tox_prot="H_PilotHelmetFighter_B"; publicVariable "tox_prot";

// class name of the animation use by player to estinguish fire
off_fire = ["amovppnemstpsraswrfldnon_amovppnemevaslowwrfldl","amovppnemstpsraswrfldnon_amovppnemevaslowwrfldr","amovppnemstpsnonwnondnon_amovppnemevasnonwnondl","amovppnemstpsnonwnondnon_amovppnemevasnonwnondr","amovppnemstpsraswpstdnon_amovppnemevaslowwpstdl","amovppnemstpsraswpstdnon_amovppnemevaslowwpstdr"];
publicVariable "off_fire";

// turrets that can be affectes by EMP
static_turrets_emp = ["B_static_AA_F", "B_static_AT_F","B_T_Static_AA_F","B_T_Static_AT_F","B_T_GMG_01_F","B_T_HMG_01_F","B_T_Mortar_01_F","B_HMG_01_high_F","B_HMG_01_A_F","B_GMG_01_F","B_GMG_01_high_F","B_GMG_01_A_F","B_Mortar_01_F","B_G_Mortar_01_F","B_Static_Designator_01_F","B_AAA_System_01_F","B_SAM_System_01_F","B_SAM_System_02_F","O_HMG_01_F","O_HMG_01_high_F","O_HMG_01_A_F","O_GMG_01_F","O_GMG_01_high_F","O_GMG_01_A_F","O_Mortar_01_F","O_G_Mortar_01_F","O_static_AA_F","O_static_AT_F","O_Static_Designator_02_F","I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","I_GMG_01_F","I_GMG_01_high_F","I_GMG_01_A_F","I_Mortar_01_F","I_G_Mortar_01_F","I_static_AA_F","I_static_AT_F"];
publicVariable "static_turrets_emp";

// helmets that can be affectes by EMP
special_helmet_emp = ["H_PilotHelmetFighter_B", "H_PilotHelmetFighter_O","H_HelmetO_ViperSP_ghex_F","H_PilotHelmetFighter_I","H_HelmetO_ViperSP_hex_F"];
publicVariable "special_helmet_emp";

// launchers that can be affectes by EMP
special_launchers_emp = ["launch_RPG32_F","launch_O_Titan_F","launch_O_Titan_short_F","launch_MRAWS_sand_F","launch_NLAW_F","launch_B_Titan_short_F","launch_B_Titan_F","launch_B_Titan_short_tna_F","launch_B_Titan_tna_F","launch_MRAWS_green_F","launch_MRAWS_olive_rail_F","launch_I_Titan_short_F","launch_I_Titan_F","launch_RPG32_ghex_F","launch_O_Vorona_green_F","launch_O_Titan_short_ghex_F","launch_O_Titan_ghex_F","launch_O_Vorona_brown_F"];
publicVariable "special_launchers_emp";

// street lamps affected by EMP or fire
street_lapms = ["Land_fs_roof_F","Land_TTowerBig_2_F","Land_TTowerBig_1_F","Lamps_base_F","PowerLines_base_F","PowerLines_Small_base_F","Land_LampStreet_small_F","Land_fs_sign_F"];
publicVariable "street_lapms";

// vehicles affected by fire or EMP
vik_list = ["CAR","TANK","PLANE","HELICOPTER","Motorcycle","Air","Ship"];
publicVariable "vik_list";
// for tanks there is 50% chance to be destroyed by fire, therefore sometimes fire will go off without destroying the tank

// vegetation affected by fire
list_vegetation = ["TREE","SMALL TREE","BUSH","FOREST BORDER","FOREST TRIANGLE","FOREST SQUARE","FOREST"];
publicVariable "list_vegetation";

// buildings which can be affected by fire
buildings_list = ["BUILDING","HOUSE","CHURCH","CHAPEL","FUELSTATION","HOSPITAL","RUIN","BUNKER"];
publicVariable "buildings_list";

// class names for units you have in your mission
list_man = ["Civilian","SoldierGB","SoldierEB","SoldierWB"]; // "CAManBase"
publicVariable "list_man";

/////////////////////// DO NOT EDIT LINES BELOW ---------------------------------------------------------------------------------

[] spawn {
	if (isNil "allPlayers_on") then 
	{
		chk_players = true;
		while {chk_players} do 
		{
			//allPlayers_on = allPlayers_on - entities "HeadlessClient_F";
			allPlayers_on = call BIS_fnc_listPlayers;
			publicVariable "allPlayers_on";
			sleep 60;
		};
	}
};