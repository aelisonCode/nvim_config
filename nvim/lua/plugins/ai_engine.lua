return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	lazy = true,
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
