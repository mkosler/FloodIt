local function contains(x, y, l, t, r, b)
  return l <= x and x <= r and t <= y and y <= b
end

local ORIENTATION = {
  VERTICAL   = 0,
  HORIZONTAL = 1,
}

return {
  contains    = contains,
  ORIENTATION = ORIENTATION,
}
