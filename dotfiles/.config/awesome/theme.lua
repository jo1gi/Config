local awful = require("awful")
local colours = require("colours")

--- Theme settings
local theme = {}

theme.wallpaper = awful.util.getdir("config") .. "wallpaper"

theme.bg_normal           = colours.base00 -- Background color
theme.bg_focus            = theme.bg_normal
theme.bg_urgent           = theme.bg_normal

-- Border
theme.border_width        = 2
theme.border_normal       = theme.bg_normal
theme.border_focus        = colours.base0A
theme.useless_gap         = 10

-- Taglist
theme.taglist_fg_focus    = colours.base0A
theme.taglist_fg_empty    = colours.base03
theme.taglist_fg_occupied = colours.base05
theme.taglist_font        = "sans bold"

-- Rounded Corners
theme.rounded_corners     = false
theme.border_radius       = 16

-- Widgets
theme.widget_icon         = colours.base0C
theme.widget_text         = colours.base05

return theme
