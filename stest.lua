--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

soundTest = stateClass:newSubClass()

function soundTest:load()
	self.cactus = newAnim(love.graphics.newImage("res/cactus.png"),32,32,16,0.1)
	self.cactus.z = 2
	
	self.butt = newButtList()
	self.butt:add(newButt("back", 70, 110, function()
		changeState(shopstate)
	end))
	
	self.butt:add(newButt("next", centerx + 150, centery, function()
		self.curr = math.min(self.curr + 1, #audio.mnames)
	end))
	self.butt:add(newButt("prev", centerx - 150, centery, function()
		self.curr = math.max(1, self.curr - 1)
	end))
	
	self.butt:add(newButt("play", centerx, centery, function()
		audio:playMusic(audio.mnames[self.curr])
		self.playing = true
		self.cactus.lolspeed = audio.speed[self.curr]
		self.cactus.lolspeed = self.cactus.lolspeed/16
		self.cactus.loltime = 0
		
		state.clicks = {}
		state.time = 0
	end))
	
	self.dist = 50
	self.curr = 1
	self.playing = false
	audio:shutup()
	
	self.bpm = 0
	self.time = 0
	self.clicks = {}
	
	self.delta = 0
end

function soundTest:draw()
	love.graphics.setColor(0,64,255)
	love.graphics.rectangle("fill",0,0,width,height)
	love.graphics.setColor(255,255,255)
	for i = 0, width/self.dist + 2 do
		self.cactus:draw(i*self.dist - 8 + self.delta, 10)
		self.cactus:draw(i*self.dist - 8 - self.delta, height - 74)
	end
	self.butt:draw()
	local s = "current song: " .. self.curr
	love.graphics.print(s, centerx - font:getWidth(s)*0.5, centery - 80)
end

function soundTest:update(dt)
	if self.playing then
		self.cactus:stdUpdate(dt)
	end
	
	self.time = self.time + dt
	
	self.delta = self.delta + (5/self.cactus.lolspeed)*dt
	if self.delta > self.dist then
		self.delta = 0
	end
end

local function avg(list)
	local v = 0
	for i=1,#list do
		v = v + list[i]
	end
	v = v/#list
	return v
end

function soundTest:mousepressed()
	self.butt:click()
	
	table.insert(self.clicks, self.time)
	print(avg(self.clicks))
	self.time = 0
end