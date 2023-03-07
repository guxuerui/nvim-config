return {
  {
    'VonHeikemen/searchbox.nvim',
    dependencies = {
      { 'MunifTanjim/nui.nvim' }
    },
    config = function()
      require('searchbox').setup({
        defaults = {
          reverse = false,
          exact = false,
          prompt = ' ',
          modifier = 'disabled',
          confirm = 'off',
          clear_matches = true,
          show_matches = false,
        },
        popup = {
          relative = 'win',
          position = {
            row = '50%',
            col = '50%',
          },
          size = 30,
          border = {
            style = 'rounded',
            text = {
              top = ' Search ',
              top_align = 'left',
            },
          },
          win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
        },
      })
    end
  },
}
