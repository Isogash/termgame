return function(width)
  local grid = {}
  return setmetatable({}, {
    __index = function(table, x)
      return setmetatable({}, {
        __index = function(table, y)
          --print("get", x, y, x + (y * width))
          return grid[x + (y * width)]
        end,
        __newindex = function(table, y, value)
          --print("set ", x, y, x + (y * width))
          grid[x + (y * width)] = value
        end,
      })
    end
  })
end
