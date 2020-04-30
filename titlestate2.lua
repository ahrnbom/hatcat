--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

titleClass2 = stateClass:newSubClass()

function titleClass2:load()
	self.t = 0
	self.t2 = 0
	self.mt = 2
	self.s = "t-bone independent software solutions"
	self.w = width*0.25
	self.sw = font:getWrap(self.s, self.w)
	self.l072 = false;
	if not love.graphics.arc then
		self.l072 = true;
	end
	if not self.l072 then
		self.ps = love.graphics.newParticleSystem(love.graphics.newImage("res/lolparticle.png"), 512)
		--self.ps:setPosition(centerx, centery)
		self.ps:setEmissionRate(250)
		self.ps:setSpeed(100,200)
		self.ps:setSpread(2*math.pi)
		self.ps:setParticleLife(0.9, self.mt)
		self.ps:setSizes(1, 2)
		self.ps:start()
	end
end

function titleClass2:draw()
	
	love.graphics.setColor(0 + 255*self.t/self.mt, 128 + self.t*127/self.mt, 240 + self.t*15/self.mt)
	love.graphics.rectangle("fill",0,0,width,height)
	love.graphics.setColor(255,255,255)
	if not self.l072 then
		love.graphics.draw(self.ps, centerx, centery)
	end
	love.graphics.setColor(0,0,0,math.min(255, math.max(0,(-128 + self.t*(255+128)) / self.mt )))
	love.graphics.printf(self.s, centerx - self.sw*0.5, centery - 64 + self.t*64/self.mt - font:getHeight(),self.w, "center")
	love.graphics.setColor(255,255,255)
	
end

function titleClass2:update(dt)
	self.t = self.t + dt
	if self.t > self.mt then
		self.t = self.t - dt
		self.t2 = self.t2 + dt
		if self.t2 > 0.3 then
			changeState(titleClass)
		end
	end
	if not self.l072 then
		self.ps:update(dt)
	end
	--print(self.ps:count())
end

function titleClass2:mousepressed()
	self.t = self.mt
end