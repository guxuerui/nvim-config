local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Your plugins go here
  use 'Shatur/neovim-ayu'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 
    'kdheepak/tabline.nvim',
    requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
  }
  -- using packer.nvim
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use "zbirenbaum/neodim"
  use "L3MON4D3/LuaSnip"
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'nvim-treesitter/nvim-treesitter'
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use({
    "folke/noice.nvim",
    config = function()
      require("noice").setup()
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  })
  use 'norcalli/nvim-colorizer.lua' 
  use "goolord/alpha-nvim"
  use "akinsho/toggleterm.nvim"
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use "folke/which-key.nvim"
  use "easymotion/vim-easymotion"
  use {
      'numToStr/Comment.nvim',
      tag = 'v0.6',
      config = function()
          require('Comment').setup()
      end
  }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'mattn/emmet-vim'
  use "wellle/context.vim"
  use 'lewis6991/impatient.nvim'
  use 'sunjon/shade.nvim'
  use 'metakirby5/codi.vim'
  use 'yamatsum/nvim-cursorline'
  use {
    'VonHeikemen/searchbox.nvim',
    requires = {
      {'MunifTanjim/nui.nvim'}
    }
  }
  use 'declancm/cinnamon.nvim'
  use 'petertriho/nvim-scrollbar'
  use 'kevinhwang91/nvim-hlslens'
  use 'Wansmer/treesj'
  use 'nvim-zh/colorful-winsep.nvim'
  -- auto-session
  use 'rmagatti/auto-session'
  use 'rmagatti/session-lens'
  use 'fladson/vim-kitty'
  -- This is a color scheme
  use { "catppuccin/nvim", as = "catppuccin" }
  use "lukas-reineke/indent-blankline.nvim"
  use 'rareitems/printer.nvim'
  use { "shortcuts/no-neck-pain.nvim", tag = "*" }
  use 'echasnovski/mini.nvim'
end)
