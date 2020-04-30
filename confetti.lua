-- This software is released under the MIT License. See LICENSE.txt for details.

local conf = newClass({"list"})


function conf:spawn(x, y, n)
	for i = 1, n do
		local obj = {}
		obj.x = x
		obj.y = y
		obj.dx = 500*(math.random() - 0.5)
		obj.dy = -150 - math.random()*200
		obj.c = {math.random()*255, math.random()*255, math.random()*255}
		obj.t = 0
		obj.ts = 0.4+math.random()*1.5
		table.insert(self.list, obj)
	end
end

function conf:update(dt)
	for i = #self.list, 1, -1 do
		local obj = self.list[i]
		obj.t = obj.t + obj.ts*dt
		if obj.t > 1.5 then
			table.remove(self.list, i)
		else
			obj.dy = obj.dy + (5+512*math.random())*dt
			obj.x = obj.x + obj.dx*dt
			obj.y = obj.y + obj.dy*dt
		end
	end
	
	self.anim:stdUpdate(dt)
end

function conf:draw()
	for i,v in ipairs(self.list) do
		local c = v.c
		love.graphics.setColor(c[1], c[2], c[3], math.max(0, 255 - 255*(v.t/1.5)))
		self.anim:draw(v.x, v.y)
	end
	love.graphics.setColor(255,255,255)
end

newConfetti = function() --glowball
	local o = conf:newInstance()
	o.anim = newAnim(love.graphics.newImage("res/confetti.png"), 16, 16, 8, 0.08)
	return o
end