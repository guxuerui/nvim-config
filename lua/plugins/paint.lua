-- paint.lua
return {
  "folke/paint.nvim",
  config = function()
    local hlmap = {
      ["^#%s+(.-)%s*$"] = "Operator",
      ["^##%s+(.-)%s*$"] = "Type",
      ["^###%s+(.-)%s*$"] = "String",
      ["^####%s+(.-)%s*$"] = "Constant",
      ["^#####%s+(.-)%s*$"] = "Number",
      ["^######%s+(.-)%s*$"] = "Error",
    }

    local highlights = {}
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
