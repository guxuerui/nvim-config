return {
	{
		"kelly-lin/ranger.nvim",
		config = function()
			require("ranger-nvim").setup({
				enable_cmds = true,
				replace_netrw = true,
				ui = {
					border = "rounded",
					width = 0.6,
					height = 0.6,
				},
			})
			vim.api.nvim_set_keymap("n", "<leader>er", "", {
				noremap = true,
				callback = function()
					require("ranger-nvim").open(true)
				end,
			})
		end,
	},
}
