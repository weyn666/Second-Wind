// by ALIAS
fnc_teleportSFX_AI = {
private ["_unit"];
_unit = _this select 0;
_unit hideObjectGlobal true;sleep 0.2;_unit hideObjectGlobal false;sleep 0.2;_unit hideObjectGlobal true;sleep 0.1;_unit hideObjectGlobal false;sleep 0.2;_unit hideObjectGlobal true;sleep 0.2;_unit hideObjectGlobal false;
};

if (!isserver) exitWith {};
_obj_teleporter = _this select 0;
_obj_core		= _this select 1;
_list_teleport=[];
_list_vek_teleport=[];

while {alive _obj_teleporter} do 
{

_list_teleport = (position _obj_teleporter) nearEntities ["CAManBase",15];
/*
if (protection_smug !="") then 
{
	if (count _list_teleport>0) then 
	{
		{
			if ((headgear _x == protection_smug)or(goggles _x==protection_smug)or(uniform _x==protection_smug)or(vest _x==protection_smug)or(Backpack _x==protection_smug) or (protection_smug in (assigneditems _x + items _x))) 
			then {
			/*hint "protejat"} 
			else {
				_fresh_spawn = _x getVariable "teleported_in";
				if (isNil "_fresh_spawn") then 
				{
					[_obj_teleporter,["tele_message",100]] remoteExec ["say3d"];
					_eff_tel=[_x] call fnc_teleportSFX_AI;
					if (local _x) then 
						{
							_dest_tele = [getpos _obj_teleporter,300,-1,5,0,0.5,0] call BIS_fnc_findSafePos; 
							_x setPos _dest_tele;
							_x setDammage ((getDammage _x) + (random 0.25));
						};
					if (isPlayer _x) then {null=[[_x,_obj_teleporter],"AL_smuggler\teleport_effect.sqf"] remoteExec ["execVM"]};
				};
			};		
		} foreach _list_teleport;
	};
} else {*/
	{
		_fresh_spawn = _x getVariable "teleported_in";
		if (isNil "_fresh_spawn") then 
		{
			[_obj_teleporter,["tele_message",100]] remoteExec ["say3d"];
			[_x] call fnc_teleportSFX_AI;
			//if (local _x) then 
				//{
					_dest_tele = [getpos _obj_teleporter,300,-1,5,0,0.5,0] call BIS_fnc_findSafePos; 
					//_dest_tele = getposATL _obj_teleporter;
					_x setPos _dest_tele;
					//r_player_blood = r_player_blood - random 2000;
					//_x setDammage ((getDammage _x) + (random 0.25));
				//};
			if (isPlayer _x) then {null=[[_x,_obj_teleporter],"AL_smuggler\teleport_effect.sqf"] remoteExec ["execVM",_x]};
		};		
	} foreach _list_teleport;
//};

_list_vek_teleport = (position _obj_teleporter) nearEntities ["LandVehicle",15];

if (count _list_vek_teleport>0) then 
{
	{
		_fresh_spawn = _x getVariable "teleported_in";
		if (isNil "_fresh_spawn") then 
		{
			[_obj_teleporter,["tele_message",100]] remoteExec ["say3d"];
			[_x] call fnc_teleportSFX_AI;
			//if (local _x) then
			//{
				_dest_tele = [getpos _obj_teleporter,300,-1,5,0,0.5,0] call BIS_fnc_findSafePos; 
				//_dest_tele = getposATL _obj_teleporter;
				_x setPos _dest_tele;
				//r_player_blood = r_player_blood - random 2000;
				//_x setDammage ((getDammage _x)+(random 0.25));
			//};
		};
	} foreach _list_vek_teleport;
	_list_vek_teleport = [];
	_list_teleport=[];
};
sleep 2;
};