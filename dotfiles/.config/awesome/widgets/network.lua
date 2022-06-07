-- Imports
local wibox = require("wibox")
local colours = require("colours")

-- Function
local function get_markup(i)
   return '<span font_desc="FontAwesome 8" foreground="' .. colours.base0C .. '">' .. i .. '</span>'
end
      

-- Widget
local network = wibox.widget {
   image = "/home/jo1gi/.config/awesome/icons/wired.svg",
   resize = false,
   widget = wibox.widget.imagebox,
}

return network
