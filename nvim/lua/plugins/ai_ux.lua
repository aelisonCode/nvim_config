return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"zbirenbaum/copilot.lua",
	},
	opts = {
		opts = { log_level = "DEBUG" },

		display = {
			chat = {
				window = {
					layout = "float",
					relative = "editor",
					border = "rounded",

					width = math.floor(vim.o.columns * 0.25),
					height = math.floor(vim.o.lines * 0.80),

					row = 2,
					col = vim.o.columns,

					opts = {
						breakindent = true,
						linebreak = true,
						wrap = true,
					},
				},
			},
		},
	},
	keys = {
		{ "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle AI chat" },
	},
}
