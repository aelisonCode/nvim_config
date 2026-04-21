return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = false,
				auto_trigger = true ,
				keymap = {
					accept = "<TAB>"
				}
		},
		panel = { 
			enabled = false
		},
	})
end,
}
