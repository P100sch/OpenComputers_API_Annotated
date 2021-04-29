---@class Sign : ComponentProxy
---@field getValue fun():string|nil,string Gets the text currently displayed on the sign in front of the robot, or `nil` and an error message if there is no sign in front of the robot.
---@field setValue fun(value:string):string|nil,string Sets the text of the sign in front of the robot. Returns the new text on the sign (which may be a truncated version of the passed argument) or `nil` and an error message if there is no sign in front of the robot.
local sign = require("component").sign