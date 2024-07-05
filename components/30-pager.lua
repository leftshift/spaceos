-- ## pager
-- uses mem.pg namespace

target = 'js'

string.rpad = function(str, len, char)
    if char == nil then char = ' ' end
    return string.rep(char, len - #str) .. str
end

-- clear display
clear = function()
  write_line("\n")
end


_pg_callback = function(input)
  if input == 'n' then
    if mem.pg.done then
      if mem.pg.meta then
        if mem.pg.meta_done then
            prompt()
        else
            _pg_meta_page()
        end
      else
        prompt()
      end
    else
      _pg_page()
    end
  elseif input == 'q' then
    prompt()
  elseif input == 's' then
    _pg_meta_page()
  elseif mem.pg.done and not mem.pg.meta then
    -- accept command when on last page
    _prompt_callback(input)
  end
end

_pg_page = function()
  local page = mem.pg.pages[mem.pg.cur]
  mem.pg.cur = mem.pg.cur + 1
  if mem.pg.pages[mem.pg.cur] == nil then
    mem.pg.done = true
  end

  local hint = ''
  if not mem.pg.done or (mem.pg.meta == true and not mem.pg.meta_done) then
    hint = hint .. 'n: next/'
  end
  if mem.pg.meta and not mem.pg.meta_done and not mem.pg.done then
    hint = hint .. 's: skip/'
  end
  hint = '[' .. hint .. 'q: quit]'
  
  if mem.pg.title ~= nil then
    table.insert(page, 1, mem.pg.title)
  end

  local output = ""
  for i, line in ipairs(page) do
    sep = "\n"
    if line:len() == WIDTH and target == 'minetest' then
        sep = ""
    end
    output = output .. line .. sep
  end

  local padding = string.rep("\n", HEIGHT - #page - 1)

  output = output .. padding ..hint:rpad(WIDTH)
  write_line(output)
end

_pg_meta_page = function()
    local entry = mem.pg.entries[mem.pg.cur_entry]
    mem.pg.cur_entry = mem.pg.cur_entry + 1
    if mem.pg.entries[mem.pg.cur_entry] == nil then
        mem.pg.meta_done = true
    end
    mem.pg.pages = entry["pages"]
    mem.pg.done = false
    mem.pg.title = entry["title"]
    mem.pg.cur = 1
    _pg_page()
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

metapager = function(entries, start)
  clear()
  mem.fg = "_pg_callback"
  mem.pg = {}
  mem.pg.meta = true
  mem.pg.entries = entries
  mem.pg.cur_entry = start
  _pg_meta_page()
end

