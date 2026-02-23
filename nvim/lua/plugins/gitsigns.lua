return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gitsigns.nav_hunk("next")
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Prochaine modif Git" })

			map("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gitsigns.nav_hunk("prev")
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Modif Git précédente" })

			map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Git Stage (Hunk)" })
			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Git Reset (Hunk)" })
			map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Git Preview (Hunk)" })
			map("n", "<leader>gb", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Git Blame" })
			map("n", "<leader>gd", gitsigns.diffthis, { desc = "Git Diff" })
		end,
	},
}
