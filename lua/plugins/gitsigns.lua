return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup({
        signs              = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn         = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl              = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl             = true, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff          = true, -- Toggle with `:Gitsigns toggle_word_diff`
        current_line_blame = true,
      })
    end,
  },
}
