local terminal = "foot"
local fileManager = "dolphin"
local menu = "wofi --show drun"
local mainMod = "SUPER"

-- Monitors
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto"
})

-- General
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 20,
    border_size = 2,
    col = {
      active_border = "rgba(006300ff)",
      inactive_border = "rgba(595959aa)",
    },
    resize_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
  },


  decoration = {
    rounding = 10,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    blur = {
      enabled = true,
      size = 10,
      passes = 1,
      vibrancy = 0.1696,
    },
  }
})

-- Workspace rules (fullscreen/tg apps like games)
hl.workspace_rule({workspace = "w[tv1]",  gaps_out = 0, gaps_in = 0})
hl.workspace_rule({workspace = "f[1]", gaps_out = 0, gaps_in = 0})
hl.window_rule({
    name  = "no-gaps-wtv1",
    match = { float = false, workspace = "w[tv1]" },
    border_size = 0,
    rounding    = 0,
})
hl.window_rule({
    name  = "no-gaps-f1",
    match = { float = false, workspace = "f[1]" },
    border_size = 0,
    rounding    = 0,
})

-- Master layout
hl.config({
  master = {
    new_status = "master",
  }
})

-- Misc
hl.config({
  misc = {
    force_default_wallpaper = 1,
    disable_hyprland_logo = true,
  }
})

-- Input
hl.config({
  input = {
    kb_layout = "de",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",
    follow_mouse = 1,
    sensitivity = 0,
    touchpad = {
      natural_scroll = false,
    },
  }
})

-- xCursor
hl.config({
  cursor = {
    no_hardware_cursors = true,
  }
})
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Nordzy-cursors-white")
hl.env("XCURSOR_THEME", "Nordzy-cursors-white")

-- Debug
hl.config({
  debug = {
    disable_logs = false,
    enable_stdout_logs = true,
  }
})

-- Keybindings
hl.bind(mainMod .. " + Q", function() hl.exec_cmd(terminal) end)
hl.bind(mainMod .. " + C", function() hl.dispatch(hl.dsp.window.kill()) end)
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", function() hl.exec_cmd(fileManager) end)
hl.bind(mainMod .. " + V", function() hl.dispatch(hl.dsp.window.float({ action = "toggle" })) end)
hl.bind(mainMod .. " + R", function() hl.exec_cmd(menu) end)
-- hl.bind(mainMod .. "+J", function() hl.dispatch("togglesplit") end)
--
-- -- Move focus
hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "d" }))
--
-- -- Switch workspaces
for i = 1, 10 do
  local ws = tostring(i == 10 and 0 or i)
  hl.bind(mainMod .. " + " .. ws, hl.dsp.focus({ workspace = i }))
end
--
-- -- Move window to workspace
for i = 1, 10 do
  local ws = tostring(i == 10 and 0 or i)
  hl.bind(mainMod .. " + SHIFT + " .. ws, hl.dsp.window.move({ workspace = i }))
end
--
-- -- Special workspace (scratchpad)
-- hl.bind(mainMod .. "+S", function() hl.dispatch("togglespecialworkspace, magic") end)
-- hl.bind(mainMod .. " SHIFT+S", function() hl.dispatch("movetoworkspace, special:magic") end)
--
-- -- Cycle workspaces
hl.bind("ALT + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("ALT + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
--
-- -- Multimedia keys
-- hl.bindel("+XF86AudioRaiseVolume",  "exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")
-- hl.bindel("+XF86AudioLowerVolume",  "exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
-- hl.bindel("+XF86AudioMute",         "exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
-- hl.bindel("+XF86AudioMicMute",      "exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
-- hl.bindel("+XF86MonBrightnessUp",   "exec, brightnessctl s 10%+")
-- hl.bindel("+XF86MonBrightnessDown", "exec, brightnessctl s 10%-")

-- Autostart
hl.on("hyprland.start", function()
hl.exec_cmd("hyprpaper")
hl.exec_cmd("waybar")
hl.exec_cmd("noctalia")
end)
