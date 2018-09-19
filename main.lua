require "plterm"
--local socket = require("socket")

--[[
plterm - Pure Lua ANSI Terminal functions - unix only
This module assumes the tty is in raw mode.
It provides functions based on stty (so available on unix)
to save, set and restore tty modes.
Module functions:
clear()     -- clear screen
cleareol()  -- clear to end of line
golc(l, c)  -- move the cursor to line l, column c
up(n)
down(n)
right(n)
left(n)     -- move the cursor by n positions (default to 1)
color(f, b, m)
            -- change the color used to write characters
			   (foreground color, background color, modifier)
			   see term.colors
hide()
show()      -- hide or show the cursor
save()
restore()   -- save and restore the position of the cursor
reset()     -- reset the terminal (colors, cursor position)
input()     -- input iterator (coroutine-based)
		       return a "next key" function that can be iteratively called
			   to read a key (escape sequences returned by function keys
			   are parsed)
rawinput()  -- same, but escape sequences are not parsed.
getcurpos() -- return the current position of the cursor
getscrlc()  -- return the dimensions of the screen
               (number of lines and columns)
keyname()   -- return a printable name for any key
               - key names in term.keys for function keys,
			   - control characters are represented as "^A"
			   - the character itself for other keys
tty mode management functions
setrawmode()       -- set the terminal in raw mode
setsanemode()      -- set the terminal in a default "sane mode"
savemode()         -- get the current mode as a string
restoremode(mode)  -- restore a mode saved by savemode()
License: BSD
https://github.com/philanc/plterm
-- just in case, a good ref on ANSI esc sequences:
https://en.wikipedia.org/wiki/ANSI_escape_code
(in the text, "CSI" is "<esc>[")
]]

local function main()
  term.setrawmode()
  term.clear()

  local ls, cs = term.getscrlc()

  term.golc(1,1)
  for i=1,cs do
    term.out("#")
  end
  term.golc(ls,1)
  for i=1,cs do
    term.out("#")
  end

  for i=1,ls-1 do
    term.golc(i,1)
    term.out("#")
    term.golc(i,cs)
    term.out("#")
  end

  local socket = require("socket")
  local host = "localhost"
  local port = 50234
  term.out("Using remote host '" ..host.. "' and port " .. port .. "...")
  local c = assert(socket.connect(host, port))

  term.golc(3,3)
  term.setsanemode()
  term.golc(4,3)
  local l = io.read()
  while l and l ~= "" do
  	assert(c:send(l))
    term.golc(4,3)
    local l = io.read()
  end
end

local old_mode = term.savemode()

local err_msg,err_trace
xpcall(main, function(m)
  err_msg = m
  err_trace = debug.traceback()
end)

term.clear()
term.golc(0,0)
term.restoremode(old_mode)

term.out(err_msg, "\n", err_trace, "\n")
