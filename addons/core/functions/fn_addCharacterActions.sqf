#include "script_component.hpp"

if (INTEGRATE_ACE3) then {
    call coopr_fnc_ace3_addCharacterActions;
} else {
    _broadcastActionCondition = { count ([alive_sys_spotrep_store] call CBA_fnc_hashKeys) > 0 };
    _reconReportActionCondition = { [player] call coopr_fnc_hasActiveTask };

    player addAction [localize "str.coopr.core.action.rep", { player call coopr_fnc_showReputation; } , [], 0.5, true, true, "", "true"];
    player addAction [localize "str.coopr.core.action.report", { call coopr_fnc_initReconReportDialog; } , [], 0.5, true, true, "", _reconReportActionCondition call coopr_fnc_codeAsString];
    player addAction [localize "str.coopr.core.action.broadcast", { player call coopr_fnc_broadcastReconReport; } , [], 0.5, true, true, "", _broadcastActionCondition call coopr_fnc_codeAsString];
    player addAction ["<t color='#ff0000'>Logout</t>", {[] spawn { call coopr_fnc_logout; };} , [], 0.5, true, true, "", "true"];
};

INFO("player actions added");
