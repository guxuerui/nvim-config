return {
	"nvimtools/none-ls.nvim",
	config = function()
		local lsp_formatting = function(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					-- apply whatever logic you want (in this example, we'll only use null-ls)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
			})
		end
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local formatting = null_ls.builtins.formatting
		local completion = null_ls.builtins.completion

		null_ls.setup({
			debug = false,
			sources = {
				formatting.markdownlint,
				formatting.stylua,
				completion.spell,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							lsp_formatting(bufnr)
						end,
					})
				end
			end,
		})

		-- null_ls.setup({
		-- 	debug = false,
		-- 	sources = {
		-- 		formatting.markdownlint,
		-- 		formatting.stylua,
		-- 		formatting.eslint_d,
		-- 	},
		-- 	-- you can reuse a shared lspconfig on_attach callback here
		-- 	on_attach = function(current_client, bufnr)
		-- 		if current_client.supports_method("textDocument/formatting") then
		-- 			-- format web dev files
		-- 			vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.buf.format()")
		-- 			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		-- 			vim.api.nvim_create_autocmd("BufWritePre", {
		-- 				group = augroup,
		-- 				buffer = bufnr,
		-- 				callback = function()
		-- 					vim.lsp.buf.format({
		-- 						filter = function(client)
		-- 							--  only use null-ls for formatting instead of lsp server
		-- 							return client.name == "null-ls"
		-- 						end,
		-- 						bufnr = bufnr,
		-- 					})
		-- 				end,
		-- 			})
		-- 		end
		-- 	end,
		-- })

		-- null_ls.builtins.formatting.eslint_d.with({
		-- 	extra_args = {
		-- 		"--style",
		-- 		"{IndentWidth: 2 ,ColumnLimit: 120}",
		-- 	},
		-- })
	end,
}
