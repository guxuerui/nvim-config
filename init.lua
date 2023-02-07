require('config.lazy')

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    require('config.options')
    require('config.base')
    require('config.keymaps')
  end,
})
