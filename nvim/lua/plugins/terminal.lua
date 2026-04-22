return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		vim.api.nvim_set_hl(0, "ToggleTermBorder", { fg = "#80a0ff", bg = "NONE" })

		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			direction = "float",

			on_create = function(term)
				term:send("clear", false)
			end,

			on_open = function(term)
				local win = term.window
				if win and vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_set_option_value(
						"winhl",
						"FloatBorder:ToggleTermBorder,NormalFloat:ToggleTermNormal",
						{ win = win }
					)
				end
			end,

			float_opts = {
				border = "rounded",
				winblend = 0,
				width = function() return math.floor(vim.o.columns * 0.80) end,
				height = function() return math.floor(vim.o.lines * 0.25) end,
				col = function() return math.floor(vim.o.columns * 0.1) end,
				row = function() return math.floor(vim.o.lines * 0.7) end,
			},
		})
	end,
}
