return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- keymaps
			vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Go to previous error" })
			vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Go to next error" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "gv", function()
				vim.cmd("vsplit")
				vim.lsp.buf.definition()
			end, { desc = "Go to definition in split" })

			vim.diagnostic.config({
				float = { border = "rounded", source = "always", header = "", prefix = "" },
			})

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "pylsp", "lua_ls" },
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})

			vim.lsp.config("pylsp", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})

			vim.lsp.enable({ "clangd", "pylsp", "lua_ls" })
		end,
	},
}
