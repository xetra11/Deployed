#define TSTART(var1) [format ["<< Test Start for %1 >>", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
#define TEND(var1) [format ["<< Test End for %1 >>", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
#define TLOG(var1) [format ["TEST - %1", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define TSUCCESS [format ["TEST - failed", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define TFAIL [format ["TEST - success", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug

#define TASSERT(expression) if(expression) then { ["TEST - success", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug; } else { ["TEST - failure", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug; }


