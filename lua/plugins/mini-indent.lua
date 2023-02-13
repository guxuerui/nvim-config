-- Setting specific file types does not work
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.indentscope').setup {
        symbol = "│",
        options = { try_as_border = true },
      }
    end
  }
}
