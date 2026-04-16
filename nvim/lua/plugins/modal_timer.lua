return {
	"aelisonCode/modal_timer.nvim",
	dependencies = {
		"aelisonCode/modal_reminder.nvim",
	},
	opts = {
		autostart = true,
		times = { "09:30", "15:00"},
		messages = { "Hey, time to take a break!", "You worked well, wanna go home?" },
		keymaps = {
			enabled = true,
			start = "<leader>ts",
			stop = "<leader>te",
			status = "<leader>tc",
		},
	},
	config = function(_, opts)
		require("modal_timer").setup(opts)
	end,
}
