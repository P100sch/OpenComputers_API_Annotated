---@class SidesAPI This "API" provides a global table to allow you to refer to sides / directions by name, as opposed to their numbers. The underlying number values are identical to Minecraft's internal numbering (as well as the `ForgeDirection` Enum). This table serves as a two-directional look-up, so you can resolve names to numbers, but also numbers back to a human readable name. For example, `sides.top` has the value `1`, whereas `sides[1]` has the string value `top`. A couple of aliases for the side names are available, so it's less likely to accidentally pick the wrong one. These are the basic values:
---@field public bottom number|"0"
---@field public down number|"0"
---@field public negy number|"0"
---@field public top number|"1"
---@field public up number|"1"
---@field public posy number|"1"
---@field public back number|"2"
---@field public north number|"2"
---@field public negz number|"2"
---@field public front number|"3"
---@field public south number|"3"
---@field public posz number|"3"
---@field public forward number|"3"
---@field public right number|"4"
---@field public west number|"4"
---@field public negx number|"4"
---@field public left number|"5"
---@field public east number|"5"
---@field public posx number|"5"
---@field __index fun(side:number):string Converts numbers back to strings
local sides = require("sides")

---@param first number
function test(first)  end

test(sides.west)