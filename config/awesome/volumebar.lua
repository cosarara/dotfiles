-------------------------------------------------
-- Volume Bar Widget for Awesome Window Manager
-- Shows the current volume level and mute state
-- originally based on
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/volumebar-widget
-- copyright 2017 Pavel Makhov
-- current version
-- copyright 2019 Jaume Delclòs Coll
-- bugs:
-- doesn't subscribe to pulse events and thus gets out of sync
-------------------------------------------------

local awful = require("awful")
local gears = require("gears")
local spawn = require("awful.spawn")
local wibox = require("wibox")
local naughty = require("naughty")

local beautiful = require("beautiful")
local widget_wrapper = wibox.layout.fixed.horizontal()
local util = require("awful.util")

local request_command = 'amixer -D pulse sget Master'

--local bar_color = "#74aeab"
local bar_color = theme.volume_bar_color or theme.volume_color
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
    --clip = true,
    --margins       = {
    --    top = 6,
    --    bottom = 6,
    --},
    widget = wibox.widget.progressbar
}

widget_wrapper.volumebar_widget = volumebar_widget

local update_graphic = function(wrapper, stdout, _, _, _)
    -- naughty.notify({text = stdout})
    if wrapper == nil then
        return
    end
    local tb = wrapper.tb
    local mute = string.match(stdout, "%[(o%D%D?)%]")
    local color = util.ensure_pango_color(theme.volume_color)
    if mute == "off" then
        color = util.ensure_pango_color(mute_color)
    end
    local widget = wrapper.volumebar_widget
    local volume = string.match(stdout, "(%d?%d?%d)%%")
    volume = tonumber(string.format("% 3d", volume))

    if mute == "off" then
        widget.color = mute_color
        widget.value = volume / 100;
    else
        widget.color = bar_color
        widget.value = volume / 100;
    end
    tb.markup = ("<span font_desc='"..theme.icon_font..
    "' color='"..color..
    "'>Ô</span> ")
end

local run_update = function(command)
    spawn.easy_async(command, function(...)
        spawn.easy_async("amixer -D pulse get Master", function(...)
            update_graphic(widget_wrapper, ...)
        end)
    end)
end

local constrained = wibox.container.place(
    wibox.container.margin(
        wibox.container.constraint(
            volumebar_widget, "max", nil, 8),
        0, 0, 2))

constrained:connect_signal("button::press", function(_,_,_,button)
    local command = request_command
    if (button == 4)     then command = "pactl -- set-sink-volume 0 +5%"
    elseif (button == 5) then command = "pactl -- set-sink-volume 0 -5%"
    elseif (button == 1) then command = "pactl set-sink-mute 0 toggle"
    end
    run_update(command)
end)

local tb = wibox.widget.textbox("<span font_desc='"..theme.icon_font..
    "' color='"..util.ensure_pango_color(theme.volume_color)..
    "'>Ô</span> ")
widget_wrapper.tb = tb
local textwrap = require("textwrap")
widget_wrapper:add(textwrap(tb))
widget_wrapper:add(constrained)

-- initial state
run_update(request_command)

return widget_wrapper
