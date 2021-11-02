
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- reading
-- https://awesomewm.org/apidoc/classes/signals.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-------------------------------------------------
--> Title bar
-------------------------------------------------
-- require("deco.titlebar")

-------------------------------------------------
--> Signal when a new client appears
-------------------------------------------------
client.connect_signal("manage", function (c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
  end
end)

-------------------------------------------------
--> Signal when a client is distroyed
-------------------------------------------------
function focus_client() 
    -- Get selected tag
    local current_tag = awful.screen.focused().selected_tag
    -- Get all clients in the current tag
    local clients = current_tag:clients()
    -- If there is a clients in the in the current tag, focus on the first one
    for i in pairs(clients) do 
        client.focus = clients[i]
        break;
    end
end

client.connect_signal("unmanage", focus_client)


-------------------------------------------------
--> Sloppy focus: Focus follows mouse
-------------------------------------------------
-- client.connect_signal("mouse::enter", function(c)
--     c:emit_signal("request::activate", "mouse_enter", {raise = false})
-- end)

-------------------------------------------------
--> Window focus
-------------------------------------------------
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)



