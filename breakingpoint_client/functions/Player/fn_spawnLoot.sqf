/*
	Breaking Point Mod for Arma 3

	Released under Arma Public Share Like Licence (APL-SA)
	https://www.bistudio.com/community/licenses/arma-public-license-share-alike

	Alderon Games Pty Ltd
*/

#define RADIUS 0.0

params ["_iItem","_iClass","_iLootType","_iPos"];

//if (BP_LootGlobal >= BP_LootMax && {!isServer}) exitWith {};
//if (surfaceIsWater _iPos) exitWith {};
_height = (_iPos select 2) + 0.3;
_iPos set [2,_height];

if (isNil "_iClass") then
{
	["Spawn_Loot: Loot Class Is Undefined: iItem: %1 | iClass: %2 | iPos: %3 #1000",_iItem,_iClass,_iPos] call BP_fnc_debugConsoleFormat;
	_iClass = "default";
};

_item = objNull;

switch (_iClass) do {
	default {
		//Item is food, add random quantity of cans along with an item (if exists)
		_item = createVehicle ["GroundWeaponHolder_Scripted", _iPos, [], RADIUS, "CAN_COLLIDE"];
		_item setVehiclePosition [_iPos, [], 0, "CAN_COLLIDE"];
		_item enableDynamicSimulation true;
		_itemTypes = [] + ((getArray (configFile >> "cfgLoot" >> _iClass)) select 0);
		_index = BP_CLBase find _iClass;
		_weights = BP_CLChances select _index;
		_cntWeights = count _weights;
		_qty = 0;
		_max = ceil(random 2) + 1;
		while {_qty < _max} do {
			_tQty = round(random 1) + 1;
			_index = floor(random _cntWeights);
			_index = _weights select _index;
			_canType = _itemTypes select _index;
			_item addMagazineCargoGlobal [_canType,_tQty];
			_qty = _qty + _tQty;
		};
		if (_iItem != "") then {
			_item addWeaponCargoGlobal [_iItem,1];
		};
	};
	case "weapon": {
		//Item is a weapon, add it and a random quantity of magazines
		_item = createVehicle ["GroundWeaponHolder_Scripted", _iPos, [], RADIUS, "CAN_COLLIDE"];
		_item setVehiclePosition [_iPos, [], 0, "CAN_COLLIDE"];
		_item enableDynamicSimulation true;
		_item addWeaponCargoGlobal [_iItem,1];
		_mags = [] + getArray (configFile >> "cfgWeapons" >> _iItem >> "magazines");
		if ((count _mags) > 0) then {
			_ammoClass = _mags select 0;
			_magRndCount = round(random 2) + 1;
			if (_magRndCount > 0) then {
				for "_i" from 1 to _magRndCount do {
					_amount = 4 + round random parsenumber (_ammoClass select [3,2]);
					_item addMagazineAmmoCargo [_ammoClass,1,_amount];
				};
			};
		};
	};
	case "weaponA": {
		//Item is a weapon, add it and a random quantity of magazines
		_item = createVehicle ["GroundWeaponHolder_Scripted", _iPos, [], RADIUS, "CAN_COLLIDE"];
		_item setVehiclePosition [_iPos, [], 0, "CAN_COLLIDE"];
		_item enableDynamicSimulation true;
		_item addWeaponCargoGlobal [_iItem,1];
		_mags = [] + getArray (configFile >> "cfgWeapons" >> _iItem >> "magazines");
		_attach = getArray (configFile >> "cfgWeapons" >> _iItem >> "linkedAttach");
		{
			_item addItemCargoGlobal [_x, 1];
		} count _attach;
		if ((count _mags) > 0) then {
			_ammoClass = _mags select 0;
			_magRndCount = round(random 1) + 1;
			for "_i" from 1 to _magRndCount do {
				_amount = 4 + round random parsenumber (_ammoClass select [3,2]);
				_item addMagazineAmmoCargo [_ammoClass,1,_amount];
			};
		};
	};
	case "weaponNA": {
		//Item is a weapon, add it with NO AMMO (NA)
		_item = createVehicle ["GroundWeaponHolder_Scripted", _iPos, [], RADIUS, "CAN_COLLIDE"];
		_item setVehiclePosition [_iPos, [], 0, "CAN_COLLIDE"];
		_item enableDynamicSimulation true;
		_item addWeaponCargoGlobal [_iItem,1];
	};
	case "shotgun": {
		//shutgun with ammo
		_item = createVehicle ["GroundWeaponHolder_Scripted", _iPos, [], RADIUS, "CAN_COLLIDE"];
		_item setVehiclePosition [_iPos, [], 0, "CAN_COLLIDE"];
		_item enableDynamicSimulation true;
		_item addWeaponCargoGlobal [_iItem,1];
		_mags = ["BP_2Rnd_Buckshot", "BP_2Rnd_Slug", "BP_2Rnd_MagBuckshot"];
		_ammoClass = selectRandom _mags;
		_magRndCount = round(random 2) + 2;
		if (_magRndCount > 0) then {
			for "_i" from 1 to _magRndCount do {
				_amount = 4 + round random parsenumber (_ammoClass select [3,2]);
				_item addMagazineAmmoCargo [_ammoClass,1,_amount];
			};
		};
	};
	case "magazine": {
		//Item is one object or full magazine
		_item = createVehicle ["GroundWeaponHolder_Scripted", _iPos, [], RADIUS, "CAN_COLLIDE"];
		_item setVehiclePosition [_iPos, [], 0, "CAN_COLLIDE"];
		_item enableDynamicSimulation true;
		_item addMagazineCargoGlobal [_iItem,1];
	};
	case "ammo": {
		//Item is one magazine with random ammo count
		_magRndCount = round(random 1) + 1;
		_item = createVehicle ["GroundWeaponHolder_Scripted", _iPos, [], RADIUS, "CAN_COLLIDE"];
		_item setVehiclePosition [_iPos, [], 0, "CAN_COLLIDE"];
		_item enableDynamicSimulation true;
		for "_i" from 1 to _magRndCount do {
			_amount = 4 + round random parsenumber (_iItem select [3,2]);
			_item addMagazineAmmoCargo [_iItem,1,_amount];
		};
	};
	case "object": {
		//Item is one magazine
		private ["_config"];
		
		//Override All Loot Classes
		if (BP_Loot_Override) then { _iLootType = BP_Loot_OverrideClass; };
		
		_numItems = floor(random BP_LootBoxMaxItems);
		_isUnderMinItems = (_numItems < BP_LootBoxMinItems);
		
		//Don't Spawn Box If Config Set to Not Spawn If Under Minimum
		if (_isUnderMinItems and !BP_LootBoxMinSpawn) exitWith {};
		
		//Ensure Spawned Boxes always have minimum Item Count
		if (_isUnderMinItems) then { _numItems = BP_LootBoxMinItems; };
		
		//Tell the server to spawn the container
		[_iItem,_iPos,_numItems,_iLootType] remoteExecCall ["BPServer_fnc_containerSpawn",2];
	};
	case "vest": {
		//Item is one magazine
		_item = createVehicle ["GroundWeaponHolder_Scripted", _iPos, [], RADIUS, "CAN_COLLIDE"];
		_item setVehiclePosition [_iPos, [], 0, "CAN_COLLIDE"];
		_item addItemCargoGlobal [_iItem,1];
		_item enableDynamicSimulation true;
	};
	case "uniform": {
		//Item is one magazine
		_item = createVehicle ["GroundWeaponHolder_Scripted", _iPos, [], RADIUS, "CAN_COLLIDE"];
		_item setVehiclePosition [_iPos, [], 0, "CAN_COLLIDE"];
		_item addItemCargoGlobal [_iItem,1];
		_item enableDynamicSimulation true;
	};
	case "headgear": {
		//Item is one magazine
		_item = createVehicle ["GroundWeaponHolder_Scripted", _iPos, [], RADIUS, "CAN_COLLIDE"];
		_item setVehiclePosition [_iPos, [], 0, "CAN_COLLIDE"];
		_item addItemCargoGlobal [_iItem,1];
		_item enableDynamicSimulation true;
	};
	case "toolbelt": {
		//Item is one magazine
		_item = createVehicle ["GroundWeaponHolder_Scripted", _iPos, [], RADIUS, "CAN_COLLIDE"];
		_item setVehiclePosition [_iPos, [], 0, "CAN_COLLIDE"];
		_item addItemCargoGlobal [_iItem,1];
		_item enableDynamicSimulation true;
	};
	case "backpack": {
		//Item is one magazine
		_item = createVehicle ["GroundWeaponHolder_Scripted", _iPos, [], RADIUS, "CAN_COLLIDE"];
		_item setVehiclePosition [_iPos, [], 0, "CAN_COLLIDE"];
		_item addBackpackCargoGlobal [_iItem,1];
		_item enableDynamicSimulation true;
	};
};

_item hideObjectGlobal true;
if (player distance _item < 65) then {
_item hideObject false;
};

BP_LootGlobal = BP_LootGlobal + 1;

_item
