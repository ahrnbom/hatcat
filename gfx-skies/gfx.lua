local skiesgfx = gfxClass:newSubClass()
--[[
skiesgfx.pic = love.graphics.newImage("gfx-skies/bg.png")
skiesgfx.pic:setFilter("nearest","nearest")

skiesgfx.icons = {}
skiesgfx.icons.score = love.graphics.newImage("gfx-skies/score.png")
skiesgfx.icons.spawn = skiesgfx.icons.score
skiesgfx.icons.goal = love.graphics.newImage("gfx-skies/goal.png")
skiesgfx.icons["break"] = love.graphics.newImage("gfx-skies/break.png")
skiesgfx.icons.hero = love.graphics.newImage("gfx-skies/hero.png")
skiesgfx.icons.opengoal = love.graphics.newImage("gfx-skies/opengoal.png")
skiesgfx.icons.testenemy = love.graphics.newImage("gfx-skies/testenemy.png")
skiesgfx.icons.shroom = love.graphics.newImage("gfx-skies/shroom.png")
skiesgfx.icons.button = love.graphics.newImage("gfx-skies/pushthebuttonandletmeknow.png")
]]

skiesgfx:setupIcons("gfx-skies")
skiesgfx.quads = {}

--[[
skiesgfx.shroomAnim = newAnim(skiesgfx.icons.shroom,32,32,2)
skiesgfx.shroom = makeShroom(skiesgfx.shroomAnim)
]]


skiesgfx.icons.cloudsong = love.graphics.newImage("gfx-skies/cloudsong.png") --YOU FUCKING STOLE MY CLOUDSONG!
skiesgfx.cloudsong = newAnim(skiesgfx.icons.cloudsong,128,64,2)
skiesgfx.cloudsong.z = 1

skiesgfx.trollCoords = {}
skiesgfx.trollTime = 1

skiesgfx.balloon = love.graphics.newImage("gfx-skies/balloon.png")
skiesgfx.ballx = math.random(width/3)
skiesgfx.bally = math.random(height/3)
skiesgfx.balldx = 1
skiesgfx.balldy = 1
skiesgfx.ballt = 0

skiesgfx.decs = {}
skiesgfx.decTime = 0
skiesgfx.decAnimN = 1
skiesgfx.decs[1] = newAnim(love.graphics.newImage("gfx-skies/dec1.png"),32,32,8)

skiesgfx.sun = love.graphics.newImage("gfx-skies/background_sun.png")

local function is3(a)
	if a == 3 then
		return 1
	end
	return 0
end

for i = 1,9 do
	local x = ((i-1)%3) + 1
	local y = math.floor((i-1)/3)+1
	skiesgfx.quads[i] = love.graphics.newQuad(34*(x-1) - is3(x),34*(y-1) - is3(y),32,32,256,256)
end




function skiesgfx:drawBg()
	love.graphics.setColor(0,178,238)
	love.graphics.rectangle("fill",0,0,width,height)
	

	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(self.sun, 155, 70, 0.4*math.pi*math.sin(self.decTime*0.6), 2, 2, 32, 32)
	
	local i = 1
	while i < #self.trollCoords do
		self.cloudsong:draw(self.trollCoords[i]-128,self.trollCoords[i+1],true)
		i = i + 2
	end
	love.graphics.setColor(255,255,255,128)
	love.graphics.draw(self.balloon,self.ballx,self.bally,0,0.5)
	love.graphics.setColor(255,255,255)
end

function skiesgfx:update(dt)
	self.ballx = self.ballx + self.balldx*dt*50
	self.bally = self.bally + self.balldy*dt*50	
	self.ballt = self.ballt + dt
	if self.ballt > 4 then
		self.ballt = 0
		self.balldx = self.balldx + math.random(-0.5,0.5)
		self.balldy = math.random(-0.5,0.5)
	end
	self.cloudsong:stdUpdate(dt)
	self.decTime = self.decTime + dt
	self.decAnimN = math.floor(self.decTime*8)+1	
	for i = 1,#self.decs do
		local dec = self.decs[i]
		dec.n = self.decAnimN%dec.maxn + 1	
	end
	
		
	self.trollTime = self.trollTime - dt
	if self.trollTime < 0 then
		self.trollTime = 1
		self.trollCoords[#self.trollCoords+1] = 0
		self.trollCoords[#self.trollCoords+1] = math.random()*height
	end
	local i = 1
	while i < #self.trollCoords do
		self.trollCoords[i] = self.trollCoords[i]+100*dt
		if self.trollCoords[i] > width + 256 then --134 then
			table.remove(self.trollCoords,i)
			table.remove(self.trollCoords,i)
		end
		i = i+2
	end
end

for i = 1, 100 do
	skiesgfx:update(1)
end


return skiesgfx
