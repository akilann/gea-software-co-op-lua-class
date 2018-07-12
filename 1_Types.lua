-- Main variable types
null
boolean = false
number = 0
string = "a"
table = {}
function typePrinter(name, variable)
  print("Type of " .. name .. ": " .. type(variable))
end

typePrinter("`null`", null)
typePrinter("`boolean`", boolean)
typePrinter("`number`", number)
typePrinter("`string`", string)
typePrinter("`table`", table)
typePrinter("`typePrinter`", typePrinter)

io.read()
table = 12345
typePrinter("redefined `table`", table)

io.read()
num1 = "1"
num2 = "2"
num_result = num1 + num2
typePrinter("`num1`", num1)
typePrinter("`num2`", num2)
typePrinter("`num_result`", num_result)
print(num1 .. " + " .. num2 .. " = " .. num_result)

io.read()
num1 = "1"
num2 = 2
num_result = num1 + num2
typePrinter("`num1`", num1)
typePrinter("`num2`", num2)
typePrinter("`num_result`", num_result)
print(num1 .. " + " .. num2 .. " = " .. num_result)
