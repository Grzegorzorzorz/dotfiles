local mod = 'SUPER'

local scripts = '$HOME/.config/hypr/hyprland/scripts'

hl.config({
   input = {
      kb_layout = 'gb',
      accel_profile = 'flat',
      touchpad = {
         natural_scroll = true,
      },
   },
})

hl.device({
   name = 'wacom-intuos-bt-m-pen',
   output = 'eDP-1',
   active_area_size = { 216, 135 },
})

----------------------------------------------------------------------------------------------------
-- Core bindings
hl.bind(mod .. ' + SHIFT + E', hl.dsp.exec_cmd(scripts .. '/shutdown-hyprland'))
--hl.bind(
--   mod .. ' + SHIFT + E',
--   hl.dsp.exec_cmd('hyprshutdown --no-exit --post-cmd ' .. scripts .. '/shutdown-hyprland')
--)
hl.bind(mod .. ' + SHIFT + R', hl.dsp.exec_cmd('hyprctl reload'))
hl.bind(mod .. ' + SHIFT + Q', hl.dsp.window.close())

----------------------------------------------------------------------------------------------------
-- Workspace manipulation

for i = 1, 10 do
   local key = i % 10
   hl.bind(mod .. ' + ' .. key, hl.dsp.focus({ workspace = i }))
   hl.bind(mod .. ' + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. ' + C', hl.dsp.workspace.toggle_special('comms'))
hl.bind(mod .. ' + M', hl.dsp.workspace.toggle_special('music'))

for _, direction in pairs({ 'left', 'right', 'up', 'down' }) do
end
hl.bind(mod .. '+ CONTROL + left', hl.dsp.focus({ workspace = 'm-1' }))
hl.bind(mod .. '+ CONTROL + right', hl.dsp.focus({ workspace = 'm+1' }))

hl.bind(mod .. ' + SHIFT + SPACE', hl.dsp.window.float({ action = 'toggle' }))
hl.bind(mod .. ' + F', hl.dsp.window.fullscreen({ mode = 'maximized', action = 'toggle' }))
hl.bind(mod .. ' + SHIFT + F', hl.dsp.window.fullscreen({ mode = 'fullscreen', action = 'toggle' }))

for _, direction in pairs({ 'left', 'h' }) do
   hl.bind(mod .. ' + ' .. direction, hl.dsp.focus({ direction = 'left' }))
   hl.bind(mod .. ' + SHIFT + ' .. direction, hl.dsp.window.move({ direction = 'left' }))
   hl.bind(
      mod .. ' + ALT + ' .. direction,
      hl.dsp.window.resize({ x = -10, y = 0, relative = true }),
      { repeating = true }
   )
end

for _, direction in pairs({ 'right', 'l' }) do
   hl.bind(mod .. ' + ' .. direction, hl.dsp.focus({ direction = 'right' }))
   hl.bind(mod .. ' + SHIFT + ' .. direction, hl.dsp.window.move({ direction = 'right' }))
   hl.bind(
      mod .. ' + ALT + ' .. direction,
      hl.dsp.window.resize({ x = 10, y = 0, relative = true }),
      { repeating = true }
   )
end

for _, direction in pairs({ 'up', 'k' }) do
   hl.bind(mod .. ' + ' .. direction, hl.dsp.focus({ direction = 'up' }))
   hl.bind(mod .. ' + SHIFT + ' .. direction, hl.dsp.window.move({ direction = 'up' }))
   hl.bind(
      mod .. ' + ALT + ' .. direction,
      hl.dsp.window.resize({ x = 0, y = -10, relative = true }),
      { repeating = true }
   )
end

for _, direction in pairs({ 'down', 'j' }) do
   hl.bind(mod .. ' + ' .. direction, hl.dsp.focus({ direction = 'down' }))
   hl.bind(mod .. ' + SHIFT + ' .. direction, hl.dsp.window.move({ direction = 'down' }))
   hl.bind(
      mod .. ' + ALT + ' .. direction,
      hl.dsp.window.resize({ x = 0, y = 10, relative = true }),
      { repeating = true }
   )
end

hl.bind(mod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })
----------------------------------------------------------------------------------------------------
-- Programs

-- Shell
hl.bind(mod .. ' + D', hl.dsp.global('grzell-launcher:toggle'))
hl.bind(mod .. ' + CONTROL + L', hl.dsp.exec_cmd('loginctl lock-session'))

-- Shortcuts
hl.bind(mod .. ' + RETURN', hl.dsp.exec_cmd('kitty'))
hl.bind(mod .. ' + B', hl.dsp.exec_cmd('librewolf'))
hl.bind(mod .. ' + T', hl.dsp.exec_cmd('thunar'))

-- Shits and giggles
hl.bind(
   mod .. ' + SHIFT + CONTROL + ALT + L',
   hl.dsp.exec_cmd('librewolf --new-window https://linkedin.com/')
)

-- Media keys
hl.bind('XF86Calculator', hl.dsp.exec_cmd('qalculate-gtk'))

hl.bind('Print', hl.dsp.exec_cmd(scripts .. '/screenshot'))
hl.bind('SHIFT + Print', hl.dsp.exec_cmd(scripts .. '/screenshot-area'))
hl.bind('CONTROL + SHIFT + Print', hl.dsp.exec_cmd(scripts .. '/screenshot-area-edit'))

hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd('xbacklight -inc 10'))
hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd('xbacklight -dec 10'))

hl.bind('ALT + left', hl.dsp.exec_cmd('playerctl previous'), { locked = true })
hl.bind('ALT + down', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind('ALT + right', hl.dsp.exec_cmd('playerctl next'), { locked = true })

hl.bind('XF86AudioNext', hl.dsp.exec_cmd('playerctl next'))
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd('playerctl play-pause'))
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd('playerctl previous'))

-- We bind both here because my laptop uses a different key for this than my keyboard, and
-- my keyboard isn't especially cooperative in binding that specific keycode.
hl.bind('XF86Launch4', hl.dsp.exec_cmd(scripts .. '/power-profiles-cycle'))
hl.bind('XF86Launch5', hl.dsp.exec_cmd(scripts .. '/power-profiles-cycle'))

hl.bind(
   'XF86AudioRaiseVolume',
   hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_SINK@ 5%+ -l 1'),
   { locked = true }
)
hl.bind(
   'XF86AudioLowerVolume',
   hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_SINK@ 5%- -l 1'),
   { locked = true }
)
hl.bind('XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_SINK@ toggle'), { locked = true })
