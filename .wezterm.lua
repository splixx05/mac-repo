-- Pull in the API
local wezterm = require 'wezterm'

-- Hold the configurations
local config = wezterm.config_builder()

-- set default shell
config.default_prog = {"/usr/bin/zsh"}

-- Color sheme
config.color_scheme = 'Tokyo Night'

-- Background
config.window_background_image = '/home/ricky/Pictures/wez/ct.jpg'
-- config.window_background_image_hsb = {
-- 	brightness = 0.9,
-- 	hue = 1.0,
-- 	saturation = 1.0,
-- }

-- Font configurations
config.font = wezterm.font("MesloLGS NF", { weight = "Regular" })
config.font_size = 14

-- Window configurations
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.initial_rows = 24
config.initial_cols = 112
config.window_background_opacity = 1.0
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}
--config.window_padding =
--config.integrated_title_buttons = { 'Hide', 'Maximize', 'Close' }
--config.integrated_title_button_style = "Gnome"

-- some other config values
-- config.window_close_confirmation
-- config.window_frame
-- config.window_background_gradient

-- Keybinding config
config.keys = {
  {
    key = 'f',
    mods = 'CTRL|ALT',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = 'v',
    mods = 'CTRL|ALT',
    action = wezterm.action.SplitVertical,
  },
  {
    key = 'h',
    mods = 'CTRL|ALT',
    action = wezterm.action.SplitHorizontal,
  },
  {
    key = 'q',
    mods = 'CTRL|ALT',
    action = wezterm.action.QuitApplication,
  },
}



return config

