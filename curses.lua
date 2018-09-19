local curses = require "curses"


local function printf (fmt, ...)
  return print (string.format (fmt, ...))
end


local function main ()
  local stdscr = curses.initscr ()

  curses.cbreak ()
  curses.echo (false)	-- not noecho !
  curses.nl (false)	-- not nonl !

  stdscr:clear ()
  curses.curs_set(2)

  local a = {}
  for k, v in pairs (curses) do
    if type (v) == "number" then a[#a+1] = k end
  end

  curses.beep()
  curses.flash()
  --stdscr:box(curses.ACS_BLOCK,curses.ACS_BLOCK)
  stdscr:border (curses.ACS_VLINE, curses.ACS_VLINE,
                 curses.ACS_HLINE, curses.ACS_HLINE,
                 curses.ACS_ULCORNER, curses.ACS_URCORNER,
                 curses.ACS_LLCORNER, curses.ACS_LRCORNER)
  stdscr:mvaddstr (15, 20, "print out curses constants (y/n) ? ")
  stdscr:refresh ()

  curses.halfdelay(1)

  local x = 0
  repeat
    local c = stdscr:getch ()
    stdscr:mvaddstr (17, 20, string.format("Hi: %d %d", curses.baudrate(), x))
    x = x + 1
  until c
  if c < 256 then c = string.char (c) end

  curses.endwin ()

  if c == "y" then
    table.sort (a, cmp)
    for i, k in ipairs (a) do
      printf (" %03d. %20s = 0x%08x (%d)",
        i, "curses." .. k, curses[k], curses[k])
    end
  end
end


-- To display Lua errors, we must close curses to return to
-- normal terminal mode, and then write the error to stdout.
local function err (err)
  curses.endwin ()
  print "Caught an error:"
  print (debug.traceback (err, 2))
  os.exit (2)
end

xpcall (main, err)
