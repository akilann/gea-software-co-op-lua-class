-- Basic string operations
local string1 = "Hello, "
local string2 = "World!"
local result = string1 .. string2

io.read()

print("Result is: \"" .. result .. '"')

io.read()

print(result .. " is " .. #result .. " characters long.")

-- String library
local alpha = "abcdef"
local test_string = "the quick brown fox jumps over the lazy dog"

io.read()
print("string.byte")

print(string.byte(alpha))
print(string.byte(alpha, 4))
print(string.byte(alpha, 2, 3))

io.read()
print("string.char")

print(string.char(97, 98, 99, 100, 101, 102))

io.read()
print("string.find")

print(string.find(test_string, "the"))
print(string.find(test_string, "the", 4))
print(string.find(test_string, "the", -15))

io.read()
print(string.format("%s %.10f", "Pi is:", math.pi))

io.read()
for word in string.gmatch(test_string, "fox.*dog") do
  print(word)
end
print()
-- string.gsub
-- string.len -- # operator
-- string.upper
-- string.lower
-- string.match
-- string.sub
-- string.rep
-- string.reverse
