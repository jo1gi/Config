-- Imports
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require('beautiful')
local colours = require("colours")
local gears = require("gears")

local toggle_markup = function(t) return '<span font_desc="FontAwesome 14" foreground="' .. beautiful.widget_icon .. '"><b>' .. t .. '</b></span>' end

-- Toggle Button
local toggle = wibox.widget {
   markup = toggle_markup(""),
   widget = wibox.widget.textbox,
   right = 10,
}

-- Application icons widget
local icons = wibox.widget.systray()
icons.visible = false

-- Combine
local systray = wibox.widget {
    {
	toggle,
	{
	    icons,
	    left = 5,
	    widget = wibox.container.margin,
	},
	layout = wibox.layout.align.horizontal,
    },
    widget = wibox.container.margin,
    visible = true,
}

-- Toggle visibility of systray
local toggle_systray = function()
   icons.visible = not icons.visible
   if icons.visible then
      toggle.markup = toggle_markup("")
   else
      toggle.markup = toggle_markup("")
   end
end	

toggle:buttons(gears.table.join(
	awful.button({ }, 1, function ()
	      toggle_systray()
	end)
))

return systray
