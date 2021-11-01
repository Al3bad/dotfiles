pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

-- User-defined variables
RC = {}
RC.vars = require("main.user-variables")

-- Custom local library
local main = {
    layouts = require("main.layouts"),
    tags    = require("main.tags"),
    menu    = require("main.menu"),
    rules   = require("main.rules"),
}

local binding = {
    globalbuttons = require("binding.globalbuttons"),
    clientbuttons = require("binding.clientbuttons"),
    globalkeys    = require("binding.globalkeys"),
    bindtotags    = require("binding.bindtotags"),
    clientkeys    = require("binding.clientkeys")
}

-- Default modkey (Mod4 is the key between Crtl & Alt)
-- Use xmodmap tool to remap Mod4
modkey = RC.vars.modkey

-------------------------------------------------
--> Error Handling
-------------------------------------------------

require("main.error-handling")

-------------------------------------------------
--> Theme
-------------------------------------------------
beautiful.init("~/.config/awesome/themes/my-theme/theme.lua")
beautiful.useless_gap = 10

-------------------------------------------------
--> Layout
-------------------------------------------------
RC.layouts = main.layouts()

-------------------------------------------------
--> Tags
-------------------------------------------------
RC.tags = main.tags()

-------------------------------------------------
--> Mnue
-------------------------------------------------
RC.mainmenu = awful.menu({ items = main.menu() })
RC.launcher = awful.widget.launcher(
  { image = beautiful.awesome_icon, menu = RC.mainmenu }
)
menubar.utils.terminal = RC.vars.terminal

-------------------------------------------------
--> Rules
-------------------------------------------------
awful.rules.rules = main.rules(binding.clientkeys(), binding.clientbuttons())

-------------------------------------------------
--> Statusbar : Wibar
-------------------------------------------------
local statusbar = require("statusbar.my-status-bar.statusbar")
statusbar()

-------------------------------------------------
--> Singlas
-------------------------------------------------
require("main.signals")

-------------------------------------------------
--> Bindings 
-------------------------------------------------
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)


root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

mykeyboardlayout = awful.widget.keyboardlayout()

-------------------------------------------------
--> Autostart Applications/Scripts
-------------------------------------------------

awful.spawn.with_shell("picom")



