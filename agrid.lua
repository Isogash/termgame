local function grid(n)
  if n < 2 then return {} end
  return setmetatable({}, {
    __index = function(table, key)
      local t = grid(n-1)
      table[key] = t
      return t
    end
  })
end
return grid
