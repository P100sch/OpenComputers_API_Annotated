---@class WorldSensor : ComponentProxy
---@field isGasPresent fun(gas:string):boolean Gets whether the world the device is currently in has the specified gas.
---@field getGravity fun():number Gets the gravity of the world that the device is currently in.
---@field hasBreathableAtmosphere fun():boolean Gets whether the world that the device is in has a breathable atmosphere.
---@field getWindLevel fun():number Gets the wind level of the world that the device is currently in.
local world_sensor = require("component").world_sensor
