local wibox = require("wibox")
local round = require("awful.util").round
local beautiful = require("beautiful")
local h = round(font_height+4)
function f(text)
    text.valign = "bottom"
    return wibox.container.margin(wibox.container.place(
        wibox.container.constraint(text, "exact", nil, h)),
        0, 0, 0, 2)
end
return f
