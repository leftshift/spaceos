
default_handler = _prompt_callback

handle_input = function(input)
  out_buffer = {}

  if mem.fg == nil then
    default_handler(input)
  else
    _G[mem.fg](input)
  end

  return table.concat(out_buffer, "\n")
end
