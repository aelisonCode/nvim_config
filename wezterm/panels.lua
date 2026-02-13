local wezterm = require("wezterm")

local P = {}

P.keys = {
	{
		key = "h",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

local directions = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

-- Add panels cmd to move between different windows
for key, dir in pairs(directions) do
	table.insert(P.keys, {
		key = key,
		mods = "ALT|SUPER",
		action = wezterm.action.ActivatePaneDirection(dir),
	})
end

-- Add cmd to resize current windows
for key, dir in pairs(directions) do
	table.insert(P.keys, {
		key = key,
		mods = "ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ dir, 3 }), -- 3 = number of cells to resize
	})
end

return P
