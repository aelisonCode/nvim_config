local home = os.getenv("HOME")	-- Could be used to get the image path if need

local colors = {
	color_scheme = 'Tokyo Night',
	window_background_opacity = 0.75,
	background = {
		{
			source = {
				File = home .. "/.config/wezterm/background/tanjiro.jpg",
			},
			hsb = {
				brightness = 0.7
			},
			width = "100%",
			height = "100%",
			opacity = 1,	-- Between 0 and 1 controle the transparency of the background image
		},
	},
}

return colors
