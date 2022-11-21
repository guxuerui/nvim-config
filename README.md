<h2 align="left">These are my Neovim config files , require version >= 0.8</h2>

> Ensure you have installed [Neovim](https://neovim.io/)

## 1. Mason.nvim

[Mason.nvim](https://github.com/williamboman/mason.nvim) is a Neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface

> Tips: When type :Mason, floating windows may not be visible. One solution is to find the source code of mason.nvim, search the full text for the keyword `zindex` and change its value to 99.
Or you can see the [About Issue](https://github.com/neovim/neovim/issues/18486).

### 2. Need to install language server, use [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)

[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim). closes some gaps that exist between mason.nvim and lspconfig.
It is recommended to use this extension if you use mason.nvim and lspconfig (it's strongly recommended for Windows users)

```lua
// plugin/mason.rc.lua
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

