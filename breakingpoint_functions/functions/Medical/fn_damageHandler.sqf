/*
	Breaking Point Mod for Arma 3

	Released under Arma Public Share Like Licence (APL-SA)
	https://www.bistudio.com/community/licenses/arma-public-license-share-alike

	Alderon Games Pty Ltd
*/

scriptName "BP_fnc_damageHandler";

params ["_unit","_hit","_damage","_source","_ammo","_hitPartIndex","_instigator","_hitPoint"];

["damageHandler: Unit: %1 Hit: %2 Damage: %3 Source: %4 Ammo: %5 hitPartIndex: %6 instigator: %7 hitPoint: %8 #1000",_unit,_hit,_damage,_source,_ammo,_hitPartIndex,_instigator,_hitPoint] call BP_fnc_debugConsoleFormat;

if (_damage isEqualTo 0) exitwith {};
//Only Handle Damage On Valid Units
if (isNull _unit) exitWith {};

//Damage Events are only called on local units
if (!local _unit) exitWith {};

//Player Damage Handler Only
if (_unit != player) exitWith {};

//Fetch Related Data
_unconscious = _unit getVariable ["med_unconscious", false];
_type = [_damage,_ammo] call BP_fnc_medicalDamageType;
_isMinor = (_hitpoint in med_MinorWounds);
_isHeadHit = (_hit == "head" or {_hitPoint == "hitneck"});
//_isHeartHit = (_hit == "spine3");
_isPlayer = (isPlayer _source);
_inVehicle = !isNull objectParent _unit;
_inVehicleSource = !isNull objectParent _source;
_isMelee = _ammo isKindOf "Melee";
_selfDamage = (_unit == _source);
_trapDamage = player getVariable ["med_trap", false];

if (_ammo in BP_TrapAmmo && !_trapDamage) then {
	player setVariable ["med_trap", true];
	_trapDamage = true;
};

//Melee Self Damage
if (_selfDamage && {_isMelee}) exitWith {};

// Loot Damage
if (_source isKindOf "BP_LootBox") exitWith {};

if (_inVehicleSource) then {_source = _instigator};

_fallVelocity = (velocity _unit) select 2;
["damageHandler: Unit: %1 Hit: %2 Damage: %3 Source: %4 Ammo: %5 Type: %6 isMinor: %7 isHeadHit: %8 isPlayer: %9 HitPoint: %10 Velocity: %11 #1000",_unit,_hit,_damage,_source,_ammo,_type,_isMinor,_isHeadHit,_isPlayer,_hitPoint,_fallVelocity] call BP_fnc_debugConsoleFormat;

// Fuck Hackers
//if (_source == player) exitWith {};
//if (isNull _source) exitWith {};
if (_ammo == "" && {_fallVelocity > - 0.25} && {_selfDamage}) exitWith {};
if (_ammo == "" && SW_FreshLog) exitWith {};

// Heart Hit
//if (_isHeartHit and (_damage > 1)) exitWith
//{
//	[18] call BP_fnc_death;
//};

// Non-Lethal Rounds
if (_ammo isKindOf "BP_NonLethal" || {_ammo isKindOf "BP_Arrow_Tranq"}) exitWith
{
	if (_hit == "" && {!_inVehicle}) then {
		r_player_unconscious = true;
		r_player_unconsciousWeapon = true;
	};
	
	player setVariable ["hostage_perpetrator", (netID _source), true];
	player setVariable["med_unconscious", true ,true];
	//[(netID _source),(netID player)] remoteExecCall ["BPServer_fnc_hostageAdd",2];
};

if (_ammo isKindOf "BP_InfectedNeedle") exitWith {
	r_player_unconscious = true;
	r_player_unconsciousWeapon = true;
	if (!r_player_infected) then { r_player_infected = true; };
	
	player setVariable ["hostage_perpetrator", (netID _source), true];
	player setVariable["med_unconscious", true ,true];
};

//Fire Arrows
if (_ammo == "BP_Arrow_Ball_Fire") exitWith
{
	_fire = _unit getVariable ["fire",objNull];
	if (isNull _fire) then
	{
		_unit setVariable ["fire",_unit];
		[(netID _source),(netID _unit),"Player"] remoteExecCall ["BPServer_fnc_igniteEntity",2];
	};
};

// Fire Damage
if (isBurning _unit) exitWith 
{
	_scale = 30;
	_burnRate = (getBurningValue _unit);
	["Burn Value: %1 | Hit: %2 | Damage: %3 | Source: %4~1001",_burnRate,_hit,_damage,_source] call BP_fnc_debugConsoleFormat;
	r_player_blood = r_player_blood - (_damage * _scale);
};

//Bear Trap
if ((_ammo == "Human_Trap_Ammo" && _hitpoint == "hitlegs") && {_damage > 0.1}) exitwith 
{
	r_player_infected = true;
	r_player_injured = true;
	r_player_inpain = true;
	r_player_cardiac = true;
	r_player_bleedingLevel = 2;
	r_hit_legs = 1;
	r_fracture_legs = true;
	[player,"dog_damage",0,false] call BP_fnc_objSpeak;
};

// PVP Damage
_scale = 200;

// Zombie Damage
if (_ammo == "zombie") then {
	if (_damage > 0.4) then {
		_scale = _scale + 1125;
		if (_isHeadHit) then { _scale = _scale + 375; };
	};
	
	//Zombie Hit Overlay
	_randomMin = 1;
	_randomMax = 5;
	_random = floor (random _randomMax);
	if (_random > _randomMax) then { _random = _randomMax; };
	if (_random < _randomMin) then { _random = _randomMin; };
	_titleRscImg = format ["BP_Scratch_%1",_random];
	titleRsc [_titleRscImg,"PLAIN",_random];
};

/// Player Damage
if (_ammo != "zombie") then {
	_scale = _scale + 50; //250
	if (_damage > 0.01) then {
		//Headshot
		if (_isHeadHit) then { _scale = _scale + 750; }; //1000
		//Damage Was Caused By Another Player who isn't you.
		if (isPlayer _source && {!(player == _source)}) then 
		{
			_scale = _scale + 5; //255
			if (_isHeadHit) then { _scale = _scale + 500; };
			switch (_type) do {
				case 1: { _scale = _scale + 200 }; //455
				case 2: { _scale = _scale + 200 }; //455
			};

		};
	};
};

private ["_hitPain","_hitCardiac","_hitInfection","_hitInjured","_hitBleeding","_hitKnockout","_instantBleeding","_ammoScale","_bleedingChance","_bleedingLevel"];

// Medical Ammo Class Handler and Damage
if (_damage > 0.01) then 
{
	//Cause blood loss
	if (_hit == "body" && {_damage > 0.07}) then
	{
		//Shared Hit Variables
		_hitPain = false;
		_hitCardiac = false;
		_hitInfection = false;
		_hitInjured = false;
		_hitBleeding = false;
		_hitKnockout = false;
		//Zombie Ammo
		if (!_inVehicle) then 
		{
			if (_ammo == "zombie") then 
			{
				_instantBleeding = false;
				_ammoScale = 0;
				_bleedingLevel = 1;
				_bleedingChance = 25;
				_rndBleeding = (random 100);
				_hitBleeding = (_rndBleeding < _BleedingChance);
				if (_hitBleeding) then { _hitInjured = true; };
				if (random 100 < 35) then {r_player_infected = true; };
			};
		};
		
		//Camera Shake
		private ["_hasCameraShake","_power","_duration","_frequency"];
		_hasCameraShake = isClass (configFile >> "CfgAmmo" >> _ammo >> "CamShakeHit");
		if (_hasCameraShake) then {
			_power = getNumber(configFile >> "CfgAmmo" >> _ammo >> "CamShakeHit" >> "power");
			_duration = getNumber(configFile >> "CfgAmmo" >> _ammo >> "CamShakeHit" >> "duration");
			_frequency = getNumber(configFile >> "CfgAmmo" >> _ammo >> "CamShakeHit" >> "frequency");
			addCamShake [_power, _duration, _frequency];
		};

		//Standard Ammo
		_hasMedicalClass = isClass (configFile >> "CfgAmmo" >> _ammo >> "Medical");
		if (_hasMedicalClass) then 
		{
			//Config
			_medicalState = getNumber(configFile >> "CfgAmmo" >> _ammo >> "Medical" >> "MedicalState");
			_medicalChance = getNumber(configFile >> "CfgAmmo" >> _ammo >> "Medical" >> "MedicalChance");
			
			_instantBleeding = getNumber(configFile >> "CfgAmmo" >> _ammo >> "Medical" >> "InstantBleeding");
			_bleedingLevel = getNumber(configFile >> "CfgAmmo" >> _ammo >> "Medical" >> "BleedingLevel");
			_bleedingChance = getNumber(configFile >> "CfgAmmo" >> _ammo >> "Medical" >> "BleedingChance");
			
			_infection = getNumber(configFile >> "CfgAmmo" >> _ammo >> "Medical" >> "Infection");
			_infectionChance = getNumber(configFile >> "CfgAmmo" >> _ammo >> "Medical" >> "InfectionChance");
			_knockout = getNumber(configFile >> "CfgAmmo" >> _ammo >> "Medical" >> "Knockout");
			_knockoutChance = getNumber(configFile >> "CfgAmmo" >> _ammo >> "Medical" >> "KnockoutChance");
			_ammoScale = getNumber(configFile >> "CfgAmmo" >> _ammo >> "Medical" >> "scale");
			
			if (_instantBleeding == 1) then { _instantBleeding = true; } else { _instantBleeding = false; };
			if (_infection == 1) then { _infection = true; } else { _infection = false; };
			
			if (_ammoScale > 0) then {
				_scale = _scale + _ammoScale;
			};
			
			if (_instantBleeding) then {
				_hitBleeding = true;
				_hitInjured = true;
			} else {
				_rndBleeding = (random 100);
				_hitBleeding = (_rndBleeding < _BleedingChance);
				if (_hitBleeding) then {
					_hitInjured = true;
				};
			};
			
			if (_infection) then {
				_rndInfection = (random 100);
				_hitInfection = (_rndInfection < _infectionChance);
			};

			if (_knockout > 0) then {
				_rndKnockout = (random 100);
				_hitKnockout = (_rndKnockout < _knockoutChance);
					//bolt-action rifle check.
					if (_knockout == 0.5) then {
					if (currentWeapon _instigator in BP_BoltAction) then 
						{_hitKnockout = true}
						else 
						{_hitKnockout = false};
					};
				if (_hitKnockout) then {
				[player,1] spawn BP_fnc_medicalKnockDown;
				};
			};
			
			if (_medicalState > 0) then {
				_rndMedicalChance = (random 100);
				_hitMedicalChance = (_rndMedicalChance < _medicalChance);
				if (_hitMedicalChance) then {
					switch (_medicalState) do {
						//Pain / Shock
						case 1: {
							_hitPain = true; 
						};
						//Small Bandage
						case 2: {
							titleRsc ["BP_BloodspraySmall","PLAIN",0];
						};
						//Military Field Dressing
						case 3: {
							_hitCardiac = true;
							titleRsc ["BP_BloodsprayMedium","PLAIN",0];
						};
						//Surgery Kit (Seriously Fucked Up)
						case 4: {
							_BloodHitFX = [] spawn
							{
								sleep 0.25;
								"dynamicBlur" ppEffectAdjust [3];
								"dynamicBlur" ppEffectCommit 0.01;
								"dynamicBlur" ppEffectEnable true;
								titleRsc ["BP_BloodsprayLarge","PLAIN",0];
								sleep 0.15;
								"dynamicBlur" ppEffectAdjust [0];
								"dynamicBlur" ppEffectCommit 3;
								sleep 3;
								"dynamicBlur" ppEffectEnable true;
							};
							_hitPain = true;
							_hitCardiac = true;
							_hitInfection = true;
							_hitInjured = true;
							_hitBleeding = true;
							r_player_blood = r_player_blood - 50;
						};
						//Less Than Lethal
						case 5: {
							_hitPain = true;
							titleRsc ["BP_BloodsprayStunned","PLAIN",0];
						};
					};
				};
			};
		};
		
		//. Update Medical State
		if (_hitBleeding) then 
		{
			//Start Bleeding
			_hitInjured = true;
			//Elevate Bleeding Level If Required
			if (r_player_bleedingLevel < _bleedingLevel) then
			{
				//Cause The Player To Bleed At That Level.
				r_player_bleedingLevel = _bleedingLevel;
			};
		};
		
		if (_hitCardiac) then {
			if (!r_player_cardiac) then {
				r_player_cardiac = true;
				[player,"fieldbandage"] call BP_fnc_objSpeak;
			};
		};

		if (_hitInjured) then {
			if (!r_player_injured) then { r_player_injured = true; };
		};

		if (_hitInfection) then {
			if (!r_player_infected) then { r_player_infected = true; };
		};

		if (_hitPain) then {
			if (!r_player_inpain) then { r_player_inpain = true; };
		};
	};

	//Calculate Blood Loss
	_bloodLoss = (_damage * _scale);
	
	//25 % Damage Reduction while on Adrenaline
	if (r_player_adrenaline) then { _bloodLoss = _bloodLoss / 1.5; };
	
	//If Blood Loss > 500 = Start Bleeding
	if (_isPlayer) then
	{
		_playerClass = player getVariable ["class",0];
		if (_playerClass isEqualTo 1) then {
			_factionLevel = player call BP_fnc_getFactionLevel;
			_reduction = _factionLevel*250 min 750;
			_bloodLoss = _bloodLoss - _reduction max 0;
		};
		if (_bloodLoss > 500) then { r_player_injured = true; };
	} else {
		if (_inVehicle) then {
			if (_ammo == "") then  {
				if (_bloodLoss > 2500) then { r_player_injured = true; };
			};
		};
	};
	
	r_player_blood = (r_player_blood - _bloodLoss);
	
	//Process who Killed Who Events.
	if (_source != player) then 
	{
		if (_isPlayer && !_trapDamage) then
		{
			//Enable aggressor Actions
			if (_source distance player > 2000 && !(_ammo in BP_TrapAmmo)) then {
				r_player_blood = r_player_blood + _bloodLoss;
				r_player_injured = false;
			} else {
				[_unit,_source,_damage] call BP_fnc_damageHandlerHit;
				r_player_killer = _source;
			};
		};
	};
	
	//Debug
	["damageHandler: Applying Blood: Damage: %1 | Scale: %2 | Blood Loss: %3",_damage,_scale,_bloodLoss] call BP_fnc_debugConsoleFormat;

	//Player Death Condition Check
	//if (r_player_blood <= 0) then { [17] call BP_fnc_death; };
};

//Record Damage to Minor parts (legs, arms)
if (_hitpoint in med_MinorWounds) then 
{
	//Fall Damage
	if (_ammo == "") then 
	{
		//Leg DAMAGE
		if (_hitPoint == "hitlegs") then
		{
			if (_damage > 0.67) then 
			{
				[_unit,_hit,1,_hitPoint] call BP_fnc_objProcessHit;
				
				if (_selfDamage) then
				{
					if (_damage > 0.98) then 
					{
						if (_damage < 1.6) then 
						{
							titleRsc ["BP_BloodsprayLarge","PLAIN",0];
							r_player_blood = r_player_blood - 8000;
							r_fracture_legs = true;
							if (r_player_blood <= 0) then { [17] call BP_fnc_death; };
						} else {
							if (!BP_isUndead) then {
							[0] call BP_fnc_death;
							};
						};
					};
				};
			};
		};
	} else {
		if (_damage > 0.01) then
		{
			if (_ammo != "zombie") then
			{
				if (!_inVehicle) then
				{
					//Fetch Hitpoint Name
					_currentDamage = 0;
					if ((_hitPoint == "hithands") or (_hitPoint == "hitarms")) then { _currentDamage = r_hit_hands; };
					if (_hitPoint == "hitlegs") then { _currentDamage = r_hit_legs; };
		
					//Calculate Hitpoint Damage
					_cfgAmmo = configFile >> "CfgAmmo" >> _ammo;
					_cal = getNumber (_cfgAmmo >> "caliber");
					_limbDamage = (0.5 * _cal) + _currentDamage;
		
					//Apply Damage (Stacking)
					if ((_hitPoint == "hithands") or (_hitPoint == "hitarms")) then { r_hit_hands = _limbDamage; };
					if (_hitPoint == "hitlegs") then { r_hit_legs = _limbDamage; };
					
					//Value Limiting
					if (r_hit_hands > 1) then { r_hit_hands = 1; };
					if (r_hit_legs > 1) then { r_hit_legs = 1; };
					
					//Hands
					if ((_hitPoint == "hithands") or (_hitPoint == "hitarms")) then
					{
						if (r_hit_hands > 0.4) then
						{
							[] spawn { sleep 5; cutText ["Your arms have sustained severe damage.", "PLAIN DOWN"]; };
						} else {
							[] spawn { sleep 5; cutText ["Your arms have sustained moderate damage", "PLAIN DOWN"]; };
						};
					};
					//Legs
					if (_hitPoint == "hitlegs") then
					{
						if (r_hit_legs > 0.4) then
						{
							[] spawn { sleep 5; cutText ["Your legs have sustained severe damage.", "PLAIN DOWN"]; };
						} else {
							[] spawn { sleep 5; cutText ["Your legs have sustained moderate damage", "PLAIN DOWN"]; };
						};
					};
					
					//Calculate / Process Fatigue
					_fatigue = (r_hit_legs * 2.2) min 1;
					player enableFatigue true;
					player setFatigue _fatigue;
					
					//Calculate and Process Fractures
					_hasFractureVal = isNumber (_cfgAmmo >> "legFracture");
					if (_hasFractureVal) then {
						_fractureVal = getNumber (_cfgAmmo >> "legFracture");
						["damageHandler: CfgAmmo %1 Leg Fracture: %1",_fractureVal] call BP_fnc_debugConsoleFormat;
						if (_fractureVal == 1) then { r_fracture_legs = true; };
					} else {
						["damageHandler: CfgAmmo %1 has no legFracture Value.",_ammo] call BP_fnc_debugConsoleFormat;
					};
					//Debug Message
					//["damageHandler: Applying %1 Damage to %2 with %3 caliber.",_limbDamage,_hitpoint,_cal] call BP_fnc_debugConsoleFormat;
				};
			};
		};
	};
};

if (_damage > 0.1) then {
	//shake the cam, frighten them!
	1 call BP_fnc_medicalBulletHit;
};

if (_damage > 0.4) then //0.25
{
	// BLEEDING
	_isHit = true;
	_rndPain = (random 15);
	_rndInfection = (random 500);
	_hitPain = (_rndPain < _damage);
	if ((_isHeadHit) or (_damage > 1.2 and _hitPain)) then { _hitPain = true; };
	_hitInfection = (_rndInfection < 1);
	//make hit worse
	if (_isHit) then { r_player_blood = r_player_blood - 50; };
	if (_hitInfection) then { r_player_infected = true; };
	if (_hitPain) then { r_player_inpain = true; };
	if ((_damage > 1.5) and _isHeadHit and !_selfDamage) exitWith {
		if (!BP_isUndead) then 
		{
			_unit say ["z_headshot_0", 10];
			playSound ["z_headshot_0", true];
			[16] call BP_fnc_death;
		};
	};
};

// BALISTIC DAMAGE (Grenades /  Missles etc)
if (_type == 1) then 
{
	if (_damage > 0.01) then {
		//affect the player
		[20,45] call BP_fnc_medicalPitchWhine; //Visual , Sound
	};
	if (_damage > 4) then {
		//serious ballistic damage
		if (!BP_isUndead) then {
			[12] call BP_fnc_death;
		};
	} else {
		if (_damage > 2) then {
			r_player_cardiac = true;
			[player,"fieldbandage"] call BP_fnc_objSpeak;
		};
	};
};

// HIGH CALIBRE
if (_type == 2) then 
{
	//serious ballistic damage
	if (!BP_isUndead) then {
		if (_damage > 4) then { [4] call BP_fnc_death; };
	};
};
