-- paint.lua
return {
  "folke/paint.nvim",
  config = function()
    local hlmap = {
      ["^#%s+(.-)%s*$"] = "Operator",
      ["^##%s+(.-)%s*$"] = "Conditional",
      ["^###%s+(.-)%s*$"] = "String",
      ["^####%s+(.-)%s*$"] = "Number",
      ["^#####%s+(.-)%s*$"] = "Include",
      ["^######%s+(.-)%s*$"] = "Structure",
    }

    local highlights = {
      {
        -- filter can be a table of buffer options that should match,
        -- or a function called with buf as param that should return true.
        -- The example below will paint @something in comments with Constant
        filter = { filetype = "lua" },
        pattern = "%s*%-%-%-%s*(@%w+)",
        hl = "Constant",
      },
      {
        filter = { filetype = "javascript" },
        pattern = "%s*%/%/%s*(@%w+)",
        hl = "Constant",
      },
      {
        filter = { filetype = "typescript" },
        pattern = "%s*%/%/%s*(@%w+)",
        hl = "Constant",
      },
      {
        filter = { filetype = "vue" },
        pattern = "%s*%/%/%s*(@%w+)",
        hl = "Constant",
      },
      {
        filter = { filetype = "svelte" },
        pattern = "%s*%/%/%s*(@%w+)",
        hl = "Constant",
      },
    }

    for pattern, hl in pairs(hlmap) do
      table.insert(highlights, {
        filter = { filetype = "markdown" },
        pattern = pattern,
        hl = hl,
      })
    end

    require("paint").setup({
      highlights = highlights,
    })
  end,
}
