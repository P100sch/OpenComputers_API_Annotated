---@class TractorBeam : ComponentProxy
---@field suck fun():boolean Tries to pick up a random item in the robots' vicinity (a 9×9 area with the robot at its center).
local tractor_beam = require("component").tractor_beam