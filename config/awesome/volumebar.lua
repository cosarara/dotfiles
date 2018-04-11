-------------------------------------------------
-- Volume Bar Widget for Awesome Window Manager
-- Shows the current volume level
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/volumebar-widget

-- @author Pavel Makhov
-- @copyright 2017 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local gears = require("gears")
local spawn = require("awful.spawn")
local watch = require("awful.widget.watch")
local wibox = require("wibox")

local beautiful = require("beautiful")
beautiful.init("~/.config/awesome/mytheme/theme.lua")
local widget_wrapper = wibox.layout.fixed.horizontal()
local util = require("awful.util")

local request_command = 'amixer -D pulse sget Master'

--local bar_color = "#74aeab"
local bar_color = theme.volume_color
local mute_color = "#de935f"
local background_color = "#404a53"

local volumebar_widget = wibox.widget {
    max_value = 1,
    forced_width = 50,
    paddings = 0,
    border_width = 0.5,
    color = bar_color,
    background_color = background_color,
    shape = gears.shape.bar,
    clip = true,
    margins       = {
        top = 6,
        bottom = 6,
    },
    widget = wibox.widget.progressbar
}

local update_graphic = function(widget, stdout, _, _, _)
    local mute = string.match(stdout, "%[(o%D%D?)%]")
    local volume = string.match(stdout, "(%d?%d?%d)%%")
    volume = tonumber(string.format("% 3d", volume))

    if mute == "off" then
        widget.color = mute_color
        widget.value = volume / 100;
    else
        widget.color = bar_color
        widget.value = volume / 100;
    end
end

volumebar_widget:connect_signal("button::press", function(_,_,_,button)
    if (button == 4)     then awful.spawn("amixer -D pulse sset Master 5%+", false)
    elseif (button == 5) then awful.spawn("amixer -D pulse sset Master 5%-", false)
    elseif (button == 1) then awful.spawn("amixer -D pulse sset Master toggle", false)
    end

    spawn.easy_async(request_command, function(stdout, stderr, exitreason, exitcode)
        update_graphic(volumebar_widget, stdout, stderr, exitreason, exitcode)
    end)
end)

watch(request_command, 1, update_graphic, volumebar_widget)

local tb = wibox.widget.textbox("<span font_desc='"..theme.icon_font..
    "' color='"..util.ensure_pango_color(theme.volume_color)..
    "'>Ô</span> ")
widget_wrapper:add(tb)
widget_wrapper:add(volumebar_widget)
return widget_wrapper
-- return volumebar_widget
