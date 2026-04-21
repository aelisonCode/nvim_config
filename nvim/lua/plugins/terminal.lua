return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-\>]], -- Press Ctrl + \ to toggle
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			direction = "float",
			on_create = function(term)
				term:send("clear", false)
			end,
			float_opts = {
				border = "rounded",
				winblend = 0,	-- Control the % of transparency

				width = function()
					-- width of the window	
					return math.floor(vim.o.columns * 0.80)
				end,
				height = function()
					-- height of the window
					return math.floor(vim.o.lines * 0.25)
				end,

				col = function()
					-- width start position
					return math.floor(vim.o.columns * 0.1)
				end,

				row = function()
					-- height start position
					return math.floor(vim.o.lines * 0.7)
				end,
			},
		})
	end
}
