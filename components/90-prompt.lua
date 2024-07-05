prompt = function()
  mem.fg = "_prompt_callback"
  write_line([[Welcome to spaceOS!
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
  elseif cmd == "nav" then
    nav(input, cmdi)
  elseif cmd == "power" then
    power(input, cmdi)
  elseif cmd == "log" then
    log(input, cmdi)
  elseif cmd == "prompt" then
    -- just show initial prompt
    prompt()
  else
    write_line("unknown command. try help")
  end
end
