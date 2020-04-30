--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

trollClass = stateClass:newSubClass()
trollClass.t = 0
trollClass.done = false

trollClass.next = titleClass2

trollClass.s = "thank you for choosing hat cat and the obvious crimes against the fundamental laws of physics for your personal computer entertainment system"

function trollClass:update(dt)
	self.t = self.t + dt
	if self.t > 0.8 and (not self.done) then
		
		self.done = true
		if audio then
			audio:fillCompletely()
		end
		local menu = menuClass:newInstance()
		--menu:load() --spelet hänger sig av detta av någon anledning
		for i=1, #worlds do
			print("loading world " .. i)
			local world = worlds[i]
			local gfx = getGfx(world)
		end
		changeState(self.next)
		--setResolution()
	end
	
	
end

function trollClass:draw()
	love.graphics.printf(self.s,width*0.1,height/2 - 50, width*0.8, "center")
end

function trollClass:mousepressed()
	if not release then
		self.next = titleScreen
	end
end