--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

sbsys = newClass()

function newSBsys(gfx,lvl)
	local o = sbsys:newInstance()
	o.gfx = gfx
	o.sb = love.graphics.newSpriteBatch(o.gfx:getPic()) 
	o.quads = gfx:getQuads()
	o.lvl = lvl
	o:fill()
	
	return o
end

function sbsys:draw()
	love.graphics.draw(self.sb,0,0)
end

function sbsys:addq(n,x,y)
	if not self.quads[n] then return end
	self.sb:addq(self.quads[n],32*(x-1),32*(y-1))
end

function sbsys:fill()
	self.sb:clear()
	local lvl = self.lvl
	for x = 1,#lvl do
		for y = 1,#lvl[1] do
			if not lvl[x] then break end
			local n = lvl[x][y]
			if not n then break end
			if n < 9 then
				self:addq(n,x,y)
			else
				self:addq(n%10,x,y)
				self:addq(math.floor(n/10),x,y)
				--TODO kanske dålig lösning?
			end
		end
	end
	
end
