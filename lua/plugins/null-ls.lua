return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- local format = function()
		-- 	vim.lsp.buf.format({
		-- 		async = false,
		-- 	})
		-- end

		null_ls.setup({
			debug = false,
			sources = {
				formatting.markdownlint,
				formatting.stylua,
				formatting.eslint_d,
				-- diagnostics.eslint_d,
			},
			-- you can reuse a shared lspconfig on_attach callback here
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					-- format web dev files
					vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.buf.format()")
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
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
	end,
}
