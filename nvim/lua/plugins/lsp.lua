return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, { desc = 'Go to previous error' })
			vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, { desc = 'Go to next error' })
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP Code Actions' })
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
			vim.keymap.set('n', 'gv', function()
				vim.cmd("vsplit")
				vim.lsp.buf.definition()
			end, { desc = 'Go to definition in split' })

			vim.diagnostic.config({
				float = {
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"pylsp",
					"lua_ls",
				},
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = { "clangd", "pylsp", "lua_ls"}

			for _, server in ipairs(servers) do
				if vim.lsp.config then
					vim.lsp.config(server, {
						capabilities = capabilities,
					})
				else
					require("lspconfig")[server].setup({
						capabilities = capabilities,
					})
				end
			end
		end,
	},
}
