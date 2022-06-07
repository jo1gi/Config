--- Imports
local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Widgets
local prompt = require("widgets.prompt")
local volume = require("widgets.volume")
local light = require("widgets.backlight")

--- Key Bindings
globalkeys = gears.table.join(
    awful.key({ modkey,}, "s", hotkeys_popup.show_help, {description="show help", group="awesome"}),
    awful.key({ modkey, }, "Escape", awful.tag.history.restore, {description = "go back", group = "tag"}),
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ "Mod1", }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Launching programs
    awful.key({ "Ctrl", "Mod1", }, "t", function () awful.spawn("alacritty") end,
	{description = "open a terminal", group = "launcher"}),
    awful.key({"Ctrl", "Mod1", }, "f", function () awful.spawn("firefox") end,
	{description = "Open Firefox", group = "launcher"}),
    awful.key({"Ctrl", "Mod1", }, "d", function () awful.spawn("nautilus") end,
	{description = "Open Dolphin", group = "launcher"}),
    awful.key({"Ctrl", "Mod1", }, "g", function () awful.spawn("emacsclient -c") end,
	{description = "Open Emacs", group = "launcher"}),
    awful.key({"Mod1", }, "space", function () awful.spawn("rofi -show drun") end,
	{description = "Open Rofi", group = "launcher"}),
    awful.key({modkey, }, "space", function () awful.spawn("rofi -show window") end,
	{description = "Open Rofi (Window)", group = "launcher"}),

    -- Awesome
    awful.key({ modkey, "Control" }, "r", awesome.restart,
	{description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
	{description = "quit awesome", group = "awesome"}),

    -- Desktops
    awful.key({ "Ctrl", "Mod1", }, "Left", awful.tag.viewprev, {description = "view previous", group = "tag"}),
    awful.key({ "Ctrl", "Mod1", }, "Right", awful.tag.viewnext, {description = "view next", group = "tag"}),

    -- System
    awful.key({}, "XF86AudioLowerVolume", function () awful.spawn("pamixer --allow-boost -d 5"); volume.update() end,
	{description = "Lower Volume", group = "system"}),
    awful.key({}, "XF86AudioRaiseVolume", function () awful.spawn("pamixer --allow-boost -i 5"); volume.update() end,
	{description = "Raise Volume", group = "system"}),
    awful.key({}, "XF86MonBrightnessUp", function () awful.spawn("light -A 5"); light.update() end,
	{description = "Raise Backlight", group = "system"}),
    awful.key({}, "XF86MonBrightnessDown", function () awful.spawn("light -U 5"); light.update() end,
	{description = "Lower Backlight", group = "system"}),
    awful.key({}, "XF86AudioPlay", function () awful.spawn("mpc toggle") end, 
	{description = "Play/Pause Media", group="system"}),
    awful.key({}, "XF86AudioNext", function () awful.spawn("mpc next") end,
	{description = "Next Track", group="system"}),
    awful.key({}, "XF86AudioPrev", function () awful.spawn("mpc prev") end, 
	{description = "Previous Track", group="system"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),

    -- Screens
    awful.key({ "Ctrl", modkey }, "Right", function() awful.screen.focus_relative(1) end),
    awful.key({ "Ctrl", modkey }, "Left", function() awful.screen.focus_relative(-1) end)
)

clientkeys = gears.table.join(
    awful.key({ modkey, "Shift"}, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, }, "q", function (c) c:kill() end, {description = "close", group = "window"}),
    awful.key({ modkey, }, "f", awful.client.floating.toggle, {description = "toggle floating", group = "window"}),
    awful.key({ modkey, }, "Return", function (c) c:swap(awful.client.getmaster()) end, {description = "move to master", group = "window"}),
    awful.key({ modkey, }, "t", function (c) c.ontop = not c.ontop end, {description = "toggle keep on top", group = "window"}),
    awful.key({ modkey, }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "window"})
)

-- Bind all key numbers to tags.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
