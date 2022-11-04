local modes_status_ok, lspsaga = pcall(require, "lspsaga")
if not modes_status_ok then
	vim.notify("modes import failed", "error", { title = "plugin loader status" })
	return
end

lspsaga.init_lsp_saga({
	-- your configuration
})

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gpr", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("v", "<leader>la", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gpd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>lsd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>lcd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Outline
keymap("n", "<leader>lso", "<cmd>LSoutlineToggle<CR>", { silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
