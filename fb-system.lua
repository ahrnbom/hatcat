--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

fbsys = newClass()

function newFBsys(gfx,lvl)
	local o = fbsys:newInstance()
	o.gfx = gfx
	o.fbs = newFBMatrix(#lvl*32,#lvl[1]*32) --att lagra framebuffers i
	
	o.quads = gfx:getQuads()
	o.lvl = lvl
	o:fill()
	
	return o
end

function fbsys:draw()
	for i=1,#self.fbs do
		for j = 1,#self.fbs[1] do
			love.graphics.draw(self.fbs[i][j],(i-1)*512,(j-1)*512) 
		end
	end
end

function fbsys:addq(n,x,y)
	if not self.quads[n] then return end
	love.graphics.drawq(self.gfx:getPic(),self.quads[n],x,y)
	
end

function fbsys:fill()
	
	local lvl = self.lvl
	for i = 1,#self.fbs do
		for j=1,#self.fbs[i] do
			self.fbs[i][j]:renderTo(function()
				for x = 1,16 do --16*(i-1),16*i do
					for y = 1,16 do --16*(j-1),16*j do
						local n = lvl[16*(i-1)+x][16*(j-1)+y]
						if not n then break end
						if n < 9 then
							self:addq(n,32*(x-1),32*(y-1))
						else
							self:addq(n%10,32*(x-1),32*(y-1))
							self:addq(math.floor(n/10),32*(x-1),32*(y-1))
						end
					end
				end
			end)
		end 
	end
	
end

function newFBMatrix(w,h)
	local fbm = {}
	local mw = math.floor(w/512)
	local mh = math.floor(h/512)
	for x = 1,mw do
		fbm[x] = {}
		for y = 1,mh do
			local fb = love.graphics.newCanvas(512,512)
			fb:setFilter("nearest","nearest")
			fbm[x][y] = fb
		end
	end
	return fbm
end
