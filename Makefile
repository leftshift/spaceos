SOURCES = $(wildcard components/*.lua)


out.lua: $(SOURCES) components/41-log-entries.lua
	cat components/*.lua > out.lua

components/41-log-entries.lua: log/log_any_src.lua
	lua log/log_any_src.lua > components/41-log-entries.lua


