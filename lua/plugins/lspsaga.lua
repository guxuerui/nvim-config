local keymap = vim.keymap.set

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
-- Code action
keymap({ "n", "v" }, "<leader>la", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "grn", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gpr", "<cmd>Lspsaga finder<CR>")

keymap("n", "gpi", "<cmd>Lspsaga finder imp<CR>")

keymap("n", "gpd", "<cmd>Lspsaga peek_definition<CR>")

keymap("n", "gpt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

keymap("n", "gdt", "<cmd>Lspsaga goto_type_definition<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap({ "n", "t" }, "<leader>tr", "<cmd>Lspsaga term_toggle<CR>")

local function lsp_fts(type)
	type = type or nil
	local fts = {}
	fts.backend = {
		"lua",
		"sh",
		"zig",
		"python",
	}

	fts.frontend = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"html",
		"css",
		"vue",
		"svelte",
		"markdown",
		"react",
	}
	if not type then
		return vim.list_extend(fts.backend, fts.frontend)
	end
	return fts[type]
end

return {
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		ft = lsp_fts(),
		config = function()
			require("lspsaga").setup({})
		end,
	},
}
