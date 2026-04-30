return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = false,
				auto_trigger = true ,
				keymap = {
					accept = "<C-CR>"
				}
			},
			panel = {
				enabled = false
			},
		})
	end,
}
