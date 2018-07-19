-- Variables
io.read()
print("Variables")

-- Variables are global by default
x = 7
y = 8
print("x is: " .. x) -- x is: 7
print("y is: " .. y) -- y is: 8

--[[
  C: { code_block }
  Lua: do code_block end
]]

do
  -- Must explicitly declare local variable
  -- Local variable takes precedence over global variable with same name
  local x = 21
  y = 22

  io.read()

  print("x is now: " .. x) -- x is now: 21
  print("y is now: " .. y) -- y is now: 22
end

io.read()

print("x is finally: " .. x) -- x is finally: 7
print("y is finally: " .. y) -- y if finally: 22

-- Boolean operations
io.read()
print("\nBooleans")

local tru = true and true -- C: true && true
print("tru: " .. tostring(tru)) -- tru: true

io.read()
local fals = false or false -- C: true || false
print("fals: " .. tostring(fals)) -- fals: false

io.read()
local falsey = nil -- C: NULL
print("not falsey: " .. tostring(not falsey)) -- not falsey: true (C: !falsey <=> Lua: not falsey)

io.read()
local notequal = falsey
print("notequal: " .. tostring(true ~= notequal)) -- notequal: true

-- For loops
io.read()
print("\nfor loop")

--[[
  C: for (int i = a; i <= b; i += c) { }
  Lua: for i = a,b,c do end
]]

print("\nLoop 1")
io.read()
for i = 1,4 do
  print(i)
end
print("I declare a thumb war!")
--[[
1
2
3
4
I declare a thumb war!
]]

print("\nLoop 2")
io.read()
for i = 5,1,-1 do
  print(i)
end
print("Blast off!")
--[[
5
4
3
2
1
Blast off!
]]

print("\nLoop 3")
io.read()
for i = 2,8,2 do
  print(i)
end
print("Who do we appreciate?!")
--[[
2
4
6
8
Who do we appreciate?!
]]

print("\nLoop 4")
io.read()
for i = 5,1,1 do
  print("[your favorite expletive here]")
end
--[[

]]

-- i is only in the scope of the for loops
io.read()
print("i: " .. tostring(i)) -- i: nil

-- While loop
io.read()
print("\nwhile loop")

--[[
  C: while (condition) { }
  Lua: while condition do end
]]

local foo = ""
while #foo <= 5 do
  foo = foo .. "ha"
end
print(foo) -- hahaha

local bar = ""
repeat
  io.write("ha")
until true -- ha

io.read()
print("\nif/elseif/else")

for i = 1,3 do
  io.write("The wheels on the orphan bus... ")

  local input = io.read()

  if input == "go round and round" then
    print("The bus safely makes it to the orphanage.")
  elseif input == "come to a stop" then
    print("The bus stops to pick up more lost orphans.")
  else
    print("The bus crashes and burns.")
  end
end
--[[
The wheels on the orphan bus... go round and round
The bus safely makes it to the orphanage.
The wheels on the orphan bus... come to a stop
The bus stops to pick up more lost orphans.
The wheels on the orphan bus... fall off
The bus crashes and burns.
]]
