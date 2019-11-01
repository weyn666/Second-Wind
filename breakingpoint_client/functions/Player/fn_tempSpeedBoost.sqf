/*
	BreakingPoint: Second Wind
	Purpose: Increase player's speed for a given period of time.
	Author: Malcain
*/

params ["_unit","_speedIncr"];

_speedcoef = getAnimSpeedCoef _unit;
sleep 1;
if (_speedcoef < 1.12) then {
	player setAnimSpeedCoef _speedIncr;
	player setFatigue 0;
	sleep 30;
	player setAnimSpeedCoef 1;
};