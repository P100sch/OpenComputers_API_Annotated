---@class NoteAPI The Note API provides functionality to convert music notes into their respective MIDI code and/or their frequency in Hertz, among other things. It it used in combination with computer.beep and note blocks (using OpenComponents).
---@field midi fun(n:number|string):number Converts a note in string form (e.g. A#4 or Gb3, see below) or a given frequency into the respective MIDI code
---@field freq fun(n:number|string):number Converts a note in string form (e.g. A#4) or a given MIDI code into the respective frequency
---@field name fun(n:number):string Converts a MIDI value back into a string; if you have a frequency to convert, just use `note.name(note.midi(frequency))`
---@field ticks fun(n:number):number Converts note block ticks (0-24) into MIDI code (34-58, respectively) and vice-versa. Useful for use with Note Blocks and OpenComponents
---@field play fun(tone:string|number,duration:number) Plays a note from a string or MIDI code via computer.beep with the specified duration
local note = require("note")