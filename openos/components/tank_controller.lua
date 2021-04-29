---@class TankController : ComponentProxy With this API the robot can store fluids, “suck” fluids, and “drop” fluids to and from tanks and the world. It also allows the robot to receive additional information about fluid containers in the robot's inventory, as well as inspecting fluid stacks.
---@field getTankCapacity fun(side:number):number|nil,string Get the capacity of the tank on the specified side of the robot. Back refers to the robot's own selected tank.
---@field getTankLevel fun(side:number):number|nil,string Gets amount of fluid in tank on specified side.
---@field getFluidInTank fun(side:number):TankDescription[] Get a description of the fluid in the the tank on the specified side of the robot. Note: sides.back deprecated, use getFluidInInternalTank()
---@field getFluidInInternalTank fun(slot:number):TankDescription Get a description of fluid in the specified or selected slot of robot inventory.
---@field drain fun(amount:number):boolean Transfers fluid from a tank in the selected inventory slot to the selected tank. If the amount of fluid that would be generated from the item is too large to fit into the tank (for example buckets will usually generate 1000) nothing will happen, that is no fluid is lost.
---@field fill fun(amount:number):boolean Transfers fluid from the selected tank to a tank in the selected inventory slot. If the specified amount is too low (for example for buckets the minimum amount will usually be 1000) nothing will happen, that is no fluid is lost.
---@field getTankCapacityInSlot fun(slot:number):number Gets capacity of tank in specified or selected slot of the robot inventory.
---@field getTankLevelInSlot fun(slot:number):number Gets amount of fluid tank item in specified or selected slot of the robot inventory.
---@field getFluidInTankInSlot fun(slot:number):TankDescription Gets description of fluid in tank item in the specified or selected slot of the robot inventory.
local tank_controller = require("component").tank_controller

---@class TankDescription
---@field amount number
---@field capacity number|nil
---@field hasTag boolean
---@field label string
---@field name string