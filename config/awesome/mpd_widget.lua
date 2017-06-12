
-- based on https://awesomewm.org/recipes/mpc/
-- and https://github.com/alexander-yakushev/awesompd

local awful = require("awful")
local naughty = require("naughty")
local mpc = require("mpc")
local textbox = require("wibox.widget.textbox")
local timer = require("gears.timer")
local mpd_widget = textbox()
local state, title, artist, file, album, volume = "stop", "", "", "", "", ""

mpd_widget.awaiting_n = nil

local function update_widget()
    local text = " <span color='"..theme.music_color.."'><span font_desc='"..theme.icon_font.."'>Î</span> "
    --text = text .. tostring(artist or "") .. " - " .. tostring(title or "")
    text = text .. tostring(title or "---")
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
    mpd_widget:set_text("Error: " .. tostring(err))
    -- Try a reconnect soon-ish
    timer.start_new(10, function()
        connection:send("ping")
    end)
end

connection = mpc.new(nil, nil, nil, error_handler,
    "status", function(_, result)
        state = result.state
        volume = result.volume
        if mpd_widget.awaiting_volume ~= nil then
            mpd_widget:notify("Volume:", volume.." %", 1)
            mpd_widget.awaiting_volume = nil
        end
    end,
    "currentsong", function(_, result)
        title, artist, file, album = result.title, result.artist, result.file, result.album
        pcall(update_widget)
    end)

function mpd_widget:hide_notification()
   if self.notification ~= nil then
      naughty.destroy(self.notification)
      self.notification = nil
   end
end

function mpd_widget:notify(hint_title, hint_text, timeout, hint_image)
   self:hide_notification()
   self.notification = naughty.notify(
   { title      = awful.util.escape(hint_title)
   , text       = awful.util.escape(hint_text)
   , timeout    = timeout or 3
   , position   = "top_right"
   , icon       = hint_image
   , icon_size  = 50 --self.album_cover_size
   })
end

function mpd_widget:notify_track()
    self:notify(title, artist .."\n".. album)
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
    mpd_widget:notify_track()
end)

mpd_widget:connect_signal("mouse::leave", function(c)
    --instance:hide_notification()
    mpd_widget:hide_notification()
end)

-- TODO
function try_get_local_cover(current_file)
   if self.mpd_config then
      local result
      -- First find the music directory in MPD configuration file
      local _, _, music_folder = string.find(
         self.pread('cat ' .. self.mpd_config .. ' | grep -v ^"#" | grep music_directory', "*line"),
         'music_directory%s+"(.+)"')
      music_folder = music_folder .. "/"
      
      -- If the music_folder is specified with ~ at the beginning,
      -- replace it with user home directory
      if string.sub(music_folder, 1, 1) == "~" then
         local user_folder = self.pread("echo ~", "*line")
         music_folder = user_folder .. string.sub(music_folder, 2)
      end

      -- Get the path to the file currently playing.
      local _, _, current_file_folder = string.find(current_file, '(.+%/).*')

      -- Check if the current file is not some kind of http stream or
      -- Spotify track (like spotify:track:5r65GeuIoebfJB5sLcuPoC)
      if not current_file_folder or string.match(current_file, "%w+://") then
          return -- Let the default image to be the cover
      end

      local folder = music_folder .. current_file_folder
      
      -- Get all images in the folder. Also escape occasional single
      -- quotes in folder name.
      local request = format("ls '%s' | grep -P '\\.jpg|\\.png|\\.gif|\\.jpeg'",
                             string.gsub(folder, "'", "'\\''"))

      local covers = self.pread(request, "*all")
      local covers_table = self.split(covers)
      
      if covers_table.n > 0 then
         result = folder .. covers_table[1]
         if covers_table.n > 1 then
            -- Searching for front cover with grep because Lua regular
            -- expressions suck:[
            local front_cover = 
               self.pread('echo "' .. covers .. 
                          '" | grep -P -i "cover|front|folder|albumart" | head -n 1', "*line")
            if front_cover then
               result = folder .. front_cover
            end
         end
      end
      return result
   end   
end

return mpd_widget
