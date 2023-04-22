local custom_gruvbox = require("lualine.themes.gruvbox")
local report = require("weather")

local colors = {
	bg = "#273138",
	black = "#262E35",
	darkgray = "#3c4349",
	lightgray = "#767a7c",
	inactivegray = "#a3a3a3",
	white = "#bfbda6", --gray245
	bright = "#e2e1cf",
	fg = "#273138",
	red = "#d38275",
	green = "#262e35",
	blue = "#83a598",
	yellow = "#262e35",
	purple = "#bcbfce",
	aqua = "#afd3b7",
	orange = "#e59f65",
	gold = "#b99b45",
}

local custom_config = {
	normal = {
		a = { bg = colors.white, fg = colors.black, gui = "bold" },
		b = { bg = colors.bg, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.white },
		x = { bg = colors.darkgray, fg = colors.white },
		z = { bg = colors.white, fg = colors.black },
	},
	insert = {
		a = { bg = colors.gold, fg = colors.black, gui = "bold" },
		b = { bg = colors.bg, fg = colors.white },
		c = { bg = colors.gold, fg = colors.black },
		x = { bg = colors.darkgray, fg = colors.white, gui = "bold" },
		z = { bg = colors.gold, fg = colors.black },
	},
	visual = {
		a = { bg = colors.blue, fg = colors.black, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.white },
		c = { bg = colors.white, fg = colors.black },
		z = { bg = colors.white, fg = colors.black },
	},
	replace = {
		a = { bg = colors.red, fg = colors.black, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.white },
		c = { bg = colors.black, fg = colors.white },
	},
	command = {
		a = { bg = colors.darkgray, fg = colors.white, gui = "bold" },
		b = { bg = colors.bg, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.white },
	},
	inactive = {
		a = { bg = colors.darkgray, fg = colors.gray, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.gray },
		c = { bg = colors.white, fg = colors.black },
	},
}

--+-------------------------------------------------+
--| A | B | C                             X | Y | Z |
--+-------------------------------------------------+
--  
-- Set lualine as statusline
-- See `:help lualine.txt`
--
local temps = function()
	return report.kfeed
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = custom_config, --custom_config | auto
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode", temps },
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
	tabline = { lualine_a = { "filename" }, lualine_z = {}, lualine_c = {} },
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
