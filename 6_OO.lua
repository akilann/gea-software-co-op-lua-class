-- Metatables http://lua-users.org/wiki/MetatableEvents
-- Basic Metatables
print("Basic Metatables") -- TODO

-- Basic Classes using Metatables
print("Basic Classes using Metatables")

local Fruit = {}
Fruit.__index = Fruit

local Fruit_mt = {
  __call = function()
    local food_instance = { amount_left_pct = 100 }
    return setmetatable(food_instance, Fruit)
  end
}

setmetatable(Fruit, Fruit_mt)

function Fruit:bite(amount_to_bite)
  self.amount_left_pct = self.amount_left_pct - amount_to_bite
end

function Fruit:shove_it_down()
  self.amount_left_pct = 0
end

function Fruit:amount_left()
  return self.amount_left_pct
end

local apple = Fruit()

io.read()
print("Amount left: " .. apple:amount_left())

io.read()
apple:bite(10)
print("Amount left: " .. apple:amount_left())

io.read()
apple:bite(50)
print("Amount left: " .. apple:amount_left())

io.read()
apple:shove_it_down()
print("Amount left: " .. apple:amount_left())

local Apple = {}
Apple.__index = Fruit -- Superclass (Base class)

setmetatable(Apple, {
  __call = function(cls, color, taste, has_worm)
    print(require 'inspect'.inspect(cls))
    local apple_instance = setmetatable({
        _color = color,
        _taste = taste,
        _has_worm = false
      },
      cls)
    return setmetatable(apple_instance, Apple)
  end
})

function Apple:decompose()
  if self.amount_left_pct > 10 then
    self._color = "brown"
    self._taste = "disgusting"
    self._has_worm = true
  end
end

function Apple:color(color)
  self._color = color or self._color
  return self._color
end

function Apple:taste(taste)
  self._taste = taste or self._taste
  return self._taste
end

function Apple:has_worm(has_worm)
  self._has_worm = has_worm or self._has_worm
  return self._has_worm
end

local apple1 = Apple("green", "sour", false)
print(require 'inspect'.inspect(apple1))
io.read()
-- print("Amount left: " .. apple1:amount_left())
print("Color: " .. apple1:color())
print("Taste: " .. apple1:taste())
print("Has worm: " .. apple1:has_worm())
