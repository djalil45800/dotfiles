return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local function transparent_bg()
			local groups = { "Normal", "NormalFloat", "NormalNC", "LineNr", "SignColumn" }
			for _, group in ipairs(groups) do
				vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
			end
		end

		require("tokyonight").setup({
			style = "storm",
			transparent = true,
		})

		vim.cmd("colorscheme tokyonight")
		transparent_bg()
	end,
}
