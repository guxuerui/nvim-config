local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("null-ls import failed", "error", { title = "plugin loader status" })
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local format = function(payload)
	vim.lsp.buf.format({
		async = true,
		--[[ filter = function(clients) ]]
		--[[ 	return client.name == "null-ls" ]]
		--[[ end, ]]
	})
end

null_ls.setup({
	debug = false,
	sources = {
		formatting.eslint_d,
		diagnostics.eslint_d,
		--[[ null_ls.builtins.code_actions.gitsigns, ]]
		--[[ null_ls.builtins.completion.spell, ]]
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
	extra_args = { "--style", "{IndentWidth: 2 ,ColumnLimit: 120}" },
})

