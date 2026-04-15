require("window_reminder").setup({
	title = "Little reminder",
	message = "Do not forget to take a break !",
	keymaps = {
		enabled = true,
		launch = "<leader>tw"	-- Keymap to launch the window
	},
})
