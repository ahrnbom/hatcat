local seasgfx = gfxClass:newSubClass()
--[[
seasgfx.pic = love.graphics.newImage("gfx-skies/bg.png")
seasgfx.pic:setFilter("nearest","nearest")

seasgfx.icons = {}
seasgfx.icons.score = love.graphics.newImage("gfx-skies/score.png")
seasgfx.icons.spawn = seasgfx.icons.score
seasgfx.icons.goal = love.graphics.newImage("gfx-skies/goal.png")
seasgfx.icons["break"] = love.graphics.newImage("gfx-skies/break.png")
seasgfx.icons.hero = love.graphics.newImage("gfx-skies/hero.png")
seasgfx.icons.opengoal = love.graphics.newImage("gfx-skies/opengoal.png")
seasgfx.icons.testenemy = love.graphics.newImage("gfx-skies/testenemy.png")
seasgfx.icons.shroom = love.graphics.newImage("gfx-skies/shroom.png")
seasgfx.icons.button = love.graphics.newImage("gfx-skies/pushthebuttonandletmeknow.png")
]]

seasgfx:setupIcons("gfx-seas")
seasgfx.quads = {}

seasgfx.icons.piraya = love.graphics.newImage("gfx-seas/piraya.png")
seasgfx.icons.urchin = love.graphics.newImage("gfx-seas/urchin.png")
seasgfx.icons.bubble = love.graphics.newImage("gfx-seas/bubble.png")

seasgfx.bubbleAnim = newAnim(seasgfx.icons.bubble, 32, 32, 8)

seasgfx.trollCoords = {}
seasgfx.trollTime = 1

seasgfx.decs = {}
seasgfx.decTime = 0
seasgfx.decAnimN = 1
seasgfx.decs[1] = newAnim(love.graphics.newImage("gfx-seas/seaweed.png"),32,32,1) --TODO



local function is3(a)
	if a == 3 then
		return 1
	end
	return 0
end

for i = 1,9 do
	local x = ((i-1)%3) + 1
	local y = math.floor((i-1)/3)+1
	seasgfx.quads[i] = love.graphics.newQuad(34*(x-1) - is3(x),34*(y-1) - is3(y),32,32,256,256)
end




function seasgfx:drawBg()
	love.graphics.setColor(22,108,225)
	love.graphics.rectangle("fill",0,0,width,height)

	love.graphics.setColor(255,255,255)

	local i = 1
	while i < #self.trollCoords do
		--love.graphics.draw(self.icons.bubble,self.trollCoords[i]-128,self.trollCoords[i+1],0,3)
		self.bubbleAnim:draw(self.trollCoords[i]-128,self.trollCoords[i+1])
		i = i + 2
	end

end

function seasgfx:update(dt)
	
	self.decTime = self.decTime + dt
	self.decAnimN = math.floor(self.decTime*8)+1	
	for i = 1,#self.decs do
		local dec = self.decs[i]
		dec.n = self.decAnimN%dec.maxn + 1	
	end
	self.bubbleAnim:stdUpdate(3*dt)
		
	self.trollTime = self.trollTime - dt
	if self.trollTime < 0 then
		self.trollTime = 1.2
		local randomx = (math.random())*width
		
		self.trollCoords[#self.trollCoords+1] = randomx
		self.trollCoords[#self.trollCoords+1] = height
	end
	local i = 1
	while i < #self.trollCoords do
		self.trollCoords[i] = self.trollCoords[i] + dt * 30 * math.cos(self.decTime)
		self.trollCoords[i+1] = self.trollCoords[i+1]-100*dt
		if self.trollCoords[i+1] < -128 then
			table.remove(self.trollCoords,i)
			table.remove(self.trollCoords,i)
		end
		i = i+2
	end
end

for i = 1, 100 do
	seasgfx:update(1)
end

return seasgfx
