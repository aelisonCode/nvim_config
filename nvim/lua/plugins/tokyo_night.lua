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
				on_highlights = function(hl, c)
					hl.StatusLine = { bg = "NONE" }
					hl.StatusLineNC = { bg = "NONE" }

					-- For normal Neovim floats
					hl.FloatBorder = { fg = c.blue, bg = "NONE" }
					hl.FloatTitle  = { fg = c.blue, bg = "NONE" }
					hl.WinSeparator = { fg = c.blue, bg = "NONE" }

					-- For Telescope (Code Actions picker)
					hl.TelescopeBorder = { fg = c.blue, bg = "NONE" }
					hl.TelescopeTitle  = { fg = c.blue, bg = "NONE" }

					hl.TelescopePromptBorder  = { fg = c.blue, bg = "NONE" }
					hl.TelescopeResultsBorder = { fg = c.blue, bg = "NONE" }
					hl.TelescopePreviewBorder = { fg = c.blue, bg = "NONE" }
				end,
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
