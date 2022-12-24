local status_ok, printer = pcall(require, "printer")
if not status_ok then
  return
end

printer.setup {
  keymap = "gp",-- Plugin doesn't have any keymaps by default
  behavior = "insert_below", -- how operator should behave
  -- "insert_below" will insert the text below the cursor
  --  "yank" will not insert but instead put text into the default '"' register
  formatters = {
    -- you can define your formatters for specific filetypes
    -- by assigning function that takes two strings
    -- one text modified by 'add_to_inside' function
    -- second the variable (thing) you want to print out
    -- see examples in lua/formatters.lua
    lua = function(inside, variable)
      return string.format('print("%s: " .. %s)', inside, variable)
    end,
    vue = function(inside, variable)
      return string.format("console.log('%s: ', %s)", inside, variable)
    end,
    ts = function(inside, variable)
      return string.format("console.log('%s: ', %s)", inside, variable)
    end,
    js = function(inside, variable)
      return string.format("console.log('%s: ', %s)", inside, variable)
    end,
    svelte = function(inside, variable)
      return string.format("console.log('%s: ', %s)", inside, variable)
    end,
  },
  -- function which modifies the text inside string in the print statement, by default it adds the path and line number
  add_to_inside = function(text)
      return string.format("[%s:%s] %s", vim.fn.expand("%"), vim.fn.line("."), text)
  end
  -- can explicitly set to nil to turn off default behaviour
  -- add_to_inside = nil
}
