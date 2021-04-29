---@class InternetCard : ComponentProxy
---@field isTcpEnabled fun():boolean Returns whether TCP connections can be made (config setting).
---@field isHttpEnabled fun():boolean Returns whether HTTP requests can be made (config setting).
---@field connect fun(address:string,port:number):TCPSocket Opens a new TCP connection. Returns the handle of the connection.
---@field request fun(url:string,postData:string,headers:table):HTTPRequest Sends a new HTTP request. Returns the handle of the connection.
local internet = require("component").internet

---@class TCPSocket After calling `finishConnect` or `read`, this socket generates a signal named `internet_ready` whenever new data is available to be read. It has one parameter which is the socket id.
---@field read fun(n:number):string Tries to read data from the socket stream. Returns the read byte array.
---@field close fun() Closes an open socket stream.
---@field write fun(data:string):number Tries to write data to the socket stream. Returns the number of bytes written.
---@field finishConnect fun():boolean Ensures a socket is connected. Errors if the connection failed.
---@field id fun():string Returns the id for this socket.

---@class HTTPRequest
---@field read fun(n:number):string Tries to read data from the response. Returns the read byte array.
---@field response fun():number,string,table Get response code, message and headers.
---@field close fun() Closes an open socket stream.
---@field finishConnect fun():boolean Ensures a response is available. Errors if the connection failed.