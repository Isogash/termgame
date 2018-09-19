return function(width)
  local grid = {}
  local step = {}
  local x
  setmetatable(step, {
    __index = function(table, y)
      --print("get", x, y, x + (y * width))
      return grid[x + (y * width)]
    end,
    __newindex = function(table, y, value)
      --print("set ", x, y, x + (y * width))
      grid[x + (y * width)] = value
    end,
  })
  return setmetatable({}, {
    __index = function(table, ax)
      x = ax
      return step
    end
  })
end
