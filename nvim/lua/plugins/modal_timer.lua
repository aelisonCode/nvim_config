return {
	"aelisonCode/modal_timer.nvim",
	dependencies = {
		"aelisonCode/modal_reminder.nvim",
	},
	opts = {
		autostart = true,
		times = { "08:30", "10:30", "11:00", "14:30", "16:00" },
		messages = { "Hey, time to take a break!", "Need to take some water", "Time to eat there !", "Take a break", "Home is calling, right now !" },
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
