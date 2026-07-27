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
config.font_size = 13
config.harfbuzz_features = { "calt=0" }
config.enable_kitty_graphics = true
config.quit_when_all_windows_are_closed = false
-- config.enable_kitty_keyboard = true
config.default_prog = { "zsh" }
-- config.initial_cols = 84
config.initial_rows = 90
config.window_background_opacity = 1
config.use_fancy_tab_bar = true
config.adjust_window_size_when_changing_font_size = false
config.line_height = 1.1
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.use_ime = false
config.max_fps = 60
config.animation_fps = 60
config.front_end = "OpenGL"
-- config.front_end = "WebGpu"
-- config.front_end = "Software"
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
    left = 1,
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
        key = "|",
        mods = "CTRL|SHIFT",
        action = wezterm.action.SplitPane({
            direction = "Right",
            command = { args = { "zsh" } },
            size = { Percent = 50 },
        }),
    },
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
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window, pane)
            local cwd = pane:get_current_working_dir()
            local dir = cwd and cwd.file_path or wezterm.home_dir
            window:perform_action(wezterm.action.SpawnCommandInNewTab({ cwd = dir }), pane)
        end),
    },
    {
        key = "Enter",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window, pane)
            local cwd = pane:get_current_working_dir()
            local dir = cwd and cwd.file_path or wezterm.home_dir
            window:perform_action(wezterm.action.SpawnCommandInNewWindow({ cwd = dir }), pane)
        end),
    },
    {
        key = "w",
        mods = "CTRL|SHIFT",
        action = wezterm.action.CloseCurrentPane({ confirm = true }),
    },
    {
        key = "h",
        mods = "CTRL|SHIFT",
        action = wezterm.action({ ActivatePaneDirection = "Next" })
    },
    {
        key = "l",
        mods = "CTRL|SHIFT",
        action = wezterm.action({ ActivatePaneDirection = "Prev" })
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
