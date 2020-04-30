--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

animSB = newClass()

function newAnimSB(pic,nanim,npics,w,h)
	local o = animSB:newInstance()
	o.nanim = nanim
	o.w = w
	o.h = h
	o.pic = pic
	o.npics = npics
	o.poss = {}
	
	o.wpic = pic:getWidth()
	o.hpic = pic:getHeight()
	o.t = 0
	o.c = 1
	return o
end

function animSB:finalize()
	if drawMode == 2 then
		return self:finalize2()
	end

	self.sbs = {}
	for i=1,self.nanim do
		local sb = love.graphics.newSpriteBatch(self.pic,#self.poss) --antalet inläggningar totalt
		self.sbs[i] = sb
		
		for j = 1,#self.poss do
			local pos = self.poss[j]
			local quad = love.graphics.newQuad((i-1)*self.w,(pos[1]-1)*self.h,self.w,self.h,self.wpic,self.hpic)
			sb:addq(quad,pos[2],pos[3])
		end
		
	end
		
	self.final = true
end

function animSB:finalize2()
	self.sbs = {}
	
	for i=1,self.nanim do
		local fb
		local toDraw = {}
		if love.graphics.newFramebuffer then
			fb = love.graphics.newFramebuffer(512,512)
		else
			fb = love.graphics.newCanvas(512,512)
		end
		fb:setFilter("nearest","nearest")
		self.sbs[i]=fb
		for j=1,#self.poss do
			local pos = self.poss[j]
			local quad = love.graphics.newQuad((i-1)*self.w,(pos[1]-1)*self.h,self.w,self.h,self.wpic,self.hpic)
			table.insert(toDraw,{quad,pos[2],pos[3]})
			
		end
		fb:renderTo(function()
			for i=1,#toDraw do
				love.graphics.drawq(self.pic,toDraw[i][1],toDraw[i][2],toDraw[i][3])
			end
		end)
	end
	self.final = true
end



function animSB:update(dt,rate)
	self.t = self.t + dt
	if self.t > rate then
		self.t = 0
		self.c = self.c + 1
		if self.c > self.nanim then
			self.c = 1
		end
	end
end

function animSB:add(n,x,y)
	table.insert(self.poss,{n,x,y})
end

function animSB:draw(s,x,y)
	if not self.final then
		print "Y U NO FINALIZE?!"
		return
	end
	
	love.graphics.draw(self.sbs[self.c],x or 0,y or 0,0,s)
	
end
