---@class AccessPoint : ComponentProxy This component is provided by the [access point](https://ocdoc.cil.li/block:access_point "block:access_point") to allow computers to change the strength of the signal used to relay wireless messages.
---@field getStrength fun():number Get the signal strength (range) used when relaying messages.
---@field setStrength fun(strength:number):number Set the signal strength (range) used when relaying messages.
---@field isRepeater fun():boolean Check whether Access Point is acting as a repeater (re-send received wireless messages).
---@field setRepeater fun(enabled:boolean):boolean Sets whether Access Point should act as a repeater (re-send received wireless messages).
local accesspoint = require("component").accesspoint