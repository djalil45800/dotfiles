return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		appearance = {
			nerd_font_variant = "mono",
		},

		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
		},

		completion = {
			menu = { border = "rounded" },
			documentation = { window = { border = "rounded" }, auto_show = true },

			ghost_text = { enabled = false },
		},

		snippets = { preset = "default" },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
}
