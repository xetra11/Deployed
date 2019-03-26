#include "script_component.hpp"

params[["_entriesTextbox", objNull],
       ["_entries", []]];

if (_entriesTextbox isEqualTo objNull) exitWith { ERROR("_entriesTextbox was empty string") };
_entriesTextbox ctrlSetStructuredText (parseText ""); // clear textbox
private _entryText = "";

DEBUG("updating recon report entries");
DEBUG2("%1 entries found", count _entries);

{
    DEBUG2("adding entry: %1", _x);
    private _type = [_x, COOPR_KEY_RECON_ENTRY_TYPE] call CBA_fnc_hashGet;
    private _strength = [_x, COOPR_KEY_RECON_ENTRY_STRENGTH] call CBA_fnc_hashGet;
    private _behaviour = [_x, COOPR_KEY_RECON_ENTRY_BEHAVIOUR] call CBA_fnc_hashGet;
    private _marker = [_x, COOPR_KEY_RECON_ENTRY_MARKER] call CBA_fnc_hashGet;
    private _time = [_x, COOPR_KEY_RECON_ENTRY_TIME] call CBA_fnc_hashGet;
    private _markerPos = getMarkerPos _marker;

    DEBUG2("type: %1", _type);
    private _text = format ["%1,%2,%3 pos: (%4,%5) time %6", _type, _strength, _behaviour, _markerPos select 0, _markerPos select 1, _time];
    _entryText = composeText [_entryText, _text, lineBreak];

} forEach _entries;

if (_entryText isEqualTo "") then {
    DEBUG("no entries found to render");
} else {
    _entriesTextbox ctrlSetStructuredText _entryText;
}