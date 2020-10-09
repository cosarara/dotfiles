-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

-- {{{ Main
theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome/mytheme"
--theme.wallpaper = "/usr/share/awesome/themes/zenburn/zenburn-background.png"
-- }}}

-- {{{ Styles
theme.font      = "Terminus 12"
theme.icon_font      = "Terminusicons2Mono 9"

--[[ {{{ Colors
theme.fg_normal  = "#DCDCCC"
theme.fg_focus   = "#F0DFAF"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = "#3F3F3F"
theme.bg_focus   = "#1E2320"
theme.bg_urgent  = "#3F3F3F"
theme.bg_systray = theme.bg_normal
-- }}}
--]]

-- {{{ Colors
--theme.bg_normal     = "#222222FF"
theme.bg_normal     = "#f4f1e4FF"
theme.taglist_bg_occupied   = theme.bg_normal
--theme.taglist_bg_empty = "#223322EE"
--theme.bg_focus      = "#d8d8d8"
--theme.bg_focus      = "#101010EE"
--theme.taglist_bg_focus = "#104040EE"
--theme.taglist_bg_focus = "#101010EE"
theme.taglist_bg_focus = "#5C5955EE"
--theme.bg_focus      = theme.bg_normal
theme.bg_focus      = "#FF8080FF"
theme.bg_urgent     = "#d02e54EE"
--theme.bg_minimize   = "#444444EE"
theme.bg_minimize   = "#2A2A2AEE"


--theme.taglist_fg_occupied
--theme.taglist_bg_empty
--theme.taglist_fg_empty

theme.fg_normal     = "#000000"
--theme.fg_focus      = "#000000"
--theme.fg_focus      = "#cccccc"
--theme.fg_focus      = "#aaddbb"
--theme.fg_focus      = "#880000"
theme.fg_focus      = theme.fg_normal
theme.taglist_fg_focus = "#cccccc"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

--theme.clock_color = "#EDE391"
theme.clock_color = "#590f5b"
theme.music_color = "#992e2e"
theme.volume_color = "#12314b"
-- }}}

-- {{{ Borders
theme.useless_gap = 8
--theme.useless_gap_width   = 10
theme.border_width  = 1
theme.border_normal = "#3F3F3F"
--theme.border_normal = "#747474"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#939393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

theme.tasklist_floating = '[f] '
--theme.tasklist_floating_icon = theme.dir .. "/taglist/squarefz.png"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}
--theme.taglist_bg_focus  = "#222222EE"
--theme.taglist_bg_focus = "#000000"

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 15
theme.menu_width  = 100
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_disable_icon = true
---- theme.taglist_squares_sel   = "/usr/share/awesome/themes/zenburn/taglist/squarefz.png"
--theme.taglist_squares_sel   = theme.dir .. "/taglist/squarefz.png"
---- theme.taglist_squares_unsel = "/usr/share/awesome/themes/zenburn/taglist/squarez.png"
--theme.taglist_squares_unsel   = theme.dir .. "/taglist/squarez.png"
----theme.taglist_disable_icon = "true"
----theme.taglist_squares_sel   = ""
----theme.taglist_squares_unsel = ""
----theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = "/usr/share/awesome/themes/zenburn/awesome-icon.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"
-- }}}


local self = "~/.config/awesome/lighttheme/"

theme.layout_icon_size = 12
-- {{{ Layout
theme.layout_tile       = self.."layouts/tile.png"
theme.layout_fairv      = self.."layouts/fair.png"
theme.layout_termfair   = self.."layouts/termfair.png"
theme.layout_spiral     = self.."layouts/spiral.png"
theme.layout_floating   = self.."layouts/floating.png"
theme.layout_fullscreen = self.."layouts/fullscreen.png"
--theme.layout_tile       = "/usr/share/awesome/themes/default/layouts/tile.png"
--theme.layout_tileleft   = "/usr/share/awesome/themes/default/layouts/tileleft.png"
--theme.layout_tilebottom = "/usr/share/awesome/themes/default/layouts/tilebottom.png"
--theme.layout_tiletop    = "/usr/share/awesome/themes/default/layouts/tiletop.png"
--theme.layout_fairv      = "/usr/share/awesome/themes/default/layouts/fairv.png"
--theme.layout_fairh      = "/usr/share/awesome/themes/default/layouts/fairh.png"
--theme.layout_spiral     = "/usr/share/awesome/themes/default/layouts/spiral.png"
--theme.layout_dwindle    = "/usr/share/awesome/themes/default/layouts/dwindle.png"
--theme.layout_max        = "/usr/share/awesome/themes/default/layouts/max.png"
--theme.layout_fullscreen = "/usr/share/awesome/themes/default/layouts/fullscreen.png"
--theme.layout_magnifier  = "/usr/share/awesome/themes/default/layouts/magnifier.png"
--theme.layout_floating   = "/usr/share/awesome/themes/default/layouts/floating.png"
--theme.layout_cornernw   = "/usr/share/awesome/themes/default/layouts/cornernw.png"
--theme.layout_cornerne   = "/usr/share/awesome/themes/default/layouts/cornerne.png"
--theme.layout_cornersw   = "/usr/share/awesome/themes/default/layouts/cornersw.png"
--theme.layout_cornerse   = "/usr/share/awesome/themes/default/layouts/cornerse.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/zenburn/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

theme.systray_icon_spacing = 5
--theme.bg_systray = "#FF0"

theme.compton_inactive = self.."compton_grayscale_16x16.png"

return theme
