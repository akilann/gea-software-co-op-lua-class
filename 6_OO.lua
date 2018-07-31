local inspect = require "lib.inspect.inspect".inspect

-- Closures
print("Closure based classes")

local function Fruit()
  local self = {
    _private = {
      amount_left_pct = 100
    }
  }

  function self.bite(amount_to_bite)
    self._private.amount_left_pct = self._private.amount_left_pct - amount_to_bite
  end

  function self.shove_it_down()
    self._private.amount_left_pct = 0
  end

  function self.throw_away()
    if self._private.amount_left_pct < 10 then self._private.amount_left_pct = 0 end
  end

  function self.amount_left()
    return self._private.amount_left_pct
  end

  function self.tostring()
    return "Amount left: " .. self._private.amount_left_pct
  end

  return self
end

local fruit = Fruit()

io.read()
print("Fruit instance: " .. inspect(fruit))

io.read()
print(fruit.tostring())

io.read()
fruit.bite(10)
print(fruit.tostring())

io.read()
fruit.bite(50)
print(fruit.tostring())

io.read()
fruit.shove_it_down()
print(fruit.tostring())

io.read()
fruit.throw_away()
print(fruit.tostring())

-- Inheritance
io.read()
print("Inheritance")

local function Apple(color, taste, has_worm)
  local self = Fruit()

  self._private.color = color or "red"
  self._private.taste = taste or "sweet"
  self._private.has_worm = has_worm or false
  -- "red", "sweet", and false are used as default values

  local super_throw_away = self.throw_away
  function self.throw_away()
    super_throw_away()
    if self._private.amount_left_pct < 10 then
      self._private.color = "brown"
      self._private.taste = "disgusting"
      self._private.has_worm = true
    end
  end

  function self.color(color)
    self._private.color = color or self._private.color
    return self._private.color
  end

  function self.taste(taste)
    self._private.taste = taste or self._private.taste
    return self._private.taste
  end

  function self.has_worm(has_worm)
    self._private.has_worm = has_worm or self._private.has_worm
    return self._private.has_worm
  end

  local super_tostring = self.tostring
  function self.tostring()
    local str = super_tostring() .. "\n"
    str = str .. "Color: " .. self._private.color .. "\n"
    str = str .. "Taste: " .. self._private.taste .. "\n"
    str = str .. "Has worm: " .. tostring(self._private.has_worm) .. "\n"

    return str
  end

  return self
end

local closure_apple = Apple("green", "sour", false)

io.read()
print("Apple instance: " .. inspect(closure_apple))

io.read()
print(closure_apple.tostring())

closure_apple.color("yellow")
closure_apple.taste("tart")
closure_apple.bite(95)

io.read()
print(closure_apple.tostring())

closure_apple.throw_away()

io.read()
print(closure_apple.tostring())
