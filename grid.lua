local grid = {}

local grid_index = {}

function grid.new(width, height)
  self = {
    width = width,
    height = height,
  }
  return setmetatable(self, {
    __index = grid_index,
  })
end

function grid_index:get(x, y)
  return self[x + (y*height)]
end

function grid_index:set(x, y, value)
  self[x + (y*height)] = value
end

return grid
