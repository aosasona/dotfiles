local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

-- From fasterthanlime/dotfiles (https://github.com/fasterthanlime/dotfiles/blob/main/.wezterm.lua)
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local is_windows = function()
	return wezterm.target_triple:find("windows") ~= nil
end

--

if is_windows() then
	config.default_prog = { "bash" }
end

config.front_end = "WebGpu"
config.check_for_updates = true
config.show_update_window = true

-- Font settings
config.font_size = 11.25
config.line_height = 1.175
-- config.freetype_load_target = "Light"
config.font = wezterm.font("IosevkaTerm Nerd Font Mono")
-- config.font = wezterm.font("GeistMono Nerd Font Mono")
-- config.font = wezterm.font("CommitMono", { weight = "Regular" })
-- config.font = wezterm.font("SFMono Nerd Font") -- preferred
-- config.font = wezterm.font("DankMono Nerd Font Mono") -- awesome,
-- config.font = wezterm.font("JetBrainsMono Nerd Font") -- fine
-- config.font = wezterm.font("Zed Mono") -- very nice, similar to Iosevka
-- config.font = wezterm.font("Zed Mono", { stretch = "Expanded" })
-- config.font = wezterm.font("BlexMono Nerd Font")
-- config.font = wezterm.font("Fira Code", { stretch = "Normal", weight = "Regular" })
-- config.font = wezterm.font("Operator Mono Lig", { weight = 325 })

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true
config.disable_default_key_bindings = true

-- Window settings
config.default_cursor_style = "SteadyBlock"
config.color_scheme = "GruvboxDarkHard"
config.native_macos_fullscreen_mode = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.hide_tab_bar_if_only_one_tab = true

------- Keybindings -------
---
---
---
--
---- LEADER => C-a
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1500 }
--
-- LEADER + r => reload configuration
-- CMD + c,v => Copy, paste
-- CMD + LeftArrow => Switch to left Tab
-- CMD + RightArrow => Switch to right Tab
-- CMD + t => Create new tab using current pane domain (same directory)
-- OPTION + [,] => Move active tab
-- LEADER + ` => Show pane selector
-- CMD + <- => Switch to left tab
-- CMD + -> => Switch to right tab
--
-- LEADER + | => Split pane horizontal (left | right)
-- LEADER + _ => Split pane vertical (top | bottom)
--
-- OPTION + SHIFT + H,J,K,L => Resize active pane
-- OPTION + h,j,k,l => Switch active pane
-- OPTION + w => Close current pane
--
-- Some of these keybindings are remapped to use Zellij's mappings since Zellij does not support using the CMD key as a modifier
config.keys = {
	-- Special mappings to keep keys that require composed option working on MacOS
	-- EURO
	{
		key = "2",
		mods = "ALT",
		action = act.SendKey({ key = "€" }),
	},
	-- Hash
	{
		key = "3",
		mods = "ALT",
		action = act.SendKey({ key = "#" }),
	},

	{
		key = "f",
		mods = "LEADER",
		action = wezterm.action.ToggleFullScreen,
	},
	-- Reload config
	{
		key = "r",
		mods = "LEADER",
		action = act.ReloadConfiguration,
	},
	-- Create new tab - remapped to use Zellij's mapping
	{
		key = "t",
		mods = "CMD",
		action = act.SendKey({ key = "N", mods = "ALT" }),
	},
	-- {
	-- 	key = "T",
	-- 	mods = "CMD",
	-- 	action = act.SpawnTab("DefaultDomain"),
	-- },
	-- Paste/Copy
	{
		key = "v",
		mods = "CMD",
		action = act.PasteFrom("Clipboard"),
	},
	{
		key = "c",
		mods = "CMD",
		action = act.CopyTo("ClipboardAndPrimarySelection"),
	},

	-- Tab switching mappings
	{
		key = "LeftArrow",
		mods = "SUPER",
		action = act.SendKey({
			key = "H",
			mods = "ALT",
		}),
	},
	{
		key = "RightArrow",
		mods = "SUPER",
		action = act.SendKey({ key = "L", mods = "ALT" }),
	},

	-- Pane splitting mappings
	{
		key = "|",
		mods = "LEADER",
		action = act.SendKey({ key = "|", mods = "ALT" }),
	},
	{
		key = "_",
		mods = "LEADER",
		action = act.SendKey({ key = "_", mods = "ALT" }),
	},

	-- Pane size adjustment mappings
	-- {
	-- 	key = "H",
	-- 	mods = "ALT",
	-- 	action = act.AdjustPaneSize({ "Left", 5 }),
	-- },
	-- {
	-- 	key = "L",
	-- 	mods = "ALT",
	-- 	action = act.AdjustPaneSize({ "Right", 5 }),
	-- },
	-- {
	-- 	key = "K",
	-- 	mods = "ALT",
	-- 	action = act.AdjustPaneSize({ "Up", 5 }),
	-- },
	-- {
	-- 	key = "J",
	-- 	mods = "ALT",
	-- 	action = act.AdjustPaneSize({ "Down", 5 }),
	-- },

	-- Pane switching mappings
	-- {
	-- 	key = "h",
	-- 	mods = "ALT",
	-- 	action = act.ActivatePaneDirection("Left"),
	-- },
	-- {
	-- 	key = "l",
	-- 	mods = "ALT",
	-- 	action = act.ActivatePaneDirection("Right"),
	-- },
	-- {
	-- 	key = "k",
	-- 	mods = "ALT",
	-- 	action = act.ActivatePaneDirection("Up"),
	-- },
	-- {
	-- 	key = "j",
	-- 	mods = "ALT",
	-- 	action = act.ActivatePaneDirection("Down"),
	-- },

	-- Move tab mapping
	{
		key = "]",
		mods = "ALT",
		action = act.SendKey({ key = "o", mods = "ALT" }),
	},
	{
		key = "[",
		mods = "ALT",
		action = act.SendKey({ key = "i", mods = "ALT" }),
	},
	--
	-- Show pane selector
	{
		key = "`",
		mods = "LEADER",
		action = act.PaneSelect({
			mode = "Activate",
		}),
	},

	-- Change font size
	{
		key = "+",
		mods = "CMD",
		action = act.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "CMD",
		action = act.DecreaseFontSize,
	},

	-- Command palette
	{
		key = "k",
		mods = "CMD",
		action = act.ActivateCommandPalette,
	},
}

-- SSH domains
config.ssh_domains = {
	{
		-- This name identifies the domain
		name = "playd-dev",
		-- The hostname or address to connect to. Will be used to match settings
		-- from your ssh config file
		remote_address = "playd-dev",
		-- The username to use on the remote host
		username = "trulyao",
	},
}

return config
