-- Main variable types
null = nil
boolean = false
number = 0
string = "a"
table = {}
function type_printer(name, variable)
  print("Type of " .. name .. ": " .. type(variable))
end

type_printer("`null`", null) -- Type of `null`: nil
type_printer("`boolean`", boolean) -- Type of `boolean`: Boolean
type_printer("`number`", number) -- Type of `number`: number
type_printer("`string`", string) -- Type of `string`: string
type_printer("`table`", table) -- Type of `table`: table
type_printer("`type_printer`", type_printer) -- Type of `type_printer`: function

io.read()
hex = 0xF1
float = 1.01
scientificNotation = 123e-2

print("`hex`: " .. hex) -- Type of `hex`: hex
print("`float`: " ..float) -- Type of `float`: float
print("`scientificNotation`: " .. scientificNotation) -- Type of `scientificNotation`: scientificNotation

io.read()
table = 12345
type_printer("redefined `table`", table) -- Type of redefined `table`: number

io.read()
num1 = "1"
num2 = "2"
num_result = num1 + num2
type_printer("`num1`", num1) -- Type of `num1`: string
type_printer("`num2`", num2) -- Type of `num2`: string
type_printer("`num_result`", num_result) -- Type of `num_result`: number
print(num1 .. " + " .. num2 .. " = " .. num_result) -- 1 + 2 = 3.0

io.read()
num1 = "1"
num2 = 2
num_result = num1 + num2
type_printer("`num1`", num1) -- Type of `num1`: string
type_printer("`num2`", num2) -- Type of `num2`: number
type_printer("`num_result`", num_result) -- Type of `num_result`: number
print(num1 .. " + " .. num2 .. " = " .. num_result) -- 1 + 2 = 3.0
