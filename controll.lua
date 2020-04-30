--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

conTroll = newControl()

function conTroll:update2(dt)
	if not self.loopOpen then
		self.butts:update(dt)
	end
	if love.keyboard.isDown("i") then
		self.game:changeZoom(2*dt)
	elseif love.keyboard.isDown("o") then
		self.game:changeZoom(-2*dt)
	end
	
	if love.keyboard.isDown("w") then
		self.game:moveCam(0,-200*dt)
	end
	
	if love.keyboard.isDown("a") then
		self.game:moveCam(-200*dt,0)
	end
	
	if love.keyboard.isDown("d") then
		self.game:moveCam(200*dt,0)
	end
	
	if love.keyboard.isDown("s") then
		self.game:moveCam(0,200*dt)
	end			
	
	local mx,my = love.mouse.getPosition()
	local a,b = self:insideBounds(mx,my)
	
	if love.mouse.isDown('l') and self.loopOpen then
		self.game:updateLoop(self:toCoords(mx,my))
		
		
		--[[if a then
			self.game:moveCam(a*250*dt,b*dt*250)
		end]]
		
	end
	if a and not self.butts:lolInside() then
		self.game:moveCam(a*250*dt,b*dt*250)
	end
end



function conTroll:mousereleased(k)
	if self.game.newloop then
		self.game:makeLoop()
	end
	self.loopOpen = false
	self.game:moveCamCont(0,0)
end

local lolrange = 60

function conTroll:insideBounds(x,y)
	local d = 4
	if flagFullscreen then
		d = -1
	end
	if mouseOutsideBounds or x < d or x > width - d or y < d or y > height - d then
		return
	end
	if x > width - lolrange then
		return 1,0
	end
	if x < lolrange then
		return -1,0
	end
	if y > height - lolrange then
		return 0,1
	end 
	if y < lolrange then
		return 0,-1
	end


end

function conTroll:mousepressed(k)
	if k=='l' then
		if not self.butts:click() then
			local x,y = love.mouse.getPosition()
			local lolx,loly = self:insideBounds(x,y)
			if not lolx then
				self.game:beginLoop(self:toCoords(x,y))
				self.loopOpen = true	
			else
				self.game:moveCamCont(lolx*250,loly*250)
			end
		end
	end
end

function conTroll:draw()
	if self.loopOpen then
		self.butts:draw(true)		
	else
		self.butts:draw()	
	end
	love.graphics.setColor(255,255,255,40)
	love.graphics.rectangle("line",lolrange,lolrange,width - 2*lolrange,height - 2*lolrange)
	love.graphics.setColor(255,255,255)
end

