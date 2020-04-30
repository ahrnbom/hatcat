--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

gameobject = newClass()
gameobject.pic = nil
gameobject.x = 0
gameobject.y = 0
gameobject.dir = true

function newGO(pic,x,y)
	local o = gameobject:newSubClass()
	o.pic = pic
	o.x = x or 0
	o.y = y or 0
	o.w = pic:getWidth()
	o.h = pic:getHeight()
	o.timer = 0
	
	return o
end

function gameobject:new(x,y)
	local o = self:newInstance()
	if x and y then
		o.x = x
		o.y = y
	end
	o:load()
	
	return o
end

function gameobject:animLoop(dt,troll)
	self.timer = self.timer + dt
	if self.timer > troll then
		self.timer = 0
		self.pic.n = self.pic.n + 1
		if self.pic.n > self.pic.maxn then
			self.pic.n = 1
		end
	end
end

function gameobject:load()

end

function gameobject:gothroughloop()
	audio:playSfx('teleport')
end

function gameobject:update(dt)

end


	local function isTrue(t)
		if t then	
			return 1
		end
		return -1
	end

function gameobject:checkShrooms(dt,fallspeed,walkspeed)
	fallspeed = fallspeed or 150
	walkspeed = walkspeed or 70
	if self.shroomSpeed and self.shroomSpeed > 0 then
		self.shroomSpeed = self.shroomSpeed - dt*fallspeed
		self:move(15*dt*isTrue(self.dir),0)
		local res = self:tryFall(-self.shroomSpeed*dt)
		if not res then
			self.shroomSpeed = nil
			
		end
	end
end

function gameobject:draw(dy,dx,mirror)
	if state.underwater and self.pattern and self.pattern.lolmirror then
		mirror = not mirror
	end
	local dy = dy or 0
	local dx = dx or 0
	if not self.pic.flagAnim then
		love.graphics.draw(self.pic,self.x - self.w/2 + dx,self.y - self.h/2 + dy) --not used?
		print("Potential drawing problem")
	else
		self.pic:draw(self.x + dx,self.y - self.h + dy,mirror)	
		--self.pic:draw(self.x + dx,self.y + dy,mirror)
		
	end
end

function gameobject:setPos(x,y)
	self.x = x
	self.y = y
end

function gameobject:safeX(x, nocollide)
	if nocollide or state:isEmpty(x,self.y) then
		self.x = x
		return true
	end
	return false
end

function gameobject:safeY(y, nocollide)
	if nocollide or state:isEmpty(self.x,y) then
		self.y = y
		return true
	end
	return false
end

function gameobject:move(dx,dy,sc, nocollide)
	local dy = dy or 0
	local res = true
	local goloop = false -- go loop, go!
	if state.loop.active then
		local loop = state.loop
		if self.x + dx < loop.x then
			res = self:safeX(loop.x + loop.w, nocollide)
			goloop = true
		elseif self.x + dx > loop.x + loop.w then
			res = self:safeX(loop.x, nocollide)
			goloop = true
		elseif self.y + dy < loop.y then
			res = self:safeY(loop.y + loop.h, nocollide)
			goloop = true
		elseif self.y + dy > loop.y + loop.h then
			res = self:safeY(loop.y, nocollide)
			goloop = true
		end
	end
	if res then
		if goloop then
			self:gothroughloop()
		end
		local res1 = self:safeX(self.x + dx, nocollide)
		local res2 = self:safeY(self.y + dy, nocollide)
		
		return res1 and res2
		
	end
	return false
end

function gameobject:posX()
	return self.x
end

function gameobject:posY()
	return self.y
end	

function gameobject:tryWalk(dx)
	if self.dir then
		if not self:tryStep(dx,16) then
			
			self.dir = not self.dir
			
		end
	else
		if not self:tryStep(-dx,-16) then
			
			self.dir = not self.dir
			
		end
	end
end

function gameobject:tryStep(dx,margin)
	local nx = self.x + dx
	local nxwm = nx + margin
	local sc = false
	-- fix for the annoying bug
	
	if state.loop.active then
		local loop = state.loop
		if nxwm < loop.x then
			nxwm = loop.x + loop.w + dx + margin
			state:isEmpty(nxwm, self.y)
			sc = true
		elseif nxwm > loop.x + loop.w then
			nxwm = loop.x + dx + margin
			sc = true
			state:isEmpty(nxwm, self.y)
		end
	end
	
	
	if state:isEmpty(nxwm,self.y) then
		
		local res = self:move(dx,0,sc)
		if sc then
			return true
		end
		
		return res
	elseif state:isEmpty(nx + margin, self.y)  then
		return true
	end
	return false
end

function gameobject:tryFall(dy)
	local res = self:tryFall2(dy)
	if not res then
		self.y = 8*math.ceil(self.y/8) - 0.1
		
	end
	return res
end

function gameobject:tryFall2(dy)
	local loly = self.y + dy
	local loopcase = 0
	if state.loop.active then 
		local loop = state.loop
		if self.y + dy < loop.y then
			loly = loop.y + loop.h
			loopcase = 1
		end
		if self.y + dy > loop.y + loop.h then
			loly = loop.y
			loopcase = 2
		end
	end
	
	if state:isEmpty(self.x + 16,loly) and state:isEmpty(self.x - 16,loly) then
		if state.underwater then
			local dx = dy*0.5
			dy = dy*0.33333
			if not self.dir then
				dx = -dx
			end
			if state:isEmpty(self.x + 16,self.y + dy) and state:isEmpty(self.x - 16,self.y + dy) then
				self:move(0,dy)
			end
			if state:isEmpty(self.x + 16 + dx,self.y) and state:isEmpty(self.x - 16 + dx,self.y) then
				self:move(dx,0)
			else
				self.dir = not self.dir
			end
			return true
		elseif state:isEmpty(self.x + 16, self.y + dy) and state:isEmpty(self.x - 16, self.y + dy) then

			return self:move(0,dy)

		end
		print("LOLOLOLOLOLO")
		--return self:move(0,dy) -- detta funkar ej, då man då kan dra en loop när den går och få katten att flyga
		
		--return false -- funkar ej då den går även om loopen är ovanför marken
		--return true -- funkar ej då den "fastnar"
		local loop = state.loop
		if loopcase == 0 then
			-- ???
			print("THIS SHOULD NEVER HAPPEN")
			return false
		elseif loopcase == 2 then
			if state:isEmpty(self.x, loop.y + loop.h, true) then
				return self:move(0,dy)
			else
				return false
			end
		else
			-- TODO TODO
		end
		
	elseif state:isEmpty(self.x + 16, self.y + dy) and state:isEmpty(self.x - 16, self.y + dy) then
		return true
	end
	return false
end
