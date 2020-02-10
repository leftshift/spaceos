-- ## pager
-- uses mem.pg namespace

string.rpad = function(str, len, char)
    if char == nil then char = ' ' end
    return string.rep(char, len - #str) .. str
end

-- clear display
clear = function()
  digiline_send(d, "\n")
end


_pg_callback = function(input)
  if mem.pg.done then
    if input == 'n' or input == 'q' then
      prompt()
    else
      -- accept command when on last page
      _prompt_callback(input)
    end
  elseif input == 'n' then
    _pg_page()
  else
    prompt()
  end
end

_pg_page = function()
  local page = mem.pg.pages[mem.pg.cur]
  mem.pg.cur = mem.pg.cur + 1
  if mem.pg.pages[mem.pg.cur] == nil then
    mem.pg.done = true
  end
  if mem.pg.done == true then
    hint = "[q: quit]"
  else
    hint = '[n: next/q: quit]'
  end
  
  if mem.pg.title ~= nil then
    table.insert(page, 1, mem.pg.title)
  end

  local output = ""
  for i, line in ipairs(page) do
    sep = "\n"
    if line:len() == WIDTH then
        sep = ""
    end
    output = output .. line .. sep
  end

  local padding = string.rep("\n", HEIGHT - #page - 1)

  output = output .. padding ..hint:rpad(WIDTH)
  digiline_send(d, output)
end

-- interactively page through provided input (somewhat like the 'more' command)
-- arguments:
--   pages: table of pages
--     page: table of lines, of which none is longer than WIDTH, no more than HEIGHT - 1 lines, HEIGHT - 2 if title is given
--   title: optional title. No longer than WIDTH
-- this is pretty annoying to use but means low amounts of function
-- calls to keep the sandbox happy.
-- 
-- Note: All lines need to be <= WIDTH chars.
pager = function(pages, title)
  clear()
  mem.fg = "_pg_callback"
  mem.pg = {}
  mem.pg.pages = pages
  mem.pg.title = title
  mem.pg.cur = 1
  _pg_page()
end
