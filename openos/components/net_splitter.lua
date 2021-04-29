---@class NetSplitter : ComponentProxy The net splitter connects networks, just like a cable. But the net splitter faces can be opened or closed, separating networks. A redstone signal inverts the faces. A scrench can be used to open/close a face. The net splitter also has an api to configure the faces.
---@field open fun(side: number):number Open the side, returns true if it changed to open.
---@field close fun():number Close the side, returns true if it changed to close.
---@field getSides fun():boolean[] Returns current open/close state of all sides in an array, indexed by direction.
---@field setSides fun(settings:boolean[]):boolean[] set open state (true/false) of all sides in an array; index by direction. Returns previous states.
local net_splitter = require("component").net_splitter