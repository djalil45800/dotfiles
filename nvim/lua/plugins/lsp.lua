return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
		{
			"j-hui/fidget.nvim",
			opts = { notification = { override_vim_notify = true } },
		},
		{ "L3MON4D3/LuaSnip" },
	},

	config = function()
		local lspconfig = require("lspconfig")

		-- Capabilities pour blink.cmp
		local blink_ok, blink = pcall(require, "blink.cmp")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		if blink_ok then
			capabilities = blink.get_lsp_capabilities(capabilities)
		end

		-- Mason Tool Installer : seulement stylua et lua_ls
		require("mason-tool-installer").setup({
			ensure_installed = { "lua_ls", "stylua" },
		})

		-- Mason LSP config
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "yamlls", "bashls", "gopls" },
			automatic_installation = true,
			handlers = {
				-- handler par défaut
				function(server_name)
					lspconfig[server_name].setup({ capabilities = capabilities })
				end,

				-- Lua
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								workspace = {
									checkThirdParty = false,
									library = { vim.env.VIMRUNTIME },
								},
								telemetry = { enable = false },
							},
						},
					})
				end,

				-- Python
				["pyright"] = function()
					lspconfig.pyright.setup({
						capabilities = capabilities,
						settings = { python = { analysis = { typeCheckingMode = "basic" } } },
					})
				end,

				-- YAML
				["yamlls"] = function()
					lspconfig.yamlls.setup({
						capabilities = capabilities,
						settings = {
							yaml = { schemas = { ["https://json.schemastore.org/github-workflow.json"] = "*.yml" } },
						},
					})
				end,

				-- Bash
				["bashls"] = function()
					lspconfig.bashls.setup({ capabilities = capabilities })
				end,

				-- Go
				["gopls"] = function()
					lspconfig.gopls.setup({
						capabilities = capabilities,
						settings = { gopls = { analyses = { unusedparams = true }, staticcheck = true } },
					})
				end,
			},
		})

		-- Diagnostics
		vim.diagnostic.config({
			float = { border = "rounded" },
			severity_sort = true,
			signs = true,
			underline = true,
			update_in_insert = false,
		})

		-- Keymaps LSP
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, "[F]ormat")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
			end,
		})

		-- LuaSnip setup
		local luasnip = require("luasnip")
		luasnip.config.setup({})
		require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
	end,
}
