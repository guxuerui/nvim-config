local null_ls_status_ok, noice = pcall(require, "noice")
if not null_ls_status_ok then
	vim.notify("noice import failed", "error", { title = "plugin loader status" })
	return
end

require("noice").setup({
lsp = {
    message = {
      enabled = true
    },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
	views = {
		cmdline_popup = {
			position = {
				row = '50%',
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = '59%',
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},
})
