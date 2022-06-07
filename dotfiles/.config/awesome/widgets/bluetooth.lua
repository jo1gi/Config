local wibox = require('wibox')
local beautiful = require('beautiful')
local awful = require('awful')

local icon = wibox.widget {
    markup = '<span font_desc="FontAwesome 12" foreground="' .. beautiful.widget_icon .. '"></span>',
    widget = wibox.widget.textbox,
}

local bluetooth = wibox.widget {
    icon,
    widget = wibox.container.margin,
    left = 3,
    right = 3,
}

local menu = awful.wibox(
    {
        width = 200,
        height = 400,
        visible = false,
        ontop = true,
        type = "popup_menu",
        position = "right",
        y = 42,

        widget = wibox.widget {
            widget = wibox.container.margin,
        },
        update = function()
            awful.spawn.easy_async("bluetoothctl devices", function (stdout)

            end)
        end
    })

bluetooth:connect_signal("button::press", function(_,_,_,button)
    if button == 1 then
        menu.visible = not menu.visible
    end
end)

return bluetooth
