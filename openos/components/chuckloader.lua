--TODO: Add Markdown
---@class Chunkloader : ComponentProxy
---@field isActive fun():boolean Returns whether the chunkloader is currently active.
---@field setActive fun(enabled:boolean):boolean Enables or disables the chunkloader. Returns the new state, which may be false if no chunk loading ticket could be acquired.
local chunkloader = require("component").chunkloader