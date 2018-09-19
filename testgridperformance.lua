local coolgrid = require("coolgrid")
local coolgrid2 = require("coolgrid2")

local w = 10
local x = 1
local y = 1

do
  local t = os.clock()
  for i=1,100000 do
    coolgrid(w)
  end
  t = os.clock() - t
  print("100000 coolgrid new: ", t)
end

do
  local g = coolgrid(w)
  local t = os.clock()
  for i=1,100000 do
    g[x][y] = "test"
  end
  t = os.clock() - t
  print("100000 coolgrid set: ", t)
end

do
  local g = coolgrid(w)
  g[x][y] = "test"
  local t = os.clock()
  for i=1,100000 do
    local _ = g[x][y]
  end
  t = os.clock() - t
  print("100000 coolgrid get: ", t)
end

do
  local t = os.clock()
  for i=1,100000 do
    coolgrid2(w)
  end
  t = os.clock() - t
  print("100000 coolgrid2 new: ", t)
end

do
  local g = coolgrid2(w)
  local t = os.clock()
  for i=1,100000 do
    g[x][y] = "test"
  end
  t = os.clock() - t
  print("100000 coolgrid2 set: ", t)
end

do
  local g = coolgrid2(w)
  g[x][y] = "test"
  local t = os.clock()
  for i=1,100000 do
    local _ = g[x][y]
  end
  t = os.clock() - t
  print("100000 coolgrid2 get: ", t)
end

-- No coolgrid
do
  local t = os.clock()
  for i=1,100000 do
    g = {}
  end
  t = os.clock() - t
  print("100000 table new: ", t)
end

do
  local g = {}
  local t = os.clock()
  for i=1,100000 do
    g[x + (y * w)] = "test"
  end
  t = os.clock() - t
  print("100000 table set: ", t)
end

do
  local g = {}
  g[x + (y * w)] = "test"
  local t = os.clock()
  for i=1,100000 do
    local _ = g[x + (y * w)]
  end
  t = os.clock() - t
  print("100000 table get: ", t)
end
