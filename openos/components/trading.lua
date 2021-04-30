---@class Trading : ComponentProxy inofficial documentation, because I found none.
---@field getTrades fun():Trade[] Returns a table of trades in range as Trade objects.
local trading = require("component").trading

---@class Trade
---@field getInput fun():ItemStack, ItemStack Returns the items the merchant wants for this trade.
---@field getMerchantId fun():number Returns a sorted index of the merchant that provided this trade.
---@field getOutPut fun():ItemStack Returns the item the merchant offers for this trade.
---@field isEnabled fun():boolean Returns whether the merchant currently wants to trade this.