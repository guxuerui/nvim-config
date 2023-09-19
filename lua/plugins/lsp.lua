return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"lukas-reineke/lsp-format.nvim",
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind-nvim",
		},
		config = function()
			local lsp = require("lsp-zero")
			lsp.preset("recommended")
			-- lsp.on_attach(function(client, bufnr)
			--   require("lsp-format").on_attach(client, bufnr)
			-- end)
			lsp.nvim_workspace()
			lsp.setup()
		end,
	},
}
