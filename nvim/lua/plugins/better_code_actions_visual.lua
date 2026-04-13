return {
	"stevearc/dressing.nvim",
	opts = {
		input = { enabled = true },
		select = {
			enabled = true,
			backend = { "telescope", "builtin" },
			builtin = {
				border = "rounded",
				relative = "cursor",
			},
		},
	},
}
