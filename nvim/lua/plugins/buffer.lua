return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	opts = {
		options = {
			mode = "buffers",
			separator_style = "thin",
			always_show_bufferline = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			color_icons = true,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true
				}
			},
		},
		highlights = {
			fill = {
				bg = 'none',
			},
			background = {
				fg = '#565f89',
				bg = 'none',
			},
			buffer_selected = {
				fg = '#bb9af7',
				bg = 'none',
				bold = true,
				italic = true,
			},
			separator = {
				fg = '#3b4261',
				bg = 'none',
			},
		}
	}
}
