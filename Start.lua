package.path = package.path .. './lib/?/?.lua'

local program_name = arg[1]
while true do
  if program_name == nil or program_name == '' then
    io.write("Please provide a file name to run or `exit` to quit the program: ")
    program_name = io.read()
    if program_name == 'exit' then break end
  end
  program_name = string.match(program_name, "^%d+_%a+")
  local status = pcall(require, program_name)
  if not status then
    io.write("Invalid file!\n\n")
    program_name = nil
  else
    break
  end
end
