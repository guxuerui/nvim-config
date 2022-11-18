<h2 align="left">These are my Neovim config files , require version >= 0.8</h2>

> Ensure have install [Neovim](https://neovim.io/)

### 1. Need to install language server in [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html)

- `html` and `css`

```bash
  npm i -g vscode-langservers-extracted
```

- `tailwindcss`

```bash
  npm install -g @tailwindcss/language-server
```

- `tsserver`

``` bash
  npm install -g typescript typescript-language-server
```

- `volar`

``` bash
  npm install -g @volar/vue-language-server
```

## 2. Use Mason.nvim and mason-lspconfig.nvim

[Mason.nvim](https://github.com/williamboman/mason.nvim) is a Neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface

[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim). closes some gaps that exist between mason.nvim and lspconfig.
It is recommended to use this extension if you use mason.nvim and lspconfig (it's strongly recommended for Windows users)

> Tips: When type :Mason, floating windows may not be visible. One solution is to find the source code of mason.nvim, search the full text for the keyword `zindex` and change its value to 99.
Or you can see the [About Issue](https://github.com/neovim/neovim/issues/18486).
