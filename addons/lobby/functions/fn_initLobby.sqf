#include "script_component.hpp"

params [["_logic", objNull]];

if (_logic isEqualTo objNull) exitWith { SETUPERROR("Module is not defined") };

COOPR_LOBBY = _logic;
INFO("lobby initialized");


