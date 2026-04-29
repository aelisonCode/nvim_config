local wezterm = require 'wezterm'

local M = {}

-- List of background files
local wallpapers = {
	"/home/aelison/.config/wezterm/background/tanjiro.jpg",
	"/home/aelison/.config/wezterm/background/tanjiro_blured20.jpg",
	"/home/aelison/.config/wezterm/background/nox_blured90.jpg",
	-- "/home/aelison/.config/wezterm/background/hollow_knight.gif",
}

local current_wallpaper_index = 1

-- Let the wallpaper change randomly instead of incrementing the index 
-- current_wallpaper_index = math.random(1, #wallpapers)

function M.cycle_wallpaper(window)
	current_wallpaper_index = current_wallpaper_index + 1
	if current_wallpaper_index > #wallpapers then
		current_wallpaper_index = 1
	end

	local new_wallpaper = wallpapers[current_wallpaper_index]

	window:set_config_overrides({
		background = {
			{
				source = { File = new_wallpaper },
			},
		}
	})

	wezterm.log_info("Wallpaper changed to: " .. new_wallpaper)
end

return M
