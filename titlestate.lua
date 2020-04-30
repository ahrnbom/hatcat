--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

titleClass = stateClass:newSubClass()
--titleClass.list = require 'titstrings'
titleClass.s = ""
titleClass.lol = 0
--titleClass.pic1 = love.graphics.newImage("res/TBONE2.png")


function titleClass:load()
	--[[
	math.randomseed(os.time())
	self.n = math.floor(#self.list * math.random())
	self.s = self.list[self.n]
	while font:getWidth(self.s) > width do
		self.n = math.floor(#self.list * math.random())
	
		self.s = self.list[self.n]
	end
	]]
	self.s = ""
	self.smallnumber = 0
	if smallMode then
		self.smallnumber = 1
	end	
	
	--[[
	local p = love.graphics.newImage("res/intro_test3.png")
	titleClass.pic = newAnim(p, 799, 599, 16, 0.1)
	]]
	
	titleClass.pic2 = newAnim(love.graphics.newImage("res/gunnars_logga.png"),128,128,8)
	titleClass.pic3 = love.graphics.newImage("res/gunnartext.png")
	titleClass.pic2.lolspeed = 0.14
	
	self.pic2.z = 2 - self.smallnumber*(2/3)
	
end

function titleClass:draw() 
	love.graphics.setColor(215,76,253)
	--self.pic:draw(width/2,0, true)
	love.graphics.rectangle("fill",0,0,width,height)
	love.graphics.setColor(255,255,255)
	--love.graphics.draw(self.pic1,centerx - 375 + 120*self.smallnumber,centery - 220 + self.smallnumber*100,0,3 - self.smallnumber)
	--self.pic2:draw(centerx + 264 - 120*self.smallnumber,centery - 175 + self.smallnumber*100 - 50)	
	--love.graphics.draw(self.pic3,centerx + 264 - 120*self.smallnumber -250, centery + - 175 + self.smallnumber*100 + 230, 0, 3,3)
	
	
	self.pic2:draw(centerx - 120*self.smallnumber + 64,centery - 175 + self.smallnumber*100 - 50)	
	love.graphics.draw(self.pic3,centerx - 120*self.smallnumber -250 + 64, centery + - 175 + self.smallnumber*100 + 230, 0, 3,3)
	love.graphics.setColor(0,0,0)
	love.graphics.print(self.s,centerx - font:getWidth(self.s)/2,height - 80 + 30*self.smallnumber)
	
end


function titleClass:update(dt)
	self.pic2:stdUpdate(dt)
	self.lol = self.lol + dt
	
	if self.lol > 16*self.pic2.lolspeed then
	--if self.lol > 16*self.pic.lolspeed then	
		changeState(titleScreen)
	end
end

function titleClass:mousepressed()
	changeState(titleScreen)
end
