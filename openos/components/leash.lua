---@class Leash : ComponentProxy
---@field leash fun(side:number):boolean Tries to put an entity on the specified side of the device onto a leash.
---@field unleash fun() Unleashes all currently leashed entities.
local leash = require("component").leash