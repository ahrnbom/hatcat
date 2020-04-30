-- This software is released under the MIT License. See LICENSE.txt for details.

local effects = newClass()
effects.time = 0.5

function effects:add(anim, x, y)
	local o = {}
	o.anim = anim
	o.x = x
	o.y = y
	o.anim.effect = 0
	o.anim.effecttime = effects.time
	table.insert(self.list, o)
end

function effects:update(dt)
	for i = #self.list, 1, -1 do
		local o = self.list[i]
		o.anim.effect = o.anim.effect + dt
		if o.anim.effect > effects.time then
			o.anim.effect = 0
			table.remove(self.list, i)
		end
	end
end

function effects:draw()
	for i,v in ipairs(self.list) do
		v.anim:draw(v.x, v.y)
	end
end

return function()
	local o = effects:newInstance()
	o.list = {}
	return o
end