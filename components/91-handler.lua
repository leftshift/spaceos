
default_handler = _prompt_callback

if event.type == "digiline" then
  if mem.fg == nil then
    default_handler(event.msg)
  else
    _G[mem.fg](event.msg)
  end
end
