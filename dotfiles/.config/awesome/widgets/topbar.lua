-- Imports
local awful = require("awful")
local wibox = require("wibox")

-- Widgets
local systray = require("widgets.systray")
local taglist = require("widgets.taglist")
local clock = require("widgets.clock")
local volume = require("widgets.volume")
local light = require("widgets.backlight")
-- local bluetooth = require("widgets.bluetooth")

-- Topbar
awful.screen.connect_for_each_screen(function(s)

    -- Panel
    local topbar = awful.wibar({
            position = "top",
            type = "dock",
            screen = s,
            visible = true,

            -- Theming
            height = 32,

            -- Widget
            widget = wibox.widget {
                {
                    -- Left
                    {
                        taglist(s),
                        layout = wibox.layout.fixed.horizontal,
                    },
                    -- Middle
                    {
                        layout = wibox.layout.fixed.horizontal,
                    },
                    -- Right
                    {
                        spacing = 10,
                        layout = wibox.layout.fixed.horizontal,
                        systray,
                        light,
                        volume,
                        clock,
                    },
                    layout = wibox.layout.align.horizontal,
                },
                widget = wibox.container.margin,
                left = 5,
                right = 5,
            },
        })

    end)
