local inspect = require "inspect".inspect -- LuaRocks

local empty_table = {}
local array = { 1, 2, 3, 4, "apple" }
local keyed_table = { a = 1, b = 2, giraffe = true }
local mixed_table = { alpha = "a", beta = "b", "c", "d", "e", "f", gamma = "g"}
local tableception = { keyed_table, array, empty_table }

-- Array
io.read()
print("Arrays")
print("`array`: " .. inspect(array)) -- { 1, 2, 3, 4, "apple" }

io.read()
print("`array[1]`: " .. array[1]) -- 1

io.read()
table.remove(array, 4)
print("`array`: " .. inspect(array)) -- { 1, 2, 3, "apple" }

io.read()
print(array[4]) -- apple

io.read()
array[1] = nil
print(inspect(array))
--[[
{
  [2] = 2,
  [3] = 3,
  [4] = "apple"
}
]]

-- Tables
io.read()
print("empty_table")
print(inspect(empty_table)) -- {}

io.read()
table.insert(empty_table, 1)
print(inspect(empty_table)) -- { 1 }

io.read()
table.insert(empty_table, 3)
print(inspect(empty_table)) -- { 1, 3 }

io.read()
table.insert(empty_table, 2, 2) -- { 1, 2, 3 }
print(inspect(empty_table))

io.read()
table.insert(empty_table, 3, "orange")
print(inspect(empty_table)) -- { 1, 2, "orange", 3 }

-- Keyed Table
io.read()
print("Keyed table")
print(inspect(keyed_table))
--[[
{
  a = 1,
  b = 2,
  giraffe = true
}
]]

io.read()
keyed_table["key"] = "lock"
keyed_table.unlock = "Alohamora"
keyed_table._valid_key_123 = "I'm a valid key"
local function_key = function() end
keyed_table[function_key] = "I'm a function"
keyed_table.imafunction = function() end
keyed_table["giraffe"] = nil
print(inspect(keyed_table))
--[[
{
  _valid_key_123 = "I'm a valid_key",
  a = 1,
  b = 2,
  imafunction = <function 1>,
  key = "lock",
  unlock = "Alohamora",
  [<function 2>] = "I'm a function"
}
]]

local key = "unlock"
io.read()
print("local key = \"unlock\"")
print("[key]: " .. keyed_table[key]) -- [key]: Alohamora
print(".key: " .. keyed_table.key) -- .key: lock
io.write("[\"ghost\"]: ")
print(keyed_table["ghost"]) -- [ghost]: nil
io.write(".ghost: ")
print(keyed_table.ghost) -- .ghost: nil

-- Mixed table
io.read()
print("Mixed table")
print(inspect(mixed_table))

io.read()
-- c is thrown away since the array index that it is assigned to is overwritten by the preceding array entries
mixed_table = { alpha = "a", beta = "b", [1] = "c", "d", "e", "f", gamma = "g"}
print(inspect(mixed_table))
io.read()
mixed_table = { alpha = "a", beta = "b", [2] = "c", "d", "e", "f", gamma = "g"}
print(inspect(mixed_table))
io.read()
mixed_table = { alpha = "a", beta = "b", [3] = "c", "d", "e", "f", gamma = "g"}
print(inspect(mixed_table))
io.read()
-- c will be in the table since it is outside the range of array indices
mixed_table = { alpha = "a", beta = "b", [4] = "c", "d", "e", "f", gamma = "g"}
print(inspect(mixed_table))
io.read()
-- Overwrite memory at index 1. This will not model behavior above since the change is not at initialization
mixed_table = { alpha = "a", beta = "b", "c", "d", "e", "f", gamma = "g"}
mixed_table[1] = "a"
print(inspect(mixed_table))
io.read()

-- Iterating through arrays and tables
io.read()
print("Iteration")

io.read()
print("ipairs\n")

io.read()
print("empty_table: " .. inspect(empty_table))

io.read()
print("empty_table iteration\n")
for i,v in ipairs(empty_table) do
  print("index: " .. i .. " value: " .. v)
end
print("\nend empty_table iteration\n")

io.read()
print("array: " .. inspect(array))

io.read()
print("array iteration\n")
for i,v in ipairs(array) do
  print("index: " .. i .. " value: " .. v)
end
print("\nend array iteration\n")

io.read()
print("pairs")

io.read()
print("keyed_table: " .. inspect(keyed_table))

io.read()
print("keyed_table iteration\n")
for k,v in pairs(keyed_table) do
  print("key: " .. tostring(k) .. " value: " .. tostring(v))
end
print("\nend keyed_table iteration\n")

io.read()
print("array: " .. inspect(array))

io.read()
print("array iteration\n")
for i,v in pairs(array) do
  print("index: " .. i .. " value: " .. v)
end
print("\nend array iteration\n")
