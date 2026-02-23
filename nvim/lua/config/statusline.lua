local colors = {
	blue = "#7aa2f7",
	green = "#73daca",
	magenta = "#bb9af7",
	orange = "#ff9e64",
	red = "#f7768e",
	fg = "#c0caf5",
	yellow = "#e0af68",
}
local function setup_highlights()
	local modes_hl = {
		Normal = colors.blue,
		Insert = colors.green,
		Visual = colors.magenta,
		Command = colors.orange,
		Replace = colors.red,
	}
	for name, color in pairs(modes_hl) do
		vim.api.nvim_set_hl(0, "StatusLineMode" .. name, { fg = color, bg = "none", bold = true })
	end

	vim.api.nvim_set_hl(0, "StatusLineFile", { fg = colors.fg, bg = "none" })
	vim.api.nvim_set_hl(0, "StatusLinePos", { fg = colors.fg, bg = "none", italic = true })
	vim.api.nvim_set_hl(0, "StatusLineKeys", { fg = colors.yellow, bg = "none", bold = true })
end

setup_highlights()
local mode_map = {
	["n"] = { name = "NORMAL", hl = "StatusLineModeNormal" },
	["i"] = { name = "INSERT", hl = "StatusLineModeInsert" },
	["v"] = { name = "VISUAL", hl = "StatusLineModeVisual" },
	["V"] = { name = "V-LINE", hl = "StatusLineModeVisual" },
	["\22"] = { name = "V-BLOCK", hl = "StatusLineModeVisual" },
	["c"] = { name = "COMMAND", hl = "StatusLineModeCommand" },
	["R"] = { name = "REPLACE", hl = "StatusLineModeReplace" },
	["t"] = { name = "TERMINAL", hl = "StatusLineModeInsert" },
}

_G.simple_statusline = function()
	local mode_data = mode_map[vim.api.nvim_get_mode().mode] or mode_map["n"]

	return table.concat({
		"%#",
		mode_data.hl,
		"# ",
		mode_data.name,
		" ",
		"%#StatusLineFile# %f %m",
		"%=",
		"%#StatusLineKeys#%S ",
		"%#StatusLinePos# %l:%c ",
	})
end
