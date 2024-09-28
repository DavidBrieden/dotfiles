-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()


config.hide_tab_bar_if_only_one_tab = true
-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- config.colors = {
--   background = "rgba(30,30,30,0.5)"
-- }
-- config.front_end = "WebGpu"
config.window_background_opacity = 0
config.win32_acrylic_accent_color = "rgb(255,0,0)"
config.win32_system_backdrop = "Acrylic"

-- and finally, return the configuration to wezterm
return config
