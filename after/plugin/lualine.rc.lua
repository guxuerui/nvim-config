local status, lualine = pcall(require, "lualine")
if (not status) then return end

local function chooseRandomTheme()
	local myThemeTable = {
		"powerline",
		"OceanicNext",
		"onelight",
		"papercolor_light",
		"solarized_light",
		"Tomorrow",
		"material",
		"dracula",
    'ayu',
	}
	local rand = math.random(#myThemeTable)
	vim.notify("Using theme " .. myThemeTable[rand] .. "", "info", { title = "Lualine Theme Selector" })
	return myThemeTable[rand]
end

require('lualine').setup {
  options = {
    icons_enabled = true,
		theme = "auto",
		--[[ theme = chooseRandomTheme(), ]]
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true, -- need set true
		refresh = {
			statusline = 1000,
			tabline = 1000,
			-- winbar = 1000,
		},
  },
  sections = {
		lualine_a = {
			"mode",
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
  tabline = {},
  extensions = { 'fzf','neo-tree', 'fugitive' }
}

