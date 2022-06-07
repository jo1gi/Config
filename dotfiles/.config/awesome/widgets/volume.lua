local wibox = require("wibox")
local colours = require("colours")
local awful = require("awful")
local beautiful = require("beautiful")

local icon = wibox.widget {
    markup = '<span font_desc="FontAwesome 14" foreground="' .. beautiful.widget_icon .. '"></span>',
    widget = wibox.widget.textbox,
}

local create_text = function(v)
    return '<span font_desc="sans bold 8" foreground="' .. beautiful.widget_text .. '">' .. v .. '%</span>'
end

local text = wibox.widget {
    markup = create_text("10"),
    widget = wibox.widget.textbox,
}

local text_margin = wibox.widget {
    text,
    left = 5,
    widget = wibox.container.margin,
}

local volume = wibox.widget {
    {
	icon,
	text_margin,
	layout = wibox.layout.align.horizontal,
    },
    icon,
    widget = wibox.container.margin,
    left = 5,
    right = 5,
    update = function()
	awful.spawn.easy_async("pamixer --get-volume",
		function (stdout)
			local percentage = string.sub(stdout, 0, string.len(stdout)-1)
			text.markup = create_text(percentage)
		end)
    end,
}

volume.update()
return volume
