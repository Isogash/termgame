local coolgrid = require("coolgrid")
local coolgrid2 = require("coolgrid2")

local w = 1000
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
    g[math.random(0,1000)][math.random(0,1000)] = "test"
  end
  t = os.clock() - t
  print("100000 coolgrid set: ", t)
end

do
  local g = coolgrid(w)
  g[x][y] = "test"
  local t = os.clock()
  for i=1,100000 do
    local _ = g[math.random(0,1000)][math.random(0,1000)]
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
    g[math.random(0,1000)][math.random(0,1000)] = "test"
  end
  t = os.clock() - t
  print("100000 coolgrid2 set: ", t)
end

do
  local g = coolgrid2(w)
  --g[math.random(0,1000)][math.random(0,1000)] = "test"
  local t = os.clock()
  for i=1,100000 do
    local _ = g[math.random(0,1000)][math.random(0,1000)]
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
    g[math.random(0,1000) + (math.random(0,1000) * w)] = "test"
  end
  t = os.clock() - t
  print("100000 table set: ", t)
end

do
  local g = {}
  --g[x + (y * w)] = "test"
  local t = os.clock()
  for i=1,100000 do
    local _ = g[math.random(0,1000) + (math.random(0,1000) * w)]
  end
  t = os.clock() - t
  print("100000 table get: ", t)
end


--    ###     ######   ########  #### ########
--   ## ##   ##    ##  ##     ##  ##  ##     ##
--  ##   ##  ##        ##     ##  ##  ##     ##
-- ##     ## ##   #### ########   ##  ##     ##
-- ######### ##    ##  ##   ##    ##  ##     ##
-- ##     ## ##    ##  ##    ##   ##  ##     ##
-- ##     ##  ######   ##     ## #### ########


local agrid = require("agrid")
do
  local t = os.clock()
  for i=1,100000 do
    g = agrid(2)
  end
  t = os.clock() - t
  print("100000 agrid new: ", t)
end

do
  local g = agrid(2)
  local t = os.clock()
  for i=1,100000 do
    g[math.random(0,1000)][math.random(0,1000)] = "test"
  end
  t = os.clock() - t
  print("100000 agrid set: ", t)
end

do
  local g = agrid(2)
  --g[x][y] = "test"
  local t = os.clock()
  for i=1,100000 do
    local _ = g[math.random(0,1000)][math.random(0,1000)]
  end
  t = os.clock() - t
  print("100000 agrid get: ", t)
end



local z = 1

local agrid = require("agrid")
do
  local t = os.clock()
  for i=1,100000 do
    g = agrid(3)
  end
  t = os.clock() - t
  print("100000 a3dgrid new: ", t)
end

do
  local g = agrid(3)
  local t = os.clock()
  for i=1,100000 do
    g[math.random(0,1000)][math.random(0,1000)][math.random(0,1000)] = "test"
  end
  t = os.clock() - t
  print("100000 a3dgrid set: ", t)
end

do
  local g = agrid(3)
  --g[x][y][z] = "test"
  local t = os.clock()
  for i=1,100000 do
    local _ = g[math.random(0,1000)][math.random(0,1000)][math.random(0,1000)]
  end
  t = os.clock() - t
  print("100000 a3dgrid get: ", t)
end
