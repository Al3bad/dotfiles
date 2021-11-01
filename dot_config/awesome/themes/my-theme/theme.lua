
local awful = require("awful")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local c = require("themes.my-theme.colors")

awful.util = require("awful.util")

theme_path = awful.util.getdir("config") .. "/themes/my-theme/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

theme = {}

theme.wallpaper          = "~/media/wallpapers/image-1.png"
-- theme.awesome_icon       = theme_path .. "launcher/logo20_kali_black.png"
-- theme.awesome_subicon    = theme_path .. "launcher/logo20_kali_black.png"


local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-------------------------------------------------
--> Font
-------------------------------------------------

theme.font          = "FiraCode Nerd Font 8" -- "Tamsyn 10" -- "Sans 8"
theme.taglist_font  = "FiraCode Nerd Font 9"

-------------------------------------------------
--> Status Bar
-------------------------------------------------

theme.bg_normal     = c.color['black']
theme.bg_focus      = c.color['blue']
theme.bg_urgent     = c.color['grey-dark']
theme.bg_minimize   = c.color['black']
theme.bg_systray    = c.color['black']

theme.fg_normal     = c.color['grey-light']
theme.fg_focus      = c.color['grey-light']
theme.fg_urgent     = c.color['grey-light']
theme.fg_minimize   = c.color['grey-dark']

-------------------------------------------------
--> Window Boarder & Useless Gaps
-------------------------------------------------

theme.useless_gap   = dpi(10)
theme.border_width  = dpi(1)

theme.border_normal = c.color['grey-dark']
theme.border_focus  = c.color['blue']
theme.border_marked = c.color['blue']

-------------------------------------------------
--> Tag List 
-------------------------------------------------

theme.taglist_bg_focus = c.color['blue']
theme.taglist_fg_focus = c.color['black']

-------------------------------------------------
-->  Task List
-------------------------------------------------

theme.tasklist_bg_normal = c.color['black']
theme.tasklist_fg_normal = c.color['grey-light']

theme.tasklist_bg_focus  = c.color['heighlight']
theme.tasklist_fg_focus  = c.color['white']

-------------------------------------------------
--> Window Title Bar
-------------------------------------------------

-- theme.titlebar_bg_normal = c.color['white']   .. "cc"
-- theme.titlebar_bg_focus  = c.color['white']   .. "cc"
-- theme.titlebar_fg_focus  = c.color['black']   .. "cc"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, c.color['grey-dark']
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, c.color['grey-light']
)

-- Display the taglist squares

-- override
theme.taglist_squares_sel      = theme_path .. "taglist/clone/square_sel.png"
theme.taglist_squares_unsel    = theme_path .. "taglist/clone/square_unsel.png"

-- alternate override
-- theme.taglist_squares_sel   = theme_path .. "taglist/copycat-blackburn/square_sel.png"
-- theme.taglist_squares_unsel = theme_path .. "taglist/copycat-blackburn/square_unsel.png"
-- theme.taglist_squares_sel   = theme_path .. "taglist/copycat-zenburn/squarefz.png"
-- theme.taglist_squares_unsel = theme_path .. "taglist/copycat-zenburn/squareza.png"

-------------------------------------------------
--> Mene
-------------------------------------------------

-- theme.menu_submenu_icon  = theme_path .. "misc/default/submenu.png"

theme.menu_height = 20      -- dpi(15)
theme.menu_width  = 180     -- dpi(100)
--theme.menu_context_height = 20

theme.menu_bg_normal = c.color['black']
theme.menu_fg_normal = c.color['white']

theme.menu_bg_focus  = c.color['blue']
theme.menu_fg_focus  = c.color['black']

theme.menu_border_color = c.color['blue']
theme.menu_border_width = 1

-------------------------------------------------
--> Hotkyes
-------------------------------------------------
theme.hotkeys_modifiers_fg = c.color["heighlight"]



-------------------------------------------------

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

return theme

