---@class UUID The uuid API is a very simple library for creating 128 bit random identifiers.
---@field next fun():string Returns 128 bit random identifiers, represented as a hex value in a string grouped by 8, 4, 4, 4, and 12 hex characters, separated by dashes.
local uuid = require("uuid")