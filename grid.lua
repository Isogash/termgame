local grid = {}

local grid_index = {}

function grid.new(width)
  self = {
    width = width,
  }
  return setmetatable(self, {
    __index = grid_index,
  })
end

function grid_index:get(x, y)
  return self[x + (y*self.width)]
end

function grid_index:set(x, y, value)
  self[x + (y*self.width)] = value
end

return grid
