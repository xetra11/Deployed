#include "script_component.hpp"

LSTART("PLAYER KILLED");
if(player getVariable [KEY_STATE, STATE_OK] isEqualTo STATE_OK) then {
    //TODO: no saving until db is ready
    //SLOG("saving character before respawn to lobby...");
    //SLOG("...saved");
    call coopr_fnc_death;
    _state = player call coopr_fnc_createCharacterStateFromPlayer;
    _baseLoadout = (player getVariable KEY_CLASS) call coopr_fnc_getLoadoutForClass;
    [_state, KEY_POSITION, getPos GLOB(COOPR_HQ)] call CBA_fnc_hashSet;
    [_state, KEY_LOADOUT, _baseLoadout] call CBA_fnc_hashSet;
    _slot = player getVariable [KEY_SLOT, -1];
    //[_state] call coopr_fnc_characterStatePrettyLog;
    [SERVER, "coopr_fnc_updateCharacter", [getPlayerUID player, _state, _slot], //request-related
        [], {
        sleep 5;
        call coopr_fnc_spawnInLobby;
        createDialog "coopr_Login_Dialog";
        call coopr_fnc_initLoginDialog;
        LEND("PLAYER KILLED");
        }
    ] call Promise_Create;
}
