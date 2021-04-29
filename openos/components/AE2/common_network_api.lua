---@class CommonNetworkAPI : ComponentProxy All AE2 components provide a common network api
---@field getCpus fun():table Get a list of tables representing the available CPUs in the network.
---@field getCraftables fun(filter:table):Craftable[] Get a list of known item recipes. These can be used to issue crafting requests.
---@field getItemsInNetwork fun(filter:table):table Get a list of the stored items in the network.
---@field store fun(filter:table,dbAddress:string,startSlot:number,count:number):boolean Store items in the network matching the specified filter in the database with the specified address.
---@field getFluidsInNetwork fun():table Get a list of the stored fluids in the network.
---@field getAvgPowerInjection fun():number Get the average power injection into the network.
---@field getAvgPowerUsage fun():number Get the average power usage of the network.
---@field getIdlePowerUsage fun():number Get the idle power usage of the network.
---@field getMaxStoredPower fun():number Get the maximum stored power in the network.
---@field getStoredPower fun():number Get the stored power in the network.

---@class Craftable
---@field getItemStack fun():table Returns the item stack representation of the crafting result.
---@field request fun(amount:number,prioritizePower:boolean,cpuName:string):userdata Requests the item to be crafted, returning an object that allows tracking the crafting status.

---@class CraftingStatus
---@field isCanceled fun():boolean Get whether the crafting request has been canceled.
---@field isDone fun():boolean Get whether the crafting request is done.

