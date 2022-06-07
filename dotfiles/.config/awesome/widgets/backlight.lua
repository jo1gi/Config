local wibox = require("wibox")
local colours = require("colours")
local awful = require("awful")
local beautiful = require("beautiful")

local icon = wibox.widget {
    markup = '<span font_desc="FontAwesome 14" foreground="' .. beautiful.widget_icon .. '"></span>',
    widget = wibox.widget.textbox,
}

local create_text = function(v)
    return '<span font_desc="sans bold 8" foreground="' .. beautiful.widget_text .. '">' .. v .. '%</span>'
end

local text = wibox.widget {
    markup = create_text("100"),
    widget = wibox.widget.textbox,
}

local text_margin = wibox.widget {
    text,
    left = 5,
    widget = wibox.container.margin,
}

local light = wibox.widget {
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
        awful.spawn.easy_async("light -G",
            function (stdout)
                local percentage = math.floor(string.sub(stdout, 0, string.len(stdout)-1)+0.5)
                text.markup = create_text(percentage)
            end
        )
    end,
}

light.update()
return light
