return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>mp",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "n",
			desc = "[M]ake [P]retty",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = {
			enabled = true,
			timeout_ms = 500,
			async = true,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			go = { "gofumpt" },
			sh = { "shfmt" },
			yaml = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			scss = { "prettierd" },
			less = { "prettierd" },
			markdown = { "prettierd" },
			rust = { "rustfmt" },
		},
	},
}
