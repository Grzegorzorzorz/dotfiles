hl.env('AQ_DRM_DEVICES', '/dev/dri/by-friendly-name/pawel:/dev/dri/by-friendly-name/mieczyslaw')

hl.env('NVD_BACKEND', 'direct')
hl.env('__GL_MaxFramesAllowed', '1')
hl.env('PROTON_ENABLE_NGX_UPDATER', '1')
hl.env('VDPAU_DRIVER', 'va_gl')

hl.env('XDG_CURRENT_DESKTOP', 'Hyprland')
hl.env('XDG_SESSION_TYPE', 'wayland')
hl.env('XDG_SESSION_DESKTOP', 'Hyprland')

hl.env('SDL_VIDEODRIVER', 'wayland')
hl.env('GDK_BACKEND', 'wayland,x11')
hl.env('QT_QPA_PLATFORM', 'wayland;xcb')
hl.env('QT_QPA_PLATFORMTHEME', 'gtk2')
hl.env('CLUTTER_BACKEND', 'wayland')

hl.env('XCURSOR_SIZE', '24')
hl.env('HYPRCURSOR_THEME', 'BreezeHypr-Light')
hl.env('HYPRCURSOR_SIZE', '24')

hl.env('SVDIR', '$HOME/.local/service')
