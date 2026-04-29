local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local my_settings = require('settings')
local my_colors = require('colors')
-- local my_panels = require('panels')
local my_bg_changes = require('background_changes')

local modules = { my_settings, my_colors }

for _, module in ipairs(modules) do
	if type(module) == "table" then
		for key, value in pairs(module) do
			config[key] = value
		end
	end
end

config.keys = {
	{
		key = 'W',
		mods = 'CTRL|SHIFT',
		action = wezterm.action_callback(my_bg_changes.cycle_wallpaper),
	},
}

return config
