--- Imports
local awful = require("awful") 
local beautiful = require("beautiful")

local keys = require("config.keys")

--- Rules
rules = {
    -- General Rules
    { 
	rule = { },
	properties = {
	    border_width = beautiful.border_width,
	    border_color = beautiful.border_normal,
	    focus = awful.client.focus.filter,
	    raise = true,
	    keys = clientkeys,
	    buttons = clientbuttons,
	    screen = awful.screen.preferred,
	    placement = awful.placement.no_overlap+awful.placement.no_offscreen,
	    rounded_corners = beautiful.rounded_corners
	}
    },
    -- Remove rounded corners
    {
	rule_any = {
	    class = {
		"Minecraft* 1.15.2",
		"Minecraft* 1.16.1",
		"Steam",
		"vlc"
	    }
	},
	properties = {
	    rounded_corners = false
	}
    }
}

-- Extra rules for rounded corners
if beautiful.rounded_corners
then
   table.insert(rules, {
		   rules_any = {
		      class = {
			 "Emacs"
		      }
		   },
		   properties = {
		      border_width = 10,
		   },
   })
end

return rules
