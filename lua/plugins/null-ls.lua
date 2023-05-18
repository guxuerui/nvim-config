return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    -- local diagnostics = null_ls.builtins.diagnostics
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local format = function()
      vim.lsp.buf.format({
        async = false,
      })
    end

    null_ls.setup({
      debug = false,
      sources = {
        formatting.markdownlint, -- need install: npm install -g markdownlint-cli
        formatting.eslint_d,
        -- diagnostics.eslint_d,
      },
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = format,
          })
        end
      end,
    })

    null_ls.builtins.formatting.eslint_d.with({
      extra_args = {
        "--style",
        "{IndentWidth: 2 ,ColumnLimit: 120}",
      },
    })
  end
}
