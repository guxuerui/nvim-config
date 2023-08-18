-- Setting specific file types does not work
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})

return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.indentscope").setup({
				symbol = "│",
				options = { try_as_border = true },
			})
			require("mini.cursorword").setup()
			require("mini.bracketed").setup()
			require("mini.jump").setup()
			require("mini.animate").setup()
			require("mini.files").setup({
				options = {
					use_as_default_explorer = true,
				},
				windows = {
					-- Maximum number of windows to show side by side
					max_number = math.huge,
					-- Whether to show preview of directory under cursor
					preview = true,
					-- Width of focused window
					width_focus = 50,
					-- Width of non-focused window
					width_nofocus = 25,
				},
			})
		end,
	},
}
