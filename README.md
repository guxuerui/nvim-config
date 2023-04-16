# These are my Neovim config files , require version >= 0.8.3

> Ensure you have installed [Neovim](https://neovim.io/)

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

## 1. Mason.nvim

[Mason.nvim](https://github.com/williamboman/mason.nvim) is a Neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface

> Tips: When type :Mason, floating windows may not be visible. One solution is to find the source code of mason.nvim, search the full text for the keyword `zindex` and change its value to 99.
Or you can see the [About Issue](https://github.com/neovim/neovim/issues/18486).

## 2. Need to install language server, use [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)

[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim). closes some gaps that exist between mason.nvim and lspconfig.
It is recommended to use this extension if you use mason.nvim and lspconfig (it's strongly recommended for Windows users)

```lua
-- plugin/mason.rc.lua
require("mason").setup({
  -- ensure installed
  ensure_installed = {
    "sumneko_lua",
    "tsserver",
    "tailwindcss",
    "bashls",
    "cssls",
    "dockerls",
    "emmet_ls",
    "html",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "volar",
    "eslint",
    "eslint_d",
    "svelte",
    "marksman"
  },
  automatic_installation = true
})
```

## 3. Use markdownlint for markdown file with null-ls.nvim

- First Step

```bash
npm install -g markdownlint-cli
```

- Second Step

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
