hl.config({
   xwayland = {
      force_zero_scaling = true,
   },
   general = {
      border_size = 0,
      gaps_out = 8,
   },
   decoration = {
      rounding = 16,
      rounding_power = 2,
      shadow = {
         enabled = false,
      },
   },
   misc = {
      disable_hyprland_logo = true,
      disable_splash_rendering = true,
      background_color = 0x000000,
   },
})

-- Keep maximised workspaces flush against the edges.
hl.workspace_rule({ workspace = 'f[1]', gaps_out = 0, no_rounding = true })

-- Curves

hl.curve('easeInOutQuint', {
   type = 'bezier',
   points = { { 0.83, 0 }, { 0.17, 1 } },
})
hl.curve('easeInOutQuad', {
   type = 'bezier',
   points = { { 0.45, 0 }, { 0.55, 1 } },
})
hl.curve('easeOutSine', {
   type = 'bezier',
   points = { { 0.61, 1.0 }, { 0.88, 1.0 } },
})
hl.curve('easeOutExpo', {
   type = 'bezier',
   points = { { 0.16, 1.0 }, { 0.3, 1.0 } },
})

hl.curve('monitor', { type = 'spring', mass = 1, stiffness = 75, dampening = 100 })

-- Animations

hl.animation({
   leaf = 'workspaces',
   enabled = true,
   speed = 4,
   bezier = 'easeOutExpo',
   type = 'slide',
})

hl.animation({
   leaf = 'monitorAdded',
   enabled = true,
   speed = 7.5,
   --bezier = 'easeOutSine',
   spring = 'monitor',
})
