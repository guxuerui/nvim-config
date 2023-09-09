return {
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		keys = {
			{ "<Leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "Diff File" },
			{ "<Leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diff View" },
		},
		opts = function()
			local actions = require("diffview.actions")
			vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
				group = vim.api.nvim_create_augroup("rafi_diffview", {}),
				pattern = "diffview:///panels/*",
				callback = function()
					vim.opt_local.cursorline = true
					vim.opt_local.winhighlight = "CursorLine:WildMenu"
				end,
			})

			return {
				enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
				keymaps = {
					view = {
						{ "n", "q", "<cmd>DiffviewClose<CR>" },
						{ "n", "<Tab>", actions.select_next_entry },
						{ "n", "<S-Tab>", actions.select_prev_entry },
						{ "n", "<LocalLeader>a", actions.focus_files },
						{ "n", "<LocalLeader>e", actions.toggle_files },
					},
					file_panel = {
						{ "n", "q", "<cmd>DiffviewClose<CR>" },
						{ "n", "h", actions.prev_entry },
						{ "n", "o", actions.focus_entry },
						{ "n", "gf", actions.goto_file },
						{ "n", "sg", actions.goto_file_split },
						{ "n", "st", actions.goto_file_tab },
						{ "n", "<C-r>", actions.refresh_files },
						{ "n", ";e", actions.toggle_files },
					},
					file_history_panel = {
						{ "n", "q", "<cmd>DiffviewClose<CR>" },
						{ "n", "o", actions.focus_entry },
						{ "n", "O", actions.options },
					},
				},
			}
		end,
	},
}
