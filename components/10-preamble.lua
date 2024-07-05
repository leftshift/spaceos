-- spaceOS - minimal operating system
-- # general design
-- recieve messages from keyboard via handle_input``
-- call apropriate program (just a function)
-- arguments: (input, argi)
--   input: whole input from keyboard
--   argi: index where command name ends/arguments start
--
-- if a program wants to take over keyboard input itself,
-- overwrite mem.fg ('foreground') with the _name_ of a callback
-- arguments: (input)
--  input: whole input from keyboard
-- (why a name? Because functions can't be stored in mem.)
--
-- programs can use `write_line(line)` to write a line (or multiple)
-- to the output buffer. This buffer is then concated
-- with newlines and returned from `handle_input()
