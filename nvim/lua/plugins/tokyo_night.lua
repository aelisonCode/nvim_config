return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon", -- 'storm', 'moon', or 'night'
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				on_highlights = function(hl)
					hl.StatusLine = { bg = "NONE" }
					hl.StatusLineNC = { bg = "NONE" }
				end,
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
