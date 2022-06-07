-- Imports
local awful = require("awful")
local wibox = require("wibox")

-- Widget
local function get_taglist(s)
   local taglist = awful.widget.taglist {
      screen = s,
      filter  = awful.widget.taglist.filter.all,
      widget_template = {
	 {
	    id = "text_role",
	    widget = wibox.widget.textbox,
	 },
	 widget = wibox.container.margin,
	 left = 5,
	 right = 5,
      },
   }
   return taglist
end
return get_taglist
