return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
		},
	},

	opts = {
		appearance = {
			nerd_font_variant = "mono",
		},

		keymap = {
			preset = "none",

			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },

			["<CR>"] = {
				function(cmp)
					if cmp.is_visible() then
						cmp.accept()
					else
						cmp.fallback()
					end
				end,
			},

			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },

			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
		},

		completion = {
			menu = {
				border = "rounded",
				scrollbar = true,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = { border = "rounded" },
			},
			ghost_text = { enabled = false },
			list = { selection = { preselect = false } },
		},

		snippets = {
			preset = "luasnip",
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet.body)
			end,
		},

		sources = {
			default = { "lsp", "snippets", "path", "buffer" },
		},
	},
}
