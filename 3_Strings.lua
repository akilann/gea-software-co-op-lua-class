io.read()
print("Basic String Operations")

-- Basic string operations
local string1 = "Hello, "
local string2 = "World!"
local result = string1 .. string2

print("Result is: \"" .. result .. '"') -- Result is: Hello, World!

io.read()

print(result .. " is " .. #result .. " characters long.") -- Hello, World! is 13 characters long

-- String library
local test_string = "Abcdef"

io.read()
print("string.byte")

print(string.byte(test_string)) -- 65
print(string.byte(test_string, 4)) -- 100
print(string.byte(test_string, 2, 4)) -- 98   99   100

local first, second = string.byte(test_string, 1, 2)
print("First: " .. first .. " and second: " .. second) -- First: 65 and second: 98

io.read()
print("string.char")

print(string.char(97, 98, 99, 100, 101, 102)) -- "abcdef"

io.read()
print("string.find")

--    index:   1 3                           32 34
test_string = "the quick brown fox jumps over the lazy dog"

print(string.find(test_string, "the")) -- 1   3
print(string.find(test_string, "the", 4)) -- 32   34
print(string.find(test_string, "the", -15)) -- 32  34
print(string.find(test_string, "the", -3)) -- nil

io.read()
print("string.format")

print(string.format("%s %.10f", "Pi is:", math.pi)) -- Pi is: 3.1415926536

io.read()
print("string.gmatch")

for match in string.gmatch(test_string, "the[%a ]-o") do
  print(match)
end
--[[
the quick bro
the lazy do
]]

io.read()
print("string.gsub")

test_string = "The Ohio State University"
print("Original: " .. test_string) -- Original: The Ohio State University
print("Modified: " .. string.gsub(test_string, "The", "THE")) -- Modified: THE Ohio State University

io.read()
print("string.len")

print(test_string .. " is " .. string.len(test_string) .. " characters long.") -- The Ohio State University is 25 characters long.

io.read()
print("string.upper")

print(string.upper(test_string)) -- THE OHIO STATE UNIVERSITY

print("string.lower")

print(string.lower(test_string)) -- the ohio state university

io.read()
print("string.match")

print(string.match(test_string, "%a+e%a+")) -- University

io.read()
print("string.sub")

print(string.sub(test_string, 5)) -- Ohio State University
print(string.sub(test_string, 5, 8)) -- Ohio
print(string.sub(test_string, -10)) -- University
print(string.sub(test_string, -4, -2)) -- sit

io.read()
print("string.rep")

print(string.rep("Gucci Gang ", 4)) -- Gucci Gang Gucci Gang Gucci Gang Gucci Gang
print(string.rep("Gucci Gang\n", 3))
--[[
Gucci Gang
Gucci Gang
Gucci Gang
]]

io.read()
print("string.reverse")

print(string.reverse("Murder for a jar of red rum.")) -- .mur der fo raj a rof redruM
print(string.reverse("malayalam")) -- malayalam
