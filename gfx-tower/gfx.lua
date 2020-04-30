local towergfx = gfxClass:newSubClass()


towergfx:setupIcons("gfx-tower")
towergfx.quads = {}



towergfx.decs = {}
towergfx.decTime = 0
towergfx.decAnimN = 1
--towergfx.decs[1] = newAnim(love.graphics.newImage("gfx-tower/lavabubbles.png"),32,32,4) 

local function is3(a)
	if a == 3 then
		return 1
	end
	return 0
end

for i = 1,9 do
	local x = ((i-1)%3) + 1
	local y = math.floor((i-1)/3)+1
	towergfx.quads[i] = love.graphics.newQuad(34*(x-1) - is3(x),34*(y-1) - is3(y),32,32,256,256)
end



--[[
for i = 1, math.floor( 32*width*height / (640*480) ) do
	towergfx.stars[i] = {x = math.random()*width, y = math.random()*height}
end
]]


towergfx.bglol = love.graphics.newImage("gfx-tower/background.png")





function towergfx:drawBg()
	--[[love.graphics.setColor(30,0,50)
	love.graphics.rectangle("fill",0,0,width,height)
	
	love.graphics.setColor(255,255,255,128)
	]]
	love.graphics.setColor(255,255,255)
	for x = 0, width/128 do
		for y = 0, height/128 do
			love.graphics.draw(self.bglol, x*128, y*128, 0, 2)
		end
	end
end



function towergfx:update(dt)
	self.decTime = self.decTime + dt
	self.decAnimN = math.floor(self.decTime*8)+1	
	for i = 1,#self.decs do
		local dec = self.decs[i]
		dec.n = self.decAnimN%dec.maxn + 1	
	end
		
	
	
	
	
end




return towergfx
