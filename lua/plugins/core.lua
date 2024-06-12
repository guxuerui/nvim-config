return {
	{
		"jcdickinson/wpm.nvim",
		config = function()
			require("wpm").setup({})
		end,
	},
	"junegunn/fzf",
	"junegunn/fzf.vim",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {
			autotag = {
				enable = true,
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			"*",
			css = { rgb_fn = true },
			html = { names = false },
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	"easymotion/vim-easymotion",
	{
		"numToStr/Comment.nvim",
		version = "v0.6",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"mattn/emmet-vim",
	"wellle/context.vim",
	"metakirby5/codi.vim",
	"petertriho/nvim-scrollbar",
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup({})
		end,
	},
	{
		"Wansmer/treesj",
		opts = {
			use_default_keymaps = false,
			check_syntax_error = true,
			max_join_length = 120,
			cursor_behavior = "hold",
			notify = true,
		},
	},
	{
		"nvim-zh/colorful-winsep.nvim",
		event = { "WinNew" },
		opts = {
			highlight = {
				-- bg = "#f63111",
				fg = "#86c166",
			},
		},
	},
	-- {
	-- 	"rmagatti/auto-session",
	-- 	config = function()
	-- 		require("auto-session").setup({
	-- 			log_level = "error",
	-- 			auto_session_enable_last_session = true,
	-- 			auto_session_suppress_dirs = { "~/.config/nvim/sessions" },
	-- 			bypass_session_save_file_types = nil,
	-- 			cwd_change_handling = {
	-- 				restore_upcoming_session = true,
	-- 				pre_cwd_changed_hook = nil,
	-- 				post_cwd_changed_hook = nil,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"rmagatti/session-lens",
	-- 	config = function()
	-- 		require("telescope").load_extension("session-lens")
	-- 		require("session-lens").setup({
	-- 			theme = "ivy", -- default is dropdown
	-- 			previewer = true,
	-- 			theme_conf = { border = true },
	-- 			prompt_title = "YEAH SESSIONS",
	-- 		})
	-- 	end,
	-- },
	"lukas-reineke/indent-blankline.nvim",
	{
		"shortcuts/no-neck-pain.nvim",
		version = "*",
		opts = {
			width = 200,
		},
	},
	{
		"fedepujol/move.nvim",
		config = function()
			require("move").setup({})
		end,
	},
	{
		"Exafunction/codeium.vim",
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<C-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<C-,>", function()
				return vim.fn["codeium#CycleCompletions"](-3)
			end, { expr = true })
			vim.keymap.set("i", "<C-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},
	-- Old text                    Command         New text
	-- --------------------------------------------------------------------------------
	-- surr*ound_words             ysiw)           (surround_words)
	-- *make strings               ys$"            "make strings"
	-- [delete ar*ound me!]        ds]             delete around me!
	-- remove <b>HTML t*ags</b>    dst             remove HTML tags
	-- 'change quot*es'            cs'"            "change quotes"
	-- <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
	-- delete(functi*on calls)     dsf             function calls
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		config = function()
			require("tailwindcss-colors").setup()
		end,
	},
	{
		"tris203/precognition.nvim",
		-- event = "VeryLazy",
		config = true,
	},
}
