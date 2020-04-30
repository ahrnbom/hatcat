--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

titleScreen = newState()

function titleScreen:load()
	audio:playMusic("intro")
	self.dx = 0
	self.bg = love.graphics.newImage("res/introbg.png")
	self.bg2 = love.graphics.newSpriteBatch(love.graphics.newImage("res/introbgp.png"),1)
	self.bg2:add(0,0,0,2)
	self.fg = love.graphics.newImage("res/introfg.png")
	self.smoke = newAnim(love.graphics.newImage("res/smoke.png"),64,64,5,0.15)
	self.smoke.z = 2
	self.smokex = 2*234+width - 1024 + 264 - 128
	self.smokey = 2*426+height - 1024 - 128
	
	self.butts = newButtList()
	self.y = 50
	self.x = {}
	for i=1,4 do
		self.x[i] = (i-0.5)*width/4
	end
	
	dontPlayMusic = false
	
	self.butts:add(newButt("play",self.x[1],self.y,function()
		changeState(menuClass)
		goBackToThisState = nil
	end))
	self.butts:add(newButt("instructions",self.x[2],self.y ,function()
		dontPlayMusic = true
		changeState(uctionsState)
		goBackToThisState = nil
	end))
	self.butts:add(newButt("options",self.x[3],self.y,function()
		changeState(optionsState)
		goBackToThisState = titleScreen
	end))
	self.butts:add(newButt("quit",self.x[4],self.y,function()
		local f = love.event.quit or love.event.push
		f('q')
	end))
	
	self.correction = 0
	if height > 720 then
		self.correction = height/3
	end
end

local smallnumber = 0
if smallMode then
	smallnumber = 100
end

function titleScreen:draw()

	local draw_gui = not love.keyboard.isDown('g')
	if release then
		draw_gui = true
	end

	love.graphics.setColor(220,250,174)
	love.graphics.rectangle("fill",0,0,width,height)
	love.graphics.setColor(255,255,254.9)

	love.graphics.draw(self.bg2,-1024 + self.dx,height - 512,0,1)
	love.graphics.draw(self.bg2,self.dx,height - 512,0,1)
	if computerMode then
		love.graphics.draw(self.bg2,1024 + self.dx,height - 512,0,1)
	end
	love.graphics.setColor(255,255,255)
	love.graphics.draw(self.fg,width - 1024 + 270 + smallnumber,height - 1024 + smallnumber/2,0,2)
	self.smoke:draw(self.smokex+smallnumber,self.smokey+smallnumber/2,true)
	if draw_gui then
		self.butts:draw()
		
		if showFPS then
			love.graphics.setColor(0,0,0)
			love.graphics.print("fps: "..love.timer.getFPS(),width - 120,height - 50)
			love.graphics.setColor(255,255,255)
		end
	
	love.graphics.push()
		
		love.graphics.setColor(0,0,0)
		
		love.graphics.printf("hat cat and the obvious crimes against the fundamental laws of physics",
							width/50, height*0.65 - self.correction, width/2)
		love.graphics.setColor(255,255,255)
	love.graphics.pop()
	end
end

function titleScreen:update(dt)
	self.dx = self.dx + dt*50
	if self.dx > 1024 then
		self.dx = 0
	end
	self.smoke:stdUpdate(dt)
end

function titleScreen:mousepressed()
	self.butts:click()
end

function titleScreen:keypressed(k)
	if not release then
		if k=="s" then
			changeState(minigameClass)
		end
	end
end
