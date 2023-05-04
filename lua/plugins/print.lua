return {
  {
    'rareitems/printer.nvim',
    opts = {
      keymap = "gp",
      behavior = "insert_below",
      formatters = {
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
    }
  }
}

