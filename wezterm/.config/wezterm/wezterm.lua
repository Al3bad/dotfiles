local wezterm = require("wezterm")
local config = {}

-- Theme
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.color_scheme = "iceberg-dark"

-- Window settings
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.85
config.macos_window_background_blur = 64
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "1cell",
	bottom = 0,
}

-- Tab bar styles
config.use_fancy_tab_bar = false
config.colors = {
	-- Muted colour selection
	selection_bg = "rgba(30% 40% 50% 50%)",
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = "rgba(22,24,33,0.85)",
		-- The active tab is the one that has focus in the window
		active_tab = {
			bg_color = "rgba(22,24,33,0.85)",
			fg_color = "#c0c0c0",
			underline = "Single",
		},
		inactive_tab = {
			bg_color = "rgba(22,24,33,0.85)",
			fg_color = "#505050",
			underline = "Single",
		},
		inactive_tab_hover = {
			bg_color = "rgba(22,24,33,0.85)",
			fg_color = "#707070",
		},
		new_tab = {
			bg_color = "rgba(22,24,33,0.85)",
			fg_color = "#808080",
		},
		new_tab_hover = {
			bg_color = "rgba(22,24,33,0.85)",
			fg_color = "#909090",
		},
	},
}
-- Custom keybindings
config.keys = {
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
}

return config
