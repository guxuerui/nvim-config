return {
  {
    "jcdickinson/wpm.nvim",
    config = function()
      require("wpm").setup({})
    end
  },
  "junegunn/fzf",
  "junegunn/fzf.vim",
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
  {
    'nvim-telescope/telescope.nvim', version = '0.1.0',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    config = function()
      require("telescope").load_extension "file_browser"
    end
  },
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
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
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
  'metakirby5/codi.vim',
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
      -- langs = langs,
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
  "lukas-reineke/indent-blankline.nvim",
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {
      width = 200,
    }
  },
  "fedepujol/move.nvim"
}
