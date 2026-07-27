-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"
config.color_scheme = "ayu"
config.enable_wayland = true
config.font = wezterm.font("ZedMono Nerd Font")
config.font_size = 14.3
config.harfbuzz_features = { "calt=0" }
-- config.initial_cols = 84
--config.window_background_image = "~/Pictures/wallpapers/1311862.jpeg"
config.window_background_opacity = 0.4
config.use_fancy_tab_bar = false
config.adjust_window_size_when_changing_font_size = false
config.line_height = 1
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.use_ime = false
config.max_fps = 120
config.animation_fps = 60
config.front_end = "OpenGL"
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.colors = {
    foreground = "#dddddd",
    -- background = "#333333",
    -- tab_bar = {
    -- 	active_tab = {
    -- 		fg_color = "#282c34",
    -- 		bg_color = "#979eab",
    -- 	},
    -- 	inactive_tab = {
    -- 		fg_color = "#abb2bf",
    -- 		bg_color = "#282c34",
    -- 	},
    -- 	inactive_tab_hover = {
    -- 		fg_color = "#abb2bf",
    -- 		bg_color = "#282c34",
    -- 	},
    -- 	new_tab = {
    -- 		fg_color = "#abb2bf",
    -- 		bg_color = "#282c34",
    -- 	},
    -- 	new_tab_hover = {
    -- 		fg_color = "#abb2bf",
    -- 		bg_color = "#282c34",
    -- 	},
    -- },
}

config.keys = {
    {
        key = "c",
        mods = "CTRL|SHIFT",
        action = wezterm.action.CopyTo("Clipboard"),
    },

    -- {
    --     key = "o",
    --     mods = "CTRL|SHIFT",
    --     action = wezterm.action.ShowTabNavigator,
    -- },
    {
        key = "o",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window, pane)
            local overrides = window:get_config_overrides() or {}
            if overrides.enable_tab_bar == false then
                overrides.enable_tab_bar = true
            else
                overrides.enable_tab_bar = false
            end
            window:set_config_overrides(overrides)
        end),
    },
    {
        key = "t",
        mods = "CTRL",
        action = wezterm.action_callback(function(window, pane)
            local cwd = pane:get_current_working_dir()
            local dir = cwd and cwd.file_path or wezterm.home_dir
            window:perform_action(wezterm.action.SpawnCommandInNewTab({ cwd = dir }), pane)
        end),
    },
    {
        key = "Enter",
        mods = "ALT",
        action = wezterm.action_callback(function(window, pane)
            local cwd = pane:get_current_working_dir()
            local dir = cwd and cwd.file_path or wezterm.home_dir
            window:perform_action(wezterm.action.SpawnCommandInNewWindow({ cwd = dir }), pane)
        end),
    },

    {
        key = "q",
        mods = "CTRL|SHIFT",
        action = wezterm.action.CloseCurrentTab({ confirm = false }),
    },
    {
        key = "b",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window, pane)
            local overrides = window:get_config_overrides() or {}
            if overrides.window_background_opacity == 1.0 then
                overrides.window_background_opacity = 0.4
            else
                overrides.window_background_opacity = 1.0
            end
            window:set_config_overrides(overrides)
        end),
    },

    {
        key = "Space",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivateCopyMode,
    },
}
-- and finally, return the configuration to wezterm
return config
