local cavernsgfx = gfxClass:newSubClass()


cavernsgfx:setupIcons("gfx-caverns")
cavernsgfx.quads = {}



cavernsgfx.decs = {}
cavernsgfx.decTime = 0
cavernsgfx.decAnimN = 1
cavernsgfx.decs[1] = newAnim(love.graphics.newImage("gfx-caverns/lava.png"),32,32,4) 

local function is3(a)
	if a == 3 then
		return 1
	end
	return 0
end

for i = 1,9 do
	local x = ((i-1)%3) + 1
	local y = math.floor((i-1)/3)+1
	cavernsgfx.quads[i] = love.graphics.newQuad(34*(x-1) - is3(x),34*(y-1) - is3(y),32,32,256,256)
end


cavernsgfx.bglol = love.graphics.newImage("gfx-caverns/background.png")

function cavernsgfx:drawBg()
	love.graphics.setColor(255,255,255)
	for x = 0, width/128 do
		for y = 0, height/128 do
			love.graphics.draw(self.bglol, x*128, y*128, 0, 2)
		end
	end
	
end

function cavernsgfx:update(dt)
	self.decTime = self.decTime + dt
	self.decAnimN = math.floor(self.decTime*8)+1	
	for i = 1,#self.decs do
		local dec = self.decs[i]
		dec.n = self.decAnimN%dec.maxn + 1	
	end
		
	
end




return cavernsgfx
