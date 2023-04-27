# These are my Neovim configuration files

> Ensure you have installed [Neovim](https://neovim.io/)

## Requirements

* Neovim >= v0.8.3

![preview](https://user-images.githubusercontent.com/23629097/217407314-6c672021-c42f-46af-9e2e-62afaea1858d.png)

## :file_folder: File Structure

```bash
# ~/.config/nvim
├── images
│  ├── alpha-dashboard.png
│  └── preview.png
├── init.lua
├── lazy-lock.json
├── LICENSE
├── lua
│  ├── config
│  │  ├── base.lua
│  │  ├── keymaps.lua
│  │  ├── lazy.lua
│  │  └── options.lua
│  └── plugins
│     ├── alpha.lua
│     ├── cinnamon.lua
│     ├── colorscheme.lua
│     ├── core.lua
│     ├── lsp.lua
│     ├── lspsaga.lua
│     ├── lualine.lua
│     ├── mini-indent.lua
│     ├── neodim.lua
│     ├── noice.lua
│     ├── null-ls.lua
│     ├── print.lua
│     ├── searchbox.lua
│     ├── tabline.lua
│     ├── treesitter.lua
│     └── which-key.lua
└── README.md
```

## 1. [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)

> **Install lsp-related plugins into lsp-zero.nvim integration**

```lua
-- use lazy.nvim
return {
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      "lukas-reineke/lsp-format.nvim",
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind-nvim",
    },
    config = function()
      local lsp = require("lsp-zero")
      lsp.preset("recommended")
      lsp.on_attach(function(client, bufnr)
        require("lsp-format").on_attach(client, bufnr)
      end)
      lsp.nvim_workspace()
      lsp.setup()
      vim.diagnostic.config({ virtual_text = true })
    end,
  }
}
```

## 2. Use markdownlint for markdown file with null-ls.nvim

* First Step

```bash
npm install -g markdownlint-cli
```

* Second Step

```lua
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.markdownlint,
    formatting.eslint_d,
    diagnostics.eslint_d,
  }
})
```
