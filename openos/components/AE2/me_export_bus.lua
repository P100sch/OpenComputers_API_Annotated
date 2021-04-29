---@class MEExportBus : CommonNetworkAPI
---@field getImportConfiguration fun(side:number,slot:number):boolean Get the configuration of the import bus pointing in the specified direction.
---@field setImportConfiguration fun(side:number,slot:number,database:string,entry:number):boolean Configure the import bus pointing in the specified direction to import item stacks matching the specified descriptor. Database needs address.

