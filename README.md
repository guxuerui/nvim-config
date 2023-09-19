# These are my Neovim configuration files

> Ensure you have installed [Neovim](https://neovim.io/), and the version I am currently using is `0.9.1`

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
│  │  ├── options.lua
│  │  └── utils.lua
│  └── plugins
│     ├── alpha.lua
│     ├── cinnamon.lua
│     ├── colorscheme.lua
│     ├── core.lua
│     ├── diffView.lua
│     ├── gitsigns.lua
│     ├── leet-buddy.lua
│     ├── lsp.lua
│     ├── lsp_lines.lua
│     ├── lspsaga.lua
│     ├── lualine.lua
│     ├── mini.lua
│     ├── neoai.lua
│     ├── neodim.lua
│     ├── noice.lua
│     ├── null-ls.lua
│     ├── paint.lua
│     ├── print.lua
│     ├── ranger.lua
│     ├── searchbox.lua
│     ├── tabline.lua
│     ├── treesitter.lua
│     └── which-key.lua
└── README.md
```

## :anchor: TIPS

### 1. [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)

> **Install lsp-related plugins into lsp-zero.nvim integration**

```lua
-- use lazy.nvim
return {
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Autocompletion
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
      lsp.nvim_workspace()
      lsp.setup()
    end,
  }
}
```

### 2. Language Servers with [Mason.nvim](https://github.com/williamboman/mason.nvim)

> **Install lsp-related language server into Mason.nvim integration**

* bash-language-server
* css-lsp
* html-lsp
* json-lsp
* eslint-lsp
* lua-language-server
* dockerfile-language-server
* emmet-ls
* marksman
* prisma-language-server
* pyright
* rust-analyzer
* stylua
* svelte-language-server
* tailwindcss-language-server
* typescript-language-server
* vue-language-server

### 3. Use markdownlint for markdown file with null-ls.nvim

* First Step

```bash
npm install -g markdownlint-cli
npm install -g eslint_d
```

* Second Step

```lua
local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.markdownlint,
    formatting.eslint_d,
  }
})
```
