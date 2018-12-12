#include "script_component.hpp"

params [["_logic", objNull]];

private _hqSide = _logic getVariable ["Side", ""];
private _faction = _logic getVariable ["Faction", ""];
private _reputationPerMan = _logic getVariable ["ReputationMan", ""];
private _WIAReputation = _logic getVariable ["WIAReputation", ""];
private _communications = (_logic getVariable ["Communications", ""]) splitString "," ;

FLOG("Position of HQ is: %1", getPos _logic);
FLOG("Communication devices: %1", _communications);

FLOG("Side of HQ is: %1", _hqSide);
FLOG("Faction of HQ is: %1", _faction);
FLOG("Reputation per Man is: %1", _reputationPerMan);
FLOG("Reputation malus for WIA is: %1", _WIAReputation);

[_hqSide, _faction, _reputationPerMan, _WIAReputation, _logic] call coopr_fnc_initHQ;
[_communications] call coopr_fnc_initHQCommunications;

true
