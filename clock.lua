--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

clockClass = gameobject:newSubClass()

function newClock(x,y)
	local o = clockClass:newInstance()
	o.x = x
	o.y = y
	o:load()
	o.l= 0
	o:update(0.1)
	return o
end

function clockClass:update(dt)

	self.c = os.date("%H:%M")
	self.l = font:getWidth(self.c)/2
end

function clockClass:draw()
	love.graphics.setColor(255,255,255,190)
	--love.graphics.print(self.c,self.x - self.l,self.y)
	love.graphics.setColor(255,255,255)
end

function clockClass:load()
	self.c = ""
end
