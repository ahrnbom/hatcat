local summitgfx = gfxClass:newSubClass()


summitgfx:setupIcons("gfx-summit")
summitgfx.quads = {}



summitgfx.decs = {}
summitgfx.decTime = 0
summitgfx.decAnimN = 1
--summitgfx.decs[1] = newAnim(love.graphics.newImage("gfx-summit/lavabubbles.png"),32,32,4) 

local function is3(a)
	if a == 3 then
		return 1
	end
	return 0
end

for i = 1,9 do
	local x = ((i-1)%3) + 1
	local y = math.floor((i-1)/3)+1
	summitgfx.quads[i] = love.graphics.newQuad(34*(x-1) - is3(x),34*(y-1) - is3(y),32,32,256,256)
end


summitgfx.stars = {}
for i = 1, math.floor( 24*width*height / (640*480) ) do
	summitgfx.stars[i] = {x = math.random()*width, y = math.random()*height}
end

summitgfx.starImg = love.graphics.newImage("gfx-summit/star.png")

summitgfx.starAngle = 0

summitgfx.yukiImg = love.graphics.newImage("gfx-summit/yuki.png")
summitgfx.yuki = {}
for i = 1, math.floor( 70*width*height / (640*480) ) do
	summitgfx.yuki[i] = {x = math.random()*width, y = math.random()*height}
end
summitgfx.yukiAngle = 0

function summitgfx:drawBg()
	love.graphics.setColor(0,0,50)
	love.graphics.rectangle("fill",0,0,width,height)
	
	love.graphics.setColor(255,255,255,128)
	for i = 1, #self.stars do
		local star = self.stars[i]
		love.graphics.draw(self.starImg, star.x, star.y, self.starAngle, 2, 2, 8, 8)
	end
	love.graphics.setColor(255,255,255)
end

function summitgfx:drawFg()
	love.graphics.setColor(255,255,255, 128)
	for i = 1, #self.yuki do
		love.graphics.draw(self.yukiImg, self.yuki[i].x, self.yuki[i].y, self.yukiAngle, 1.5, 1.5, 4, 4)
	end
	love.graphics.setColor(255,255,255)
end

function summitgfx:update(dt)
	self.decTime = self.decTime + dt
	self.decAnimN = math.floor(self.decTime*8)+1	
	for i = 1,#self.decs do
		local dec = self.decs[i]
		dec.n = self.decAnimN%dec.maxn + 1	
	end
		
	self.starAngle = math.sin(self.decTime)*math.pi*0.32
	self.yukiAngle = self.decTime * 2
	
	for i = #self.yuki, 1, -1 do
		local yuki = self.yuki[i]
		yuki.y = yuki.y + 40*dt
		yuki.x = yuki.x + math.sin(2*self.decTime)*15*dt
		if yuki.y > height + 16 then
			yuki.y = -16
		end
	end
end




return summitgfx
