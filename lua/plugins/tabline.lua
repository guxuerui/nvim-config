return {
  {
    'kdheepak/tabline.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    config = function()
      require('tabline').setup {
        enable = true,
        options = {
          section_separators = { '', '' },
          component_separators = { '', '' },
          max_bufferline_percent = 99, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = false, -- this appends [bufnr] to buffer section,
          show_filename_only = false, -- shows base filename only instead of relative path in filename
          modified_icon = "+ ", -- change the default modified icon
          modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
        }
      }
    end
  },
}
