
-- Variables
io.read()
print("Variables")

-- Variables are global by default
x = 7
y = 8
print("x is: " .. x)
print("y is: " .. y)

--[[
  C: { code_block }
  Lua: do code_block end
]]--

do
  -- Must explicitly declare local variable
  -- Local variable takes precedence over global variable with same name
  local x = 21
  y = 22
  io.read()

  print("x is now: " .. x)
  print("y is now: " .. y)
end

io.read()

print("x is finally: " .. x)
print("y is finally: " .. y)

-- Boolean operations
io.read()
print("\nBooleans")

local tru = true and true -- C: true && true
print("tru: " .. tostring(tru))

io.read()
local fals = false or false -- C: true || false
print("fals: " .. tostring(fals))

io.read()
local falsey = nil -- C: NULL
print("not falsey: " .. tostring(not falsey)) -- C: !falsey

io.read()
local notequal = falsey
print("notequal: " .. tostring(true ~= notequal))

-- For loops
io.read()
print("\nfor loop")

--[[
  C: for (int i = a; i <= b; i += c) { }
  Lua: for i = a,b,c do end
]]--

print("\nLoop 1")
io.read()
for i = 1,4 do
  print(i)
end
print("I declare a thumb war!")

print("\nLoop 2")
io.read()
for i = 5,1,-1 do
  print(i)
end
print("Blast off!")

print("\nLoop 3")
io.read()
for i = 2,8,2 do
  print(i)
end
print("Who do we appreciate?!")

print("\nLoop 4")
io.read()
for i = 5,1,1 do
  print("[your favorite expletive here]")
end

-- i is only in the scope of the for loops
io.read()
print("i: " .. tostring(i))

-- While loop
io.read()
print("\nwhile loop")

--[[
  C: while (condition) { }
  Lua: while condition do end
]]--

local iterate_loop = true
local foo = ""
while #foo < 5 do
  foo = foo .. "ha"
end
print(foo)

io.read()
print("\nif/elseif/else")

for i = 1,3 do

  -- if/elseif/else
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
