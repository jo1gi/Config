local wibox = require("wibox")
local beautiful = require('beautiful')
local colours = require("colours")

local text = wibox.widget {
    format = '<span font_desc="sans bold 8" foreground="' .. beautiful.widget_text .. '">%H:%M</span>',
    widget = wibox.widget.textclock,
}

local icon = wibox.widget {
    {
	markup = '<span font_desc="FontAwesome 14" foreground="' .. beautiful.widget_icon .. '"></span>',
	widget = wibox.widget.textbox,
    },
    right = 5,
    widget = wibox.container.margin,
}

local clock = wibox.widget {
    {
	icon,
	text,
	layout = wibox.layout.align.horizontal,
    },
    widget = wibox.container.margin,
    right = 5,
}

return clock
