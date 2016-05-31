
local wibox = require("wibox")
local compton = wibox.widget.base.make_widget()

compton.fit = function(self, width, height)
	local size = math.min(width, height)
	return size, size
end

compton.draw = function(self, wibox, cr, width, height)
	cr:move_to(0, 0)
	cr:line_to(width, height)
	cr:move_to(width, 0)
	cr:line_to(0, height)
	cr:set_line_width(3)
	cr:stroke()
end

return compton
