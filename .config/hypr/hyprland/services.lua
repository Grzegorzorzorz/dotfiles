hl.on('hyprland.start', function()
   hl.exec_cmd('runsvdir $HOME/.local/service')
end)

hl.on('hyprland.shutdown', function()
   hl.exec_cmd('sv stop shell')
   hl.exec_cmd('sv stop wallpaper')
   hl.exec_cmd('touch ~/exit-hook')
end)
