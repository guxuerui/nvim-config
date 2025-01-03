return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
			ft_to_parser.mdx = "markdown"
			require("nvim-treesitter.configs").setup({
				-- one of "all"
				ensure_installed = {
					"javascript",
					"css",
					"scss",
					"typescript",
					"tsx",
					"json",
					"vue",
					"python",
					"html",
					"lua",
					"svelte",
					"vim",
					"help",
					"astro",
					"markdown",
					"markdown_inline",
					"bash",
					"fish",
					"prisma",
					"regex",
					"rust",
				},
				sync_install = true,
				ignore_install = { "php", "phpdoc" },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
				indent = {
					enable = true,
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				rainbow = {
					enable = true,
					-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
					extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
					max_file_lines = nil, -- Do not enable for files with more than n lines, int
					-- colors = {}, -- table of hex strings
					-- termcolors = {} -- table of colour name strings
				},
			})
		end,
	},
}
