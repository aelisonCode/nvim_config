local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#011423",
-- 	cursor_bg = "#47FF9C",
-- 	cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#033259",
-- 	selection_fg = "#CBE0F0",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 9
config.enable_tab_bar = false
config.window_background_opacity = 0.75
config.hide_mouse_cursor_when_typing = true
config.window_decorations = "RESIZE"

config.initial_cols = 230
config.initial_rows = 55

-- Background image
config.background = {
	{
		source = {
			File = "/home/aelison/Downloads/arcane.jpg",
		},
		hsb = {
			brightness = 0.9,
		},
		width = "100%",
		height = "100%",
	},
}

-- Panels configuration add to config to apply
local panels = require("panels")

config.keys = config.keys or {}
for _, key in ipairs(panels.keys) do
	table.insert(config.keys, key)
end

return config
