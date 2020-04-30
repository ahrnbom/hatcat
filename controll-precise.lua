--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]


conTrollP = newControl()

function conTrollP:load()
	controlClass.load(self)
	self.loopOpen = false
	self.game.newloop = nil
	
end

function conTrollP:update2(dt)
	if not self.loopOpen then
		self.butts:update(dt)
	else
	
		local nl = self.game.newloop
		self.game:updateLoop(nl.x + nl.w, nl.y + nl.h)
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
		
	end
	if a and not self.butts:lolInside() then
		self.game:moveCam(a*250*dt,b*dt*250)
	end
end

function conTrollP:mousereleased(k)
	if self.game.newloop and math.abs(self.game.newloop.w) <= 2 and math.abs(self.game.newloop.h) <= 2 then
		
		self.game:makeLoop()
		self.loopOpen = false
	end
	self.game:moveCamCont(0,0)
end

local lolrange = 60

function conTrollP:insideBounds(x,y)
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

local function fastdist(x1, y1, x2, y2)
	return math.abs(x1-x2) + math.abs(y1-y2)
end

function conTrollP:mousepressed(k)
	if k=='l' then
		if not self.butts:click() then
			local x,y = love.mouse.getPosition()
			local lolx,loly = self:insideBounds(x,y)
			if not lolx then
				if self.game.newloop then	
					local loop = self.game.newloop
					self.loopOpen = true
					
					local smallest = 50
					local found = 0
					
					if loop.w < 0 then
						loop.x = loop.x + loop.w
						loop.w = loop.w * -1
					end
					if loop.h < 0 then
						loop.y = loop.y + loop.h
						loop.h = loop.h * -1
					end
					
					local poss = {loop.x, loop.y, loop.x, loop.y + loop.h, loop.x + loop.w, loop.y, loop.x + loop.w, loop.y + loop.h}
					
					for i = 1,4 do
						local pos = 2*i - 1
						local d = fastdist(x, y, state:toScreenCoordsX(poss[pos]), state:toScreenCoordsY(poss[pos + 1]))
						print(i .. ": " .. d)
						if d < smallest then
							smallest = d
							found = i
						end
					end
					
					if found == 1 then
						local xlol = loop.x
						local ylol = loop.y
						loop.x = loop.x + loop.w
						loop.y = loop.y + loop.h
						loop.w = loop.x - xlol
						loop.h = loop.y - ylol
						
						return
					elseif found == 2 then
						local xlol = loop.x
						loop.x = loop.x + loop.w
						loop.w = loop.x - xlol
						return
					elseif found == 3 then
						local ylol = loop.y
						loop.y = loop.y + loop.h
						loop.h = loop.y - ylol
						return
					elseif found == 4 then
						return
					end
					
					local x2, y2 = self:toCoords(x, y)
					if x2 < loop.x + loop.w and x2 > loop.x and y2 < loop.y + loop.h and y2 > loop.y then
						
						if self.game.newloop then
							self.game:makeLoop()
						
						end
						self.loopOpen = false
					else
						self.game:beginLoop(self:toCoords(x,y))
						self.loopOpen = true	
					end
				else
					self.game:beginLoop(self:toCoords(x,y))
					self.loopOpen = true	
				end
			else
				self.game:moveCamCont(lolx*250,loly*250)
			end
		else
			self.loopOpen = false
			--self.game.newloop = nil
		end
	end
end

function conTrollP:draw()
	--if self.loopOpen then
	if love.mouse.isDown("l") and self.loopOpen then
		self.butts:draw(true)		
	else
		self.butts:draw()	
	end
	love.graphics.setColor(255,255,255,40)
	love.graphics.rectangle("line",lolrange,lolrange,width - 2*lolrange,height - 2*lolrange)
	love.graphics.setColor(255,255,255)
end
