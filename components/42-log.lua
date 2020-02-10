
_log_help = function()
  pager({
      {"log: usage:",
       "log list: list log entries",
       "log <n>: read log message n",
       "log all: read all log messages",}
  })
end

_log_list = function()
  list = {}
  page = {}
  for i, k in ipairs(_log_entries) do
    table.insert(page, k["title"])
    if i % (HEIGHT - 1) == 0 then
      table.insert(list, page)
      page = {}
    end
  end
  if page[1] ~= nil then
    -- ensure we print last page
    table.insert(list, page)
  end
  if list == nil then
    digiline_print(d, 'list nil')
  end
  pager(list)
end

_log_display = function(n)
  if n == nil then
    digiline_send(d, 'Invalid log index')
    prompt()
  else
    entry = _log_entries[n]
    if entry == nil then
      digiline_send(d, 'Invalid log index')
      prompt()
    else
      local entry = _log_entries[n]
      pager(entry["pages"], entry["title"])
    end
  end
end


_log_all = function()
  pages = {}
  for _, entry in ipairs(_log_entries) do
    for _, p in ipairs(entry["pages"]) do
      table.insert(pages, p)
    end
  end
  pager(pages)
end

log = function(input, argi)
  arg = input:sub(argi+1)
  if arg == '' then
    _log_help()
  elseif arg == 'list' then
    _log_list()
  elseif arg == 'all' then
    _log_all()
  else
    n = tonumber(arg)
    _log_display(n)
  end
end
