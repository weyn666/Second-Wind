/*
	Breaking Point Mod for Arma 3

	Released under Arma Public Share Like Licence (APL-SA)
	https://www.bistudio.com/community/licenses/arma-public-license-share-alike

	Alderon Games Pty Ltd
*/


private ["_unit","_needsFieldBandage","_needsSurgery","_bleedingLevel"];

_unit = (_this select 3) select 0;

_needsFieldBandage = false;
_needsSurgery = false;

if (_unit == player) then {
	_needsFieldBandage = r_player_cardiac;
	_needsSurgery = (r_player_bleedingLevel > 3);
} else {
	_bleedingLevel = _unit getVariable ["med_bleedingLevel",false];
	_needsSurgery = (_bleedingLevel > 3);
	_needsFieldBandage = _unit getVariable ["med_isCardiac",false];
};

if (_needsSurgery) exitWith { cutText ["Your wounds are too severe, you need Surgery.", "PLAIN DOWN"]; };
if (_needsFieldBandage) exitWith { cutText ["Your wounds are too severe, you need a Military Field Dressing.", "PLAIN DOWN"]; };

call BP_fnc_medicalRemoveMedicActions;

_finished = ["medic"] call BP_fnc_medicAnim;
if (_finished) then 
{
	["medBandage",(netID _unit),(netID player)] remoteExecCall ["BPServer_fnc_medicalUpdate",2];
} else {
	r_interrupt = false;
	player switchMove "";
	player playActionNow "stop";
};