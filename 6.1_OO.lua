local inspect = require 'inspect'.inspect

-- Metatables http://lua-users.org/wiki/MetatableEvents
-- Basic Metatables
io.read()
print("Basic Metatables")

local fruits = {
  apple = "red",
  orange = "orange",
  banana = "yellow"
}

local more_fruits = {
  strawberry = "red",
  peach = "peach"
}

local fruits_mt = {
  __index = more_fruits,
  __add = function(left, right) return "Fruit salad. Yummy, yummy." end
}

io.read()
io.write("Strawberry before metatable: ")
print(fruits["strawberry"]) -- nil

io.read()
print("Fruits iteration before metatable:")
for fruit,color in pairs(fruits) do
  print(fruit .. ": " .. color)
end
--[[
apple: red
orange: orange
banana: yellow
]]

setmetatable(fruits, fruits_mt)

io.read()
io.write("Strawberry after metatable: ")
print(fruits["strawberry"]) -- red

io.read()
print("Fruits iteration after metatable:")
for fruit,color in pairs(fruits) do
  print(fruit .. ": " .. color)
end
--[[
apple: red
orange: orange
banana: yellow
]]

io.read()
print("Add fruits")
print(fruits + fruits)

-- Basic Classes using Metatables
io.read()
print("Basic Classes using Metatables")

local Fruit = {}
Fruit.__index = Fruit

local Fruit_mt = {
  __call = function(cls)
    local self = {
      _private = {
        amount_left_pct = 100
      }
    }
    return setmetatable(self, cls)
  end
}

io.read()
print("Fruit class after __index is set: " .. inspect(Fruit))

setmetatable(Fruit, Fruit_mt)

io.read()
print("Fruit class after setmetatable: " .. inspect(Fruit))

function Fruit.amount_left(self)
  return self._private.amount_left_pct
end

io.read()
print("Fruit class after instance method amount_left is set: " .. inspect(Fruit))

function Fruit:bite(amount_to_bite)
  self._private.amount_left_pct = self._private.amount_left_pct - amount_to_bite
end

io.read()
print("Fruit class after instance method bite is set: " .. inspect(Fruit))

function Fruit:shove_it_down()
  self._private.amount_left_pct = 0
end

io.read()
print("Fruit class after instance method shove_it_down is set: " .. inspect(Fruit))

function Fruit:throw_away()
  if self._private.amount_left_pct < 10 then self._private.amount_left_pct = 0 end
end

io.read()
print("Fruit class after instance method throw_away is set: " .. inspect(Fruit))

function Fruit:__tostring()
  return "Amount Left: " .. self._private.amount_left_pct
end

io.read()
print("Fruit class after instance method __tostring is set: " .. inspect(Fruit))

local fruit = Fruit()

io.read()
print("fruit instance: " .. inspect(fruit))

io.read()
print(tostring(fruit))

io.read()
Fruit.bite(fruit, 10)
print(tostring(fruit))

io.read()
fruit:bite(85)
print(tostring(fruit))

io.read()
fruit:shove_it_down()
print(tostring(fruit))

fruit:throw_away()
io.read()
print(tostring(fruit))

-- Inheritance
io.read()
print("Inheritance")

local function super_constructor(cls)
  return getmetatable(getmetatable(cls).__index).__call()
end

local Apple = {}
Apple.__index = Apple

local Apple_mt = {
  __index = Fruit,
  __call = function(cls, color, taste, has_worm)
    local self = super_constructor(cls)

    self._private.color = color or "red"
    self._private.taste = taste or "sweet"
    self._private.has_worm = has_worm or false

    return setmetatable(self, cls)
  end
}

io.read()
print("Apple class after __index is set: " .. inspect(Apple))

setmetatable(Apple, Apple_mt)

io.read()
print("Apple class after setmetatable: " .. inspect(Apple))

local super_throw_away = Apple.throw_away
function Apple:throw_away()
  super_throw_away(self)
  self._private.color = "brown"
  self._private.taste = "disgusting"
  self._private.has_worm = true
end

io.read()
print("Apple class after instance method throw_away is set: " .. inspect(Apple))

function Apple:color(color)
  self._private.color = color or self._private.color
  return self._private.color
end

io.read()
print("Apple class after instance method color is set: " .. inspect(Apple))

function Apple:taste(taste)
  self._private.taste = taste or self._private.taste
  return self._private.taste
end

io.read()
print("Apple class after instance method taste is set: " .. inspect(Apple))

function Apple:has_worm(has_worm)
  self._private.has_worm = has_worm or self._private.has_worm
  return self._private.has_worm
end

io.read()
print("Apple class after instance method has_worm is set: " .. inspect(Apple))

local super_tostring = Apple.__tostring
function Apple:__tostring()
  local str = super_tostring(self) .. "\n"
  str = str .. "Color: " .. self._private.color .. "\n"
  str = str .. "Taste: " .. self._private.taste .. "\n"
  str = str .. "Has worm: " .. tostring(self._private.has_worm) .. "\n"
  return str
end

io.read()
print("Apple class after instance method __tostring is set: " .. inspect(Apple))

local apple = Apple()

io.read()
print(inspect(apple))

io.read()
print(tostring(apple))

io.read()
apple:color("yellow")
apple:taste("tart")
apple:bite(10)
print(tostring(apple))

io.read()
apple:bite(85)
print(tostring(apple))

io.read()
apple:shove_it_down()
print(tostring(apple))

apple:throw_away()
io.read()
print(tostring(apple))
