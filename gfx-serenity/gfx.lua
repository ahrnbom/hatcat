local serenitygfx = gfxClass:newSubClass()


serenitygfx:setupIcons("gfx-serenity")
serenitygfx.quads = {}

serenitygfx.tsuki = love.graphics.newImage("gfx-serenity/background_moon.png")

serenitygfx.decs = {}
serenitygfx.decTime = 0
serenitygfx.decAnimN = 1
--serenitygfx.decs[1] = newAnim(love.graphics.newImage("gfx-serenity/lavabubbles.png"),32,32,4) 

local function is3(a)
	if a == 3 then
		return 1
	end
	return 0
end

for i = 1,9 do
	local x = ((i-1)%3) + 1
	local y = math.floor((i-1)/3)+1
	serenitygfx.quads[i] = love.graphics.newQuad(34*(x-1) - is3(x),34*(y-1) - is3(y),32,32,256,256)
end


serenitygfx.stars = {}
--[[
for i = 1, math.floor( 32*width*height / (640*480) ) do
	serenitygfx.stars[i] = {x = math.random()*width, y = math.random()*height}
end
]]
local split = 8
for y = 0, split - 1 do
	for x = 0, split - 1 do
		for i = 1, math.ceil(32*width*height / (640*480*split*split)) do
			serenitygfx.stars[#serenitygfx.stars + 1] = {
				x = x*width/split + math.random()*width/split, 
				y = y*height/split + math.random()*height/split
			}
		end
		
	end
end

serenitygfx.starImg = love.graphics.newImage("gfx-serenity/star.png")

serenitygfx.starAngle = 0



function serenitygfx:drawBg()
	love.graphics.setColor(0,0,50)
	love.graphics.rectangle("fill",0,0,width,height)
	love.graphics.setColor(255,255,255)
	
	
	love.graphics.setColor(255,255,255,135)
	for i = 1, #self.stars do
		local star = self.stars[i]
		love.graphics.draw(self.starImg, star.x, star.y, self.starAngle, 2, 2, 8, 8)
	end
	love.graphics.setColor(255,255,255)
	love.graphics.draw(self.tsuki, width - 155, 70, 0.1*math.pi*math.sin(self.decTime*0.6), 2, 2, 32, 32)
end



function serenitygfx:update(dt)
	self.decTime = self.decTime + dt
	self.decAnimN = math.floor(self.decTime*8)+1	
	for i = 1,#self.decs do
		local dec = self.decs[i]
		dec.n = self.decAnimN%dec.maxn + 1	
	end
		
	self.starAngle = math.sin(self.decTime)*math.pi*0.32
	
	
	
end




return serenitygfx
