-- Main variable types
null = nil
boolean = false
number = 0
string = "a"
table = {}
function typePrinter(name, variable)
  print("Type of " .. name .. ": " .. type(variable))
end

typePrinter("`null`", null) -- Type of `null`: nil
typePrinter("`boolean`", boolean) -- Type of `boolean`: Boolean
typePrinter("`number`", number) -- Type of `number`: number
typePrinter("`string`", string) -- Type of `string`: string
typePrinter("`table`", table) -- Type of `table`: table
typePrinter("`typePrinter`", typePrinter) -- Type of `typePrinter`: function

io.read()
hex = 0xF1
float = 1.01
scientificNotation = 123e-2

print("`hex`: " .. hex) -- Type of `hex`: hex
print("`float`: " ..float) -- Type of `float`: float
print("`scientificNotation`: " .. scientificNotation) -- Type of `scientificNotation`: scientificNotation

io.read()
table = 12345
typePrinter("redefined `table`", table) -- Type of redefined `table`: number

io.read()
num1 = "1"
num2 = "2"
num_result = num1 + num2
typePrinter("`num1`", num1) -- Type of `num1`: string
typePrinter("`num2`", num2) -- Type of `num2`: string
typePrinter("`num_result`", num_result) -- Type of `num_result`: num_result
print(num1 .. " + " .. num2 .. " = " .. num_result) -- 1 + 2 = 3.0

io.read()
num1 = "1"
num2 = 2
num_result = num1 + num2
typePrinter("`num1`", num1) -- Type of `num1`: string
typePrinter("`num2`", num2) -- Type of `num2`: number
typePrinter("`num_result`", num_result) -- Type of `num2`: number
print(num1 .. " + " .. num2 .. " = " .. num_result) -- 1 + 2 = 3.0
