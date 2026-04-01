--local wezterm = require 'wezterm'
--local config = wezterm.config_builder()

-- Import modules
--local my_colors = require 'colors'
--local my_settings = require 'settings'

-- Apply colors
--config.color_scheme = my_colors.color_scheme
--config.window_background_opacity = my_colors.window_background_opacity

-- Apply settings
--config.font = my_settings.font
--config.font_size = my_settings.font_size
--config.window_padding = my_settings.window_padding
--config.window_decorations = my_settings.window_decorations
--config.enable_tab_bar = my_settings.enable_tab_bar

--return config

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local my_settings = require('settings')
local my_colors = require('colors')

local modules = { my_settings, my_colors }

for _, module in ipairs(modules) do
    if type(module) == "table" then
        for key, value in pairs(module) do
            config[key] = value
        end
    end
end

return config
