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
hl.bind(mod .. ' + SHIFT + E', hl.dsp.exec_cmd(scripts .. '/shutdown-hyprland > /tmp/sd.log'))
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
   hl.bind(mod .. ' + ' .. direction, hl.dsp.focus({ direction = direction }))
   hl.bind(mod .. ' + SHIFT + ' .. direction, hl.dsp.window.move({ direction = direction }))
end
hl.bind(mod .. '+ CONTROL + left', hl.dsp.focus({ workspace = 'm-1' }))
hl.bind(mod .. '+ CONTROL + right', hl.dsp.focus({ workspace = 'm+1' }))

hl.bind(mod .. ' + SHIFT + SPACE', hl.dsp.window.float({ action = 'toggle' }))
hl.bind(mod .. ' + F', hl.dsp.window.fullscreen({ mode = 'maximized', action = 'toggle' }))
hl.bind(mod .. ' + SHIFT + F', hl.dsp.window.fullscreen({ mode = 'fullscreen', action = 'toggle' }))

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
hl.bind('XF86Calculator', hl.dsp.exec_cmd('qalculate-gtk'))

-- Media keys
hl.bind('Print', hl.dsp.exec_cmd(scripts .. '/screenshot'))
hl.bind('SHIFT + Print', hl.dsp.exec_cmd(scripts .. '/screenshot-area'))
hl.bind('CONTROL + SHIFT + Print', hl.dsp.exec_cmd(scripts .. '/screenshot-area-edit'))
hl.bind('ALT + left', hl.dsp.exec_cmd('playerctl previous'), { locked = true })
hl.bind('ALT + down', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind('ALT + right', hl.dsp.exec_cmd('playerctl next'), { locked = true })

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
