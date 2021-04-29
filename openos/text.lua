---@class TextAPI This API provides some more general operations on strings and data serialization into and back from strings.
---@field detab fun(value:string,tabWidth:number):string Converts tabs in a string to spaces, while aligning the tags at the specified tab width. This is used for formatting text in `term.write`, for example.
---@field padRight fun(value:string,length:number):string Pads a string with whitespace on the right up to the specified length.
---@field padLeft fun(value:string,length:number):string Pads a string with whitespace on the left up to the specified length.
---@field trim fun(value:string):string Removes whitespace characters from the start and end of a string.
---@field wrap fun(value:string,width:number,maxWidth:number) Wraps the provided string to specified width.
---@field wrappedLines fun(value:string,width:number,maxWidth:number) Returns a wrapper function around `text.wrap`.
---@field tokenize fun(value:string) Splits the input string into a table, using space as the delimiter.
local text = require("text")