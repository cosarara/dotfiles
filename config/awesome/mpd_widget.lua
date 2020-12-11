
-- based on https://awesomewm.org/recipes/mpc/
-- and https://github.com/alexander-yakushev/awesompd
-- and https://github.com/copycat-killer/lain/blob/29dd7ad6fc130627d1f3ef1456e87f7992d6769b/widget/mpd.lua

local local_conf = require("rc_local")
local awful = require("awful")
local naughty = require("naughty")
local mpc = require("mpc")
local textbox = require("wibox.widget.textbox")
local timer = require("gears.timer")
local mpd_widget = textbox("uhm")
local state, title, artist, file, album, volume = "stop", "", "", "", "", ""
local icon_path = nil
local error_msg = nil

mpd_widget.awaiting_volume = false
mpd_widget.awaiting_track = false

local color = theme.music_color or theme.fg_normal or "#888888"
local function update_widget()
    local text = " <span color='"..color.."'><span font_desc='"..theme.icon_font.."'>Î</span> "
    --text = text .. tostring(artist or "") .. " - " .. tostring(title or "")
    local fname = string.gsub(file, ".*/", "")
    local shorttitle = title and title ~= "" and string.sub(title, 0, 40)
    text = text .. tostring(shorttitle or fname or "---")
    if state == "pause" then
        text = text .. " (paused)"
    end
    if state == "stop" then
        text = text .. " (stopped)"
    end
    text = text .. "</span>" -- color
    mpd_widget.markup = text
end

local connection

local function error_handler(err)
    error_msg = tostring(err)
    io.stderr:write(error_msg)
    --mpd_widget:set_text("Error: " .. tostring(err))
    local text = " <span color='"..color.."'><span font_desc='"..theme.icon_font.."'>Î</span> "
    text = text .. "Not connected"
    text = text .. "</span>" -- color
    mpd_widget.markup = text
    -- Try a reconnect soon-ish
    timer.start_new(10, function()
        connection:send("ping")
        return false
    end)
end

connection = mpc.new(nil, nil, nil, error_handler,
    "status", function(_, result)
        error_msg = nil
        state = result.state
        volume = result.volume
        if mpd_widget.awaiting_volume then
            mpd_widget:notify("Volume:", volume.." %", 1)
            mpd_widget.awaiting_volume = false
        end
    end,
    "currentsong", function(_, result)
        error_msg = nil
        if file ~= result.file then
            mpd_widget.awaiting_track = true
        end
        title, artist, file, album = result.title, result.artist, result.file, result.album
        pcall(update_widget)
        get_cover(function(path)
            icon_path = path
            if mpd_widget.awaiting_track then
                mpd_widget:notify_track()
                mpd_widget.awaiting_track = false
            end
        end)
    end)

function mpd_widget:hide_notification()
   if self.notification ~= nil then
      naughty.destroy(self.notification)
      self.notification = nil
   end
end

function mpd_widget:notify(hint_title, hint_text, timeout, hint_image)
    local new_notification = naughty.notify(
    { title      = hint_title --awful.util.escape(hint_title)
    , text       = awful.util.escape(hint_text)
    , timeout    = timeout or 3
    , position   = "top_right"
    , icon       = hint_image
    , icon_size  = 80 --self.album_cover_size
    })
    -- we hide after showing the new one to prevent flicker
    self:hide_notification()
    self.notification = new_notification
end

function mpd_widget:notify_track(permanent)
    if error_msg ~= nil then
        self:notify(error_msg)
        return
    end
    local timeout = 1
    if permanent ~= nil then
        timeout = 0
    end
    self:notify(title or file, (artist or "") .. (artist and "\n" or "") .. (album or ""), timeout, icon_path)
end

mpd_widget:buttons(awful.util.table.join(
                    awful.button({ }, 1, function()
                        connection:toggle_play()
                    end),
                    awful.button({ }, 4, function()
                        connection:send("volume +5")
                        mpd_widget.awaiting_volume = true
                    end),
                    awful.button({ }, 5, function()
                        connection:send("volume -5")
                        mpd_widget.awaiting_volume = true
                    end)
                    ))

mpd_widget:connect_signal("mouse::enter", function(c)
    --instance:update_track()
    mpd_widget:notify_track(true)
end)

mpd_widget:connect_signal("mouse::leave", function(c)
    --instance:hide_notification()
    mpd_widget:hide_notification()
end)

--

local easy_async = require("awful.spawn").easy_async
local shell = require("awful.util").shell
local cover_pattern = "*\\.(jpg|jpeg|png|gif)$"
function plsasync(cmd, callback)
    return easy_async(cmd,
    function (stdout, stderr, reason, exit_code)
        callback(stdout)
    end)
end

function get_cover(callback)
    --return callback()
    local music_dir = local_conf.music_dir or "/mnt/data/beets/music"
    if string.match(file, "http.*://") then
        if callback ~= nil then
            callback()
        end
        return nil
    end
    local path = string.format("%s/%s", music_dir, string.match(file, ".*/"))
    local cover = string.format("find '%s' -maxdepth 1 -type f | egrep -i -m1 '%s'",
        path:gsub("'", "'\\''"), cover_pattern)
    plsasync({ shell, "-c", cover }, function(current_icon)
        local image = current_icon:gsub("\n", "")
        if #image == 0 then image = nil end
        if callback ~= nil then
            callback(image)
        end
    end)
end

local textwrap = require("textwrap")
local wrapper = textwrap(mpd_widget)
return wrapper
--return mpd_widget
