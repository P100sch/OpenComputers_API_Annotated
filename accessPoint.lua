---@class AccessPoint : ComponentProxy
---@field getStrength fun():number Get the signal strength (range) used when relaying messages.
---@field setStrength fun(strength:number):number Set the signal strength (range) used when relaying messages.
---@field isRepeater fun():boolean Check whether Access Point is acting as a repeater (re-send received wireless messages).
---@field setRepeater fun(enabled:boolean):boolean Sets whether Access Point should act as a repeater (re-send received wireless messages).
local accesspoint = require("component").accesspoint