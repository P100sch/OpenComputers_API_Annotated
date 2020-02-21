---@class Event The Event API provides a basic event system to allow your code to react to [signals](https://ocdoc.cil.li/component:signals "component:signals") sent by the OS or other programs/libraries. <br/>For example, this can be used to capture keys pressed, react if an external screen is attached or removed, or handle incoming network messages.
---@field listen fun(event:string,callback:fun(...:any)):boolean Register a new event listener that should be called for events with the specified name.<br/> **event** - name of the signal to listen to.<br/> **callback** - the function to call if this signal is received. The function will receive the event name it was registered for as first parameter, then all remaining parameters as defined by the [signal](https://ocdoc.cil.li/component:signals "component:signals") that caused the event.<br/> **Returns:** `number`, the event id which can be canceled via `event.cancel`, if the event was successfully registered, `false` if this function was already registered for this event type.
---@field ignore fun(event:string,callback:fun(...:any)):boolean Unregister a previously registered event listener.  **event** - name of the signal to unregister.  **callback** - the function that was used to register for this event.  **Returns:** `true` if the event was successfully unregistered, `false` if this function was not registered for this event type.  *Note:* An event listeners may return `false` to unregister themselves, which is equivalent to calling `event.ignore` and passing the listener with the event name it was registered for.
---@field timer fun(interval:number,callback:function,times:number):number Starts a new timer that will be called after the time specified in `interval`.  **interval** - time in seconds between each invocation of the callback function. Can be a fraction like 0.05.  **callback** - the function to call.  **times** - how many times the function will be called. If omitted the function will be called once. Pass `math.huge` for infinite repeat.  **Returns:** a timer ID that can be used to cancel the timer at any time.  *Note*: the timer resolution can vary. If the computer is idle and enters sleep mode, it will only be woken in a game tick, so the time the callback is called may be up to 0.05 seconds off.
---@field cancel fun(timerId:number):boolean Cancels a timer previously created with `event.timer`.  **timerId** - a timer ID as returned by `event.timer`.  **Returns:** `true` if the timer was stopped, `false` if there was no timer with the specified ID.
---@field pull fun(timout:number,name:string,...:any):string,any,any,any,any,any,any,any,any Pulls and returns the next available event from the queue, or waits until one becomes available.  **timeout** - if passed the function will wait for a new event for this many seconds at maximum then returns `nil` if no event was queued during that time.  **name** - an event pattern that will act as a filter. If given then only events that match this pattern will be returned. Can be `nil` in which case the event names will not be filtered. See `string.match` on how to use patterns.  **...** - any number of parameters in the same order as defined by the [signal](https://ocdoc.cil.li/component:signals "component:signals") that is expected. Those arguments will act as filters for the additional arguments returned by the signal. Direct equality is used to determine if the argument is equal to the given filter. Can be `nil` in which case this particular argument will not be filtered.  Filter example:  The `touch` signal (when a player clicks on a tier two or three screen) has the signature `screenX: number, screenY: number, playerName: string`  To only pull clicks by player "Steve" you'd do:  `local _, x, y = event.pull("touch", nil, nil, "Steve")`
---@field pullFiltered fun(timeout:number,filer:fun(name:string,...:any):boolean):string|nil,any,any,any,any,any,any,any,any Returns: Variable number of Returns<br/> (Since 1.5.9) Pulls and returns the next available event from the queue, or waits until one becomes available but allows filtering by specifying filter function. **timeout** - if passed the function will wait for a new event for this many seconds at maximum then returns `nil` if no event was queued during that time.  **filter** - if passed the function will use it as a filtering function of events. Allows for advanced filtering.<br/> Example:    [snippet.lua](https://ocdoc.cil.li/_export/code/api:event?codeblock=0 "Download Snippet")<br/>   local allowedPlayers = {"Kubuxu", "Sangar", "Magik6k", "Vexatos"} <br/>local function filter(name, ...) <br/>  if name ~= "key_up" and name ~= "key_down" and name ~= "touch" then <br/>    return false <br/>  end <br/>  local nick <br/>  if name == "touch" then <br/>    nick = select(3, ...) <br/>  else <br/>    nick = select(4, ...) <br/>  end <br/>  for _, allowed in ipairs(allowedPlayers) do <br/>    if nick == allowed then <br/>      return true <br/>    end <br/>  end <br/>  return false <br/>end <br/> <br/>local e = {event.pullFiltered(filter)}  -- We are pulling key_up, key_down and click events for unlimited amount of time. The filter will ensure that only events caused by players in allowedPlayers are pulled.
---@field pullMultiple fun(...:string):string,any,any,any,any,any,any,any Returns: Variable number of Returns<br/> (Since 1.5.9) As its arguments `pullMultiple` accepts multiple event names to be pulled, allowing basic filtering of multiple events at once.
---@field onError fun(message:any) Global event callback error handler. If an event listener throws an error, we handle it in this function to avoid it bubbling into unrelated code (that only triggered the execution by calling `event.pull`). Per default, this logs errors into a file on the temporary file system.  You can replace this function with your own if you want to handle event errors in a different way.
---@field push fun(name:string,...:any) This is only an alias to [computer.pushSignal](https://ocdoc.cil.li/api:computer "api:computer"). This does not modify the arguments in any way. It seemed logical to add the alias to the event library because there is also an `event.pull` for signals.
local event = require("event")