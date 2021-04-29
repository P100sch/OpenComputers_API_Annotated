---Allows pausing a script for the specified amount of time. Note that signals will still be processed by event handlers while the sleep is active, i.e. you cannot pull signals that were accumulated during the sleep after it ended, since no signals will remain in the queue (or at least not all of them).
---@param seconds number
function os:sleep(seconds) end