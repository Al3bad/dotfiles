
-- Standard awesome library
local awful     = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local c = require("themes.my-theme.colors")
local lain  = require("lain")

local WB = wibox_package

-------------------------------------------------
--> Widgets
-------------------------------------------------

-- Clock
mytextclock = wibox.widget({ widget = wibox.widget.textclock, align = "center"})

-- Keyboard Layout
mykeyboardlayout = awful.widget.keyboardlayout()

-- RAM
markup = lain.util.markup
mem = lain.widget.mem({
  settings = function()
    widget:set_markup(markup(c.color['blue'], mem_now.used .. "M "))
  end
})
mem_prefix = wibox.widget.textbox()
mem_prefix.text = "MEM: "
mem_prefix.font = "FiraCode Nerd Font 10"

-- CPU
cpu = lain.widget.cpu({
  settings = function()
    widget:set_markup(markup(c.color['blue'], cpu_now.usage .. "% "))
  end
})
cpu_prefix = wibox.widget.textbox()
cpu_prefix.text = "CPU: "
cpu_prefix.font = "FiraCode Nerd Font 10"

-- Filesystem
fs = lain.widget.fs({
  settings  = function()
    widget:set_markup(markup(c.color['blue'], fs_now["/"].percentage .. "% "))
  end
})
fs_prefix = wibox.widget.textbox()
fs_prefix.text = "FS: "
fs_prefix.font = "FiraCode Nerd Font 10"

-- Local IP
ip = wibox.widget.textbox()
local cmd = awful.spawn.easy_async_with_shell (
        -- Commnad that will be executed in the shell
        "ip route get 1.2.3.4 | awk '{printf $7}'",
        -- Callback function after executing the command
        function (stdout, stderr, reason, exitcode)
            ip:set_markup(markup(c.color["blue"], stdout))
        end
    )
ip_prefix = wibox.widget.textbox()
ip_prefix.text = "IP: "
ip_prefix.font = "FiraCode Nerd Font 10"

-------------------------------------------------
--> Setup Status Bar: Left
-------------------------------------------------

function WB.add_widgets_left (s)
  return { -- Left widgets
    layout = wibox.layout.fixed.horizontal,
    RC.launcher,
    s.taglist,
    WB. spacer, WB.arrow_dr, WB.arrow_rd,
    -- s.promptbox,
  }
end

-------------------------------------------------
--> Setup Status Bar: Middle
-------------------------------------------------

function WB.add_date (s)
  return  { 
      layout = wibox.container.place, 
      mytextclock,
      halign = "center"
  }
end

-------------------------------------------------
--> Setup Status Bar: Right
-------------------------------------------------

function WB.add_widgets_right (s)
  return { -- Right widgets
    layout = wibox.layout.fixed.horizontal,
    -- wibox.widget.systray(),
    WB.spacer, WB.arrow_dl, WB.arrow_ld, WB.spacer,
    ip_prefix, ip, WB.spacer,
    cpu_prefix, cpu,
    mem_prefix, mem,
    fs_prefix, fs,
    WB.arrow_dl, WB.arrow_ld,
    mykeyboardlayout,
    s.layoutbox,
  }
end

-------------------------------------------------
--> Setup Status Bar
-------------------------------------------------

function WB.generate_wibox_top (s)
  -- Create the wibox
  s.wibox_top = awful.wibar({ position = "top", screen = s })

  -- Add widgets to the wibox
    s.wibox_top:setup {
        layout = wibox.layout.stack,
        {
            layout = wibox.layout.align.horizontal,
            WB.add_widgets_left (s),
            nil,
            WB.add_widgets_right (s),
        },
        WB.add_date(s)
  }

end
