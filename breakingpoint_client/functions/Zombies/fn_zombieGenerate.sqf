/*
	Breaking Point Mod for Arma 3

	Released under Arma Public Share Like Licence (APL-SA)
	https://www.bistudio.com/community/licenses/arma-public-license-share-alike

	Alderon Games Pty Ltd
*/

params ["_position","_unitTypes",["_temp",false,[false]]];

if (speed (vehicle player) >= 120) exitWith {};

if (!BP_Zeds) exitWith {};
if (BP_GlobalZeds > BP_ZedMaxGlobal) exitWith {};

_destination = _position;
_PosList = selectBestPlaces [_position,150,"(0.1 + 2*houses - trees) * (1 - forest) * (1 - sea) * (0.2 + deadBody)",10,7];
if (random 100 < 50 && !(_PosList isEqualTo [])) then {
	_PosSelect = selectRandom _PosList;
	_Pos = _PosSelect select 0 findEmptyPosition [0,10];
	if !(_Pos isEqualTo []) then {
		_destination = _Pos;
	};
};

_config = configFile >> "CfgBuildingLoot";
/*if (isClass (missionConfigFile >> "CfgBuildingLoot")) then
{
	_config = missionConfigFile >> "CfgBuildingLoot";
};*/
if (_unitTypes isEqualTo []) then { _unitTypes = []+ getArray (_config >> "Default" >> "zombieClass"); };
_type = selectRandom _unitTypes;

BP_NearbyZombies = BP_NearbyZombies + 1;
BP_LocalZeds = BP_LocalZeds + 1;
BP_GlobalZeds = BP_GlobalZeds + 1;

_zombie = createAgent [_type, _position, [], 0, "CAN_COLLIDE"];

_zombie setVariable ["BIS_noCoreConversations",true];
_zombie setVariable ["buildingPos",_position];
_zombie setVariable ["temp",_temp];

{ _zombie disableAI _x; } forEach ["FSM","AUTOTARGET","TARGET","AIMINGERROR","SUPPRESSION","CHECKVISIBLE","COVER","AUTOCOMBAT"];

_zombie setBehaviour "CARELESS";
_zombie setCombatMode "RED";

_zombie setVariable ["agentObject",_zombie];
_zombie setVariable ["myDest",_destination];
_global = (!local _zombie);
_zombie setVariable ["myDestSpeed",2,_global];
//_zombie setVariable ["newDest",_position];
_zombie setDir random 360;
_zombie setUnitPos "UP";
_zombie setVariable ["stance","UP"];
_zombie setVariable ["BaseLocation",_position];
_zombie setVariable ["doLoiter",true];
_zombie addRating -2500;


//Add some loot
_rnd = random 1;
if (_rnd < 0.10) then
{
	_backpack = selectRandom BP_RandomZombie_Backpack;
	//_weapon = selectRandom BP_RandomZombie_Gun;
	_item = selectRandom BP_RandomZombie_Item ;
	//_clothing = selectRandom BP_RandomZombie_Clothing;

	_zombie addBackpack _backpack;
	_zombieBackpack = (unitBackpack _zombie);
	_zombieBackpack addMagazineCargoGlobal [_item,1];
	//_zombie addWeaponGlobal _weapon;
	//_zombie switchMove "";
};

_fsmid = [_position,_zombie] execFSM "\breakingpoint_code\system\zombie_agent.fsm";
_fsmid setFSMVariable ["_handle", _fsmid];
_zombie setVariable ["fsm_handle", _fsmid];

/*if ((_rnd > 0.98) or (_rnd < 0.02)) then {
_zombie setVariable ["fire",_zombie];
[(netID _zombie),(netID _zombie),"Zombie"] remoteExecCall ["BPServer_fnc_igniteEntity",2];
};*/