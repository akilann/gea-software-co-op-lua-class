local null = nil
local boolean = false
local number = 0
local string = "a"
local table = {}
local function typePrinter(name, variable)
  print(name .. ": " .. type(variable))
end

typePrinter("`null`", null)
typePrinter("`boolean`", boolean)
typePrinter("`number`", number)
typePrinter("`string`", string)
typePrinter("`table`", table)
typePrinter("`typePrinter`", typePrinter)

io.read()
table = 12345
typePrinter("redefine `table`", table)
