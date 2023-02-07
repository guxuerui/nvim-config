return {
  {
    "jcdickinson/wpm.nvim",
    config = function()
      require("wpm").setup({})
    end
  },
  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    config = function()
      require("neodim").setup({
        alpha = 0.75,
        blend_color = "#000000",
        update_in_insert = {
          enable = true,
          delay = 100,
        },
        hide = {
          virtual_text = true,
          signs = true,
          underline = true,
        }
      })
    end
  },
  "junegunn/fzf",
  "junegunn/fzf.vim",
  -- 'nvim-treesitter/nvim-treesitter',
  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
      autotag = {
        enable = true,
      },
    },
  },
  'kyazdani42/nvim-web-devicons',
  {
    'nvim-telescope/telescope.nvim', version = '0.1.0',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  'nvim-telescope/telescope-file-browser.nvim',
  -- {
  --   "glepnir/lspsaga.nvim",
  --   keys = {
  --     { "gpr", "<cmd>Lspsaga lsp_finder<CR>", "n" },
  --     { "<leader>lr", "<cmd>Lspsaga rename<CR>" },
  --     { "<leader>la", "<cmd>Lspsaga code_action<CR>", "n, v" },
  --     { "gpd", "<cmd>Lspsaga peek_definition<CR>" },
  --     { "<leader>lsd", "<cmd>Lspsaga show_line_diagnostics<CR>" },
  --     { "<leader>so", "<cmd>Lspsaga outline<CR>" },
  --     { "K", "<cmd>Lspsaga hover_doc<CR>" },
  --   },
  -- },
  'jose-elias-alvarez/null-ls.nvim',
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup({
        signcolumn = true,
        current_line_blame = true,
      })
    end,
  },
  -- {
  --   "folke/noice.nvim",
  --   config = function()
  --     require("noice").setup()
  --   end,
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to the notification view.
  --     --   If not available, we `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --     }
  -- },
  {
    "norcalli/nvim-colorizer.lua",
    opts = {
      "*",
      css = { rgb_fn = true },
      html = { names = false },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  -- {
  --   "folke/which-key.nvim",
  --   -- event = "VeryLazy",
  --   config = function()
  --     vim.o.timeout = true
  --     vim.o.timeoutlen = 300
  --     require("which-key").setup({})
  --   end,
  -- },
  "easymotion/vim-easymotion",
  {
    'numToStr/Comment.nvim',
    version = 'v0.6',
    config = function()
      require('Comment').setup()
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  'mattn/emmet-vim',
  "wellle/context.vim",
  -- {
  --   'sunjon/shade.nvim',
  --   opts = {
  --     overlay_opacity = 50,
  --     opacity_step = 1,
  --     keys = {
  --       brightness_up   = '<C-Up>',
  --       brightness_down = '<C-Down>',
  --       toggle          = '<Leader>t',
  --     }
  --   }
  -- },
  'metakirby5/codi.vim',
  {
    'yamatsum/nvim-cursorline',
    lazy = false,
    config = function()
      require("nvim-cursorline").setup({
        cursorline = {
          enable = true,
          timeout = 1000,
          number = true,
        },
        cursorword = {
          enable = true,
          min_length = 3,
          hl = { underline = true },
        }
      })
    end
  },
  {
    'VonHeikemen/searchbox.nvim',
    dependencies = {
      { 'MunifTanjim/nui.nvim' }
    }
  },
  {
    'declancm/cinnamon.nvim',
    config = function()
      require("cinnamon").setup({
        -- KEYMAPS:
        default_keymaps = true, -- Create default keymaps.
        extra_keymaps = false, -- Create extra keymaps.
        extended_keymaps = false, -- Create extended keymaps.
        override_keymaps = false, -- The plugin keymaps will override any existing keymaps.
        -- OPTIONS:
        always_scroll = false, -- Scroll the cursor even when the window hasn't scrolled.
        centered = true, -- Keep cursor centered in window when using window scrolling.
        default_delay = 7, -- The default delay (in ms) between each line when scrolling.
        hide_cursor = false, -- Hide the cursor while scrolling. Requires enabling termguicolors!
        horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
        max_length = -1, -- Maximum length (in ms) of a command. The line delay will be
        scroll_limit = 150, -- Max number of lines moved before scrolling is skipped. Setting
      })
    end
  },
  'petertriho/nvim-scrollbar',
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require("hlslens").setup({})
    end
  },
  {
    'Wansmer/treesj',
    opts = {
      use_default_keymaps = false,
      -- Node with syntax error will not be formatted
      check_syntax_error = true,
      -- If line after join will be longer than max value,
      -- node will not be formatted
      max_join_length = 120,
      cursor_behavior = 'hold',
      -- Notify about possible problems or not
      notify = true,
      langs = langs,
    }
  },
  {
    'nvim-zh/colorful-winsep.nvim',
    opts = {
      -- highlight for Window separator
      highlight = {
        -- bg = "#f63111",
        fg = "#86c166",
      },
      -- timer refresh rate
      interval = 30,
      -- This plugin will not be activated for filetype in the following table.
      no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
      -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
      symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
    }
  },
  -- auto-session
  'rmagatti/auto-session',
  {
    'rmagatti/session-lens',
    opts = {
      theme_conf = { border = true },
      previewer = true,
      prompt_title = 'YEAH SESSIONS',
    }
  },
  'fladson/vim-kitty',
  "lukas-reineke/indent-blankline.nvim",
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {
      width = 200,
    }
  },
  {
    "glepnir/lspsaga.nvim",
    lazy = false,
    keys = {
      { "gpr", "<cmd>Lspsaga lsp_finder<CR>", "n" },
      { "<leader>lr", "<cmd>Lspsaga rename<CR>" },
      { "<leader>la", "<cmd>Lspsaga code_action<CR>", "n, v" },
      { "gpd", "<cmd>Lspsaga peek_definition<CR>" },
      { "<leader>lsd", "<cmd>Lspsaga show_line_diagnostics<CR>" },
      { "<leader>so", "<cmd>Lspsaga outline<CR>" },
      { "K", "<cmd>Lspsaga hover_doc<CR>" },
    },
  },
}
