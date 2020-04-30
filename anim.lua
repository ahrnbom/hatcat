--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

animClass = newClass()
animClass.flagAnim = true
animClass.n = 1
animClass.lolspeed = 0.6
animClass.loltime = 0
animClass.z = 1



function newAnim(p,w,h,n,r,dy) --r står för rate
	
	local o = animClass:newInstance()
	o.w = w
	o.h = h
	o.dy = dy or 0
	o.pic = p
	o.pic:setFilter("nearest","nearest")
	o.quads = {}
	fillQuads(o.quads,o.pic,w,h,n)
	o.maxn = n
	o.lolspeed = r
	o.rot = 0
	o.ox, o.oy = 0,0
	o.loltime = 0
	return o
end

function fillQuads(list,pic,w,h,n)
	local sh = pic:getHeight()
	local sw = pic:getWidth()
	for i=1,n do
		list[i] = love.graphics.newQuad((i-1)*w,0,w,h,sw,sh)
	end
end

function animClass:stdUpdate(dt)
	self.loltime = self.loltime + dt
	if self.loltime > self.lolspeed then
		self.loltime = 0
		self.n = self.n + 1
		if self.n > self.maxn then
			self.n = 1
		end
	end
	
	if not state.pause and self.flagReset then
		
		self.n = 1
		self.flagReset = false
	end
end

function animClass:lolSwing(ampl, steps)
	self.rot = math.floor(steps * ampl * math.sin(mainTime2))/steps
	self.ox = self.w*0.5
	self.oy = self.h*0.5
end

function animClass:setFilter(s1,s2)
	--self.pic:setFilter(s1,s2)
	--alla animation är automatiskt rätt filtrerade
end

function animClass:getHeight()
	return self.h
end

function animClass:getWidth()
	return self.w
end

function animClass:draw(x,y,mirror)
	if self.flagInvisible then
		return
	end
	
	if self.quads[self.n] == nil then
		return
	end
	
	if self.col then
		love.graphics.setColor(self.col.r, self.col.g, self.col.b)
	end
	
	if self.flagButtblock then
		love.graphics.setColor(255,255,255,128 + 64*math.sin(3*mainTime2))
	end
	
	local z = self.z
	
	if self.effect then
		love.graphics.setColor(255, 255, 255, math.max(255 - 255*(self.effect/self.effecttime), 0))
		z = z*(1+2*self.effect)
	end
	
	if self.vertflip then
		love.graphics.drawq(self.pic,self.quads[self.n],x-self.w*0.5 + self.ox,y+self.dy + self.oy,self.rot,z,-z,self.ox,self.oy)
	else
		if mirror and (not self.flip) then
			love.graphics.drawq(self.pic,self.quads[self.n],x-self.w*0.5 + self.ox,y+self.dy + self.oy,self.rot,z,z,self.ox,self.oy)
		else
			love.graphics.drawq(self.pic,self.quads[self.n],x+self.w*0.5 + self.ox,y+self.dy + self.oy,self.rot,-z,z,self.ox,self.oy)
		end
	end
	if self.col or self.flagButtblock then
		love.graphics.setColor(255,255,255)
	end
	
end
