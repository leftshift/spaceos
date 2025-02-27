prompt = function()
  mem.fg = "_prompt_callback"
  digiline_send(d, [[Welcome to spaceOS!
Type 'help' and press 'send'
to get started.
>]])
end

_prompt_callback = function (input)
  cmdi, _ = string.find(input, " ", 1, true)
  if cmdi == nil then
    cmd = input
    cmdi = input:len()
  else
    cmd = input:sub(1, cmdi-1)
  end
  if cmd == "help" then
    help(input, cmdi)
  elseif cmd == "log" then
    log(input, cmdi)
  elseif cmd == "test" then
    test(input, cmdi)
  else
    digiline_send(d, "unknown command. try help")
  end
end
