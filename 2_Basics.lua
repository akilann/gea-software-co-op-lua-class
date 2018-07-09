
-- Variables
x = 7
y = 8
io.read()
print("x is: " .. x)
print("y is: " .. y)

--[[
  C: { code_block }
  Lua: do code_block end
]]--

do
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
local tru = true and true -- C: true && true
print(tru)
io.read()
local fals = false or false -- C: true || false
print(fals)
io.read()
local falsey = nil -- C: NULL
if not falsey then
  print("falsey")
end


-- If/Elseif/Else
io.write("The wheels on the bus... ")
if io.read() ~= "go round and round" then
  io.write("have fallen off, killing the orphans, nuns, and driver onboard.")
end

-- For loops
io.read()
for i = 1,4 do
  print(i)
end
print("I declare a thumb war!")

io.read()
for i = 5,1,-1 do
  print(i)
end
print("Blast off!")

io.read()
for i = 2,8,2 do
  print(i)
end
print("Who do we appreciate?!")

io.read()
for i = 5,1 do
  print("[your favorite expletive here]")
end

-- Explain nil
io.read()
print(i)

-- While loop
-- TODO: Change while loop to explain it
io.read()
local iterate_loop = true
local foo = ""
while #foo < 5 do
  foo = foo .. "ha"
end
print(foo)
