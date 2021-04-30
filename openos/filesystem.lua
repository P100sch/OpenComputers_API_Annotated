---@class FilesystemAPI This library allows a general way of interacting with file system components. While each component is it's own "folder", these folders can be "mounted" somewhere into a global directory tree. This allows seamlessly interacting on multiple file system components. Not to be confused with the [Filesystem component](https://ocdoc.cil.li/component:filesystem "component:filesystem") with which this API works.
---@field isAutorunEnabled fun():boolean Returns whether autorun is currently enabled. If this is `true`, newly mounted file systems will be checked for a file named `autorun[.lua]` in their root directory. If such a file exists, it is executed.
---@field setAutorunEnabled fun(value:boolean) Sets whether autorun files should be ran on startup.
---@field canonical fun(path:string):string Returns the canonical form of the specified path, i.e. a path containing no "indirections" such as `.` or `..`. For example, the paths `/tmp/../bin/ls.lua` and `/bin/./ls.lua` are equivalent, and their canonical form is `/bin/ls.lua`.<br/>Note that this function truncates relative paths to their topmost "known" directory. For example, `../bin/ls.lua` becomes `bin/ls.lua`. It stays a relative path, however - mind the lack of a leading slash.
---@field segments fun(path:string):table Returns a table containing one entry for each *canonical* segment of the given path. Examples:<br/>-   `filesystem.segments("foo/bar")` → `{"foo","bar"}`<br/>-   `filesystem.segments("foo/bar/../baz")` → `{"foo","baz"}`
---@field concat fun(pathA:string,pathB:string,...:string):string Concatenates two or more paths. Note that all paths other than the first are treated as relative paths, even if they begin with a slash. The canonical form of the resulting concatenated path is returned, so `fs.concat("a", "..")` results in an empty string.
---@field path fun(path:string):string Returns the path component of a path to a file, i.e. everything before the last slash in the canonical form of the specified path.
---@field name fun(path:string):string Returns the file name component of a path to a file, i.e. everything after the last slash in the canonical form of the specified path.
---@field proxy fun(filter:string):table|nil,string This is similar to `component.proxy`, except that the specified string may also be a file system component's label. We check for the label first, if no file system has the specified label we fall back to `component.proxy`. Returns the proxy of the specified file system, or `nil` and an error message if no file system matching the specified filter was found.
---@field mount fun(fs:Filesystem|string,path:string):boolean|nil,string Mounts a file system at the specified path. The first parameter can be either a file system component's proxy, its address or its label. The second is a path into the global directory tree. Returns true if the file system was successfully mounted, `nil` and an error message otherwise.
---@field mounts fun():(fun():fun():Filesystem),string Returns an iterator function over all currently mounted file system component's proxies and the paths at which they are mounted. This means the same proxy may appear multiple times, but with different mount paths.
---@field umount fun(fsOrPath:Filesystem|string):boolean Unmounts a file system. The parameter can either be a file system component's proxy or (abbreviated) address, in which case all mount points of this file system will be removed, or a path into the global directory structure, in which case the file system mount containing that directory will be unmounted.
---@field isLink fun(path:string):boolean,string Checks if the object at the specified path is a symlink, if so returns the path to where it links (as of 1.3.3).
---@field link fun(target:string,linkpath:string):boolean|nil,string Creates a symbolic link to the specified target path at the specified path. This is a 'soft' link, i.e. it the target file does not actually have to exist at the time of creation, and the link will not be deleted if the target file is deleted. Symbolic links do not persist across reboots.
---@field get fun(path:string):Filesystem,string|nil,string Gets the file system component's proxy that contains the specified path. Returns the proxy and mount path, or nil and an error message.
---@field exists fun(path:string):boolean Checks whether a file or folder exist at the specified path.
---@field size fun(path:string):number Gets the file size of the file at the specified location. Returns 0 if the path points to anything other than a file.
---@field isDirectory fun(path:string):boolean Gets whether the path points to a directory. Returns false if not, either because the path points to a file, or file.exists(path) is false.
---@field lastModified fun(path:string):number Returns the real world unix timestamp of the last time the file at the specified path was modified. For directories this is usually the time of their creation.
---@field list fun(path:string):(fun():fun():string)|nil,string Returns an iterator over all elements in the directory at the specified path. Returns `nil` and an error messages if the path is invalid or some other error occurred.<br/>Note that directories usually are postfixed with a slash, to allow identifying them without an additional call to `fs.isDirectory`.
---@field makeDirectory fun(path:string):boolean|nil,string Creates a new directory at the specified path. Creates any parent directories that do not exist yet, if necessary. Returns `true` on success, `nil` and an error message otherwise.
---@field remove fun(path:string):boolean|nil,string Deletes a file or folder. If the path specifies a folder, deletes all files and subdirectories in the folder, recursively. Return `true` on success, `nil` and an error message otherwise.
---@field rename fun(oldPath:string,newPath:string):boolean|nil,string Renames a file or folder. If the paths point to different file system components this will only work for files, because it actually perform a copy operation, followed by a deletion if the copy succeeds.<br/>Returns `true` on success, `nil` and an error message otherwise.
---@field copy fun(fromPath:string,toPath:string):boolean|nil,string Copies a file to the specified location. The target path has to contain the target file name. Does not support folders.
---@field open fun(path:string,mode:string|"'r'"|"'rb'"|"'w'"|"'wb'"|"'a'"|"'ab'"):File|nil,string Opens a file at the specified path for reading or writing. If mode is not specified it defaults to "r". Possible modes are: `r`, `rb`, `w`, `wb`, `a` and `ab`.<br/>Returns a file stream (see below) on success, `nil` and an error message otherwise.<br/>Note that you can only open a limited number of files per file system at the same time. Files will be automatically closed when the garbage collection kicks in, but it is generally a good idea to call `close` on the file stream when done with the file.<br/>-   *Important**: it is generally recommended to use `io.open` instead of this function, to get a buffered wrapper for the file stream.<br/>When opening files directly via the file system API you will get a file stream, a table with four functions. These functions are thin wrappers to the file system proxy's callbacks, which also means that read/write operations are *not* buffered, and can therefore be slow when reading few bytes often. You'll usually want to use `io.open` instead.
local filesystem = require("filesystem")

---@class File
---@field close fun() Closes the file stream, releasing the handle on the underlying file system.
---@field read fun(n:number):string|nil,string Tries to read the specified number of bytes from the file stream. Returns the read string, which may be shorter than the specified number. Returns `nil` when the end of the stream was reached. Returns `nil` and an error message if some error occurred.
---@field seek fun(whence:string|"'cur'"|"'set'"|"'end'",offset:number):number|nil,string Jumps to the specified position in the file stream, if possible. Only supported by file streams opened in read mode. The first parameter determines the relative location to seek from and can be `cur` for the current position, `set` for the beginning of the stream and `end` for the end of the stream. The second parameter is the offset by which to modify the position. Returns the new position or `nil` and an error message if some error occurred.<br/>The default value for the second parameter is 0, so `f:seek("set")` will reset the position to the start of the file, `f:seek("cur")` will return the current position in the file.
---@field write fun(value:string):boolean|nil,string Writes the specified data to the stream. Returns `true` on success, `nil` and an error message otherwise.