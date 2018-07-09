local inspect = require "inspect".inspect

local empty_table = {}
local array = { 1, 2, 3, 4, "apple" }
local keyed_table = { a = 1, b = 2, giraffe = 'yes', "leaves" }
local mixed_table = { alpha = "a", beta = "b", "c", "d", "e", "f", gamma = "g"}
local tableception = { keyed_table, array, empty_table }

io.read()
print(inspect(empty_table))
io.read()
print(inspect(array))
io.read()
print(inspect(keyed_table))
io.read()
print(inspect(tableception))

-- Empty Table
io.read()
print(inspect(empty_table))

io.read()
table.insert(empty_table, 1)
print(inspect(empty_table))
table.insert(empty_table, 3)
print(inspect(empty_table))
table.insert(empty_table, 2, 2)
print(inspect(empty_table))
table.insert(empty_table, 3, "orange")
print(inspect(empty_table))

-- Array
io.read()
table.remove(array, 4)
print(inspect(array))
print(array[4])
io.read()
array[1] = nil
print(inspect(array))

-- Keyed Table
io.read()
keyed_table["key"] = "lock"
keyed_table.unlock = "Alohamora"
keyed_table["giraffe"] = nil
print(inspect(keyed_table))
io.read()
print(keyed_table["ghost"])

-- Mixed table
io.read()
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
