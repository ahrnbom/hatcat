local forestgfx = gfxClass:newSubClass()
--[[
forestgfx.pic = love.graphics.newImage("gfx-forest/bg.png")
forestgfx.pic:setFilter("nearest","nearest")

forestgfx.icons = {}
forestgfx.icons.score = love.graphics.newImage("gfx-forest/score.png")
forestgfx.icons.spawn = forestgfx.icons.score
forestgfx.icons.goal = love.graphics.newImage("gfx-forest/goal.png")
forestgfx.icons["break"] = love.graphics.newImage("gfx-forest/break.png")
forestgfx.icons.hero = love.graphics.newImage("gfx-forest/hero.png")
forestgfx.icons.opengoal = love.graphics.newImage("gfx-forest/opengoal.png")
forestgfx.icons.testenemy = love.graphics.newImage("gfx-forest/testenemy.png")
forestgfx.icons.shroom = love.graphics.newImage("gfx-forest/shroom.png")
]]

forestgfx:setupIcons("gfx-forest")


forestgfx.quads = {}
--[[
forestgfx.shroomAnim = newAnim(forestgfx.icons.shroom,32,32,2)
forestgfx.shroom = makeShroom(forestgfx.shroomAnim)
]]

--[[
forestgfx.icons.cloudsong = love.graphics.newImage("gfx-forest/cloudsong.png") --YOU FUCKING STOLE MY CLOUDSONG!
forestgfx.cloudsong = newAnim(forestgfx.icons.cloudsong,64,32,2)
forestgfx.cloudsong.z = 2
]]

forestgfx.trollCoords = {}
forestgfx.trollTime = 1

forestgfx.decs = {}
forestgfx.decTime = 0
forestgfx.decAnimN = 1
forestgfx.decs[1] = newAnim(love.graphics.newImage("gfx-forest/dec1.png"),32,32,8)
forestgfx.decs[2] = newAnim(love.graphics.newImage("gfx-forest/discobear.png"),64,64,16,math.huge)


forestgfx.music = newAnim(love.graphics.newImage("gfx-forest/musicmusicmusic.png"),1024/8,32,7,0.1)
forestgfx.music.z = 1

forestgfx.bglol = love.graphics.newImage("gfx-forest/background.png")

forestgfx.epicBearTime = 0

local function is3(a)
	if a == 3 then
		return 1
	end
	return 0
end

for i = 1,9 do
	local x = ((i-1)%3) + 1
	local y = math.floor((i-1)/3)+1
	forestgfx.quads[i] = love.graphics.newQuad(34*(x-1) - is3(x),34*(y-1) - is3(y),32,32,256,256)
end




function forestgfx:drawBg()
	--love.graphics.setColor(0,100,0)
	--love.graphics.rectangle("fill",0,0,width,height)

	love.graphics.setColor(255,255,255,200)
	for x = 0, width/128 do
		for y = 0, height/128 do
			love.graphics.draw(self.bglol, x*128, y*128, 0, 2)
		end
	end
	
	
	local i = 1
	while i < #self.trollCoords do
		self.music:draw(self.trollCoords[i]-256,self.trollCoords[i+1],true)
		i = i + 2
	end
	
	love.graphics.setColor(255,255,255)

end

function forestgfx:update(dt)
	self.epicBearTime = self.epicBearTime + dt
	if self.epicBearTime > 400 then
		self.decs[2].lolspeed = 0.1
	end
	
	self.music:stdUpdate(dt)
	self.decTime = self.decTime + dt
	self.decAnimN = math.floor(self.decTime*8)+1	
	for i = 1,#self.decs do
		local dec = self.decs[i]
		--dec.n = self.decAnimN%dec.maxn + 1	
		dec:stdUpdate(dt)
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
		if self.trollCoords[i] > width + 300 then
			table.remove(self.trollCoords,i)
			table.remove(self.trollCoords,i)
		end
		i = i+2
	end
end

for i = 1, 100 do
	forestgfx:update(1)
end



return forestgfx
