local chaosgfx = gfxClass:newSubClass()


chaosgfx:setupIcons("gfx-chaos")
chaosgfx.quads = {}

chaosgfx.icons.camel = love.graphics.newImage("gfx-chaos/camel.png")
chaosgfx.icons.camelcat = love.graphics.newImage("gfx-chaos/kamelkatt.png")

chaosgfx.trollCoords = {}
chaosgfx.trollTime = 1

chaosgfx.decs = {}
chaosgfx.decTime = 0
chaosgfx.decAnimN = 1
chaosgfx.decs[1] = newAnim(love.graphics.newImage("gfx-chaos/lolcactus.png"),32,32,1) 
chaosgfx.sand = love.graphics.newImage("gfx-chaos/sand.png")

chaosgfx.sun = love.graphics.newImage("gfx-chaos/background_sun.png")

local function is3(a)
	if a == 3 then
		return 1
	end
	return 0
end

for i = 1,9 do
	local x = ((i-1)%3) + 1
	local y = math.floor((i-1)/3)+1
	chaosgfx.quads[i] = love.graphics.newQuad(34*(x-1) - is3(x),34*(y-1) - is3(y),32,32,256,256)
end




function chaosgfx:drawBg()
	love.graphics.setColor(170,210,255)
	love.graphics.rectangle("fill",0,0,width,height)
	
	love.graphics.setColor(255,255,255)
	love.graphics.draw(self.sun, 155, 70, 0.4*math.pi*math.sin(self.decTime*0.6), 2, 2, 32, 32)
	
	love.graphics.push()
		love.graphics.scale(2)
		local i = 1
		while i < #self.trollCoords do
			love.graphics.draw(self.sand, self.trollCoords[i], self.trollCoords[i+1])
			i = i + 2
		end
	love.graphics.pop()	
end

function chaosgfx:update(dt)
	self.decTime = self.decTime + dt
	self.decAnimN = math.floor(self.decTime*8)+1	
	for i = 1,#self.decs do
		local dec = self.decs[i]
		dec.n = self.decAnimN%dec.maxn + 1	
	end
		
	self.trollTime = self.trollTime - dt
	if self.trollTime < 0 then
		self.trollTime = 0.01
		self.trollCoords[#self.trollCoords+1] = 0
		self.trollCoords[#self.trollCoords+1] = math.random()*height
	end
	local i = 1
	while i < #self.trollCoords do
		self.trollCoords[i] = self.trollCoords[i]+150*dt
		self.trollCoords[i+1] = self.trollCoords[i+1]-20*dt
		if self.trollCoords[i] > width + 134 then
			table.remove(self.trollCoords,i)
			table.remove(self.trollCoords,i)
		end
		i = i+2
	end
end

for i = 1, 100 do
	chaosgfx:update(1)
end


return chaosgfx
