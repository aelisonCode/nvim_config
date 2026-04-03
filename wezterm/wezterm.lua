local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local my_settings = require('settings')
local my_colors = require('colors')
local my_panels = require('panels')

local modules = { my_settings, my_colors, my_panels }

for _, module in ipairs(modules) do
    if type(module) == "table" then
        for key, value in pairs(module) do
            config[key] = value
        end
    end
end

return config
