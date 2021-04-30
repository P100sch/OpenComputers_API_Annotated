---@class Microcontroller : ComponentProxy These callbacks can only be called by the microcontroller itself, or its direct neighbors (i.e. other computers that share a face with the microcontroller). Note that since microcontrollers cannot access external components they cannot interact with each others microcontroller components, but a computer can access a neighbouring microcontroller.
---@field setSideOpen fun(side:number,open:boolean):boolean Set whether network messages are sent via the specified side.
---@field start fun():boolean Starts the microcontroller. Returns true if the state changed.
---@field isRunning fun():boolean Returns whether the microcontroller is running.
---@field isSideOpen fun(side:number):boolean Get whether network messages are sent via the specified side.
---@field lastError fun():string Returns the reason the microcontroller crashed, if applicable. Returns nil if no crash has occurred.
---@field stop fun():boolean Stops the microcontroller. Returns true if the state changed.
local microcontroller = require("component").microcontroller