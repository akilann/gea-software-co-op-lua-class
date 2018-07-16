
-- Basic function use
print("------------------ Basic Function Use ------------------")
function ConcatStrings(stringOne, stringTwo)
    return stringOne .. stringTwo
end

function Add(numberOne, numberTwo)
    return numberOne + numberTwo
end

io.read()
local string1 = "Hello, "
local string2 = "world!!"
print("Value of `string1`: " .. string1)
print("Value of `string2`: " .. string2)
print("Value of the concatination: " .. ConcatStrings(string1, string2))

io.read()
local num1 = 1
local num2 = 2
print("Value of `num1`: " .. num1)
print("Value of `num2`: " .. num2)
print("`num1` + `num2` = " .. Add(num1, num2))

-- Store function into a variable and use it as a function call
io.read()
concat = ConcatStrings
print("Type of `ConcatStrings`: " .. type(ConcatStrings))
print("Type of `concat`: " .. type(concat))
print("Result of using `concatStrings` as function call: " .. concat(string1, string2))

io.read()
Printer = print
Printer("`Printer` variable can now print since it was set equal to the `print` function.")

-- Dealing with multiple return values
io.read()
print("------------------ Multiple Return Values ------------------")
function Numbers()
    return 4, 5
end

-- Store multiple return values in a table
io.read()
table = { Numbers() }
print("`table` now contains: ")
for k, v in pairs(table) do
    print("table[" .. k .. "]" .. " = " .. v)
end

-- Store multiple return values into a variable list equal to the number of values returned
io.read()
num1, num2 = Numbers();
print("Value of variables used to store multiple return values: ")
print("`num1` = " .. num1)
print("`num2` = " .. num2)


-- Local vs. Global Functions
io.read()
print("------------------ Local vs. Global Functions ------------------")

-- Example 1: Calling a local function outside of it's scope
io.read()
print("# Example 1: Calling a local function outside of it's scope #")
io.read()

do
    local function Subtract(numberOne, numberTwo)
        return numberOne - numberTwo
    end
 
    print("Result of `Subtract` called within local scope: " .. Subtract(10, 5))
    print("Type of `Subtract` within local scope: " .. type(Subtract))
end

io.read()
print("`Subtract` cannot outside of local scope.")
print("Type of `Subtract` outise of local scope: " .. type(Subtract))

-- Example 2: Local versus global scoping of functions
io.read()
print("# Example 2: Local versus global scoping of functions #")
io.read()

function Multiply(number1, number2)
    return number1 * number2
end

do
    local function Multiply(numberOne, numberTwo)
        return numberOne * numberTwo * 100
    end

    -- Uses local definition of Multiply
    print("Result of calling `Multiply` function within local scope: " .. Multiply(10, 20))
end

-- Uses global definition of Multiply
io.read()
print("Result of calling `Multiply` function outside of local scope: " .. Multiply(10, 20))

-- Example 3: Redefining a global function within a local scope
io.read()
print("# Example 3: Redefining a global function within a local scope #")
io.read()
function Divide(numberOne, numberTwo)
    return numberOne / numberTwo
end

do
    print("`Divide` before redefinition: " .. Divide(10, 5))

    function Divide(numberOne, numberTwo)
        return "global `Divide` has been redefined"
    end

    io.read()
    print("`Divide` after redefinition called within local scope: " .. Divide(10, 5))
end

io.read()
print("`Divide` after redefinition called outside of local scope: " .. Divide(10, 5))

-- Example 4: Creating a global function in a local scope
io.read()
print("# Example 4: Creating a global function in a local scope #")

do
    function typePrinter(name, variable)
        print("Type of " .. name .. ": " .. type(variable))
    end
end

io.read()
io.write("Calling `typePrinter` outside of local scope: ")
typePrinter("typePrinter", typePrinter)
