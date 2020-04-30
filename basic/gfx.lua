local basicgfx = gfxClass:newSubClass()
--[[
basicgfx.pic = love.graphics.newImage("basic/bg.png")
basicgfx.pic:setFilter("nearest","nearest")

basicgfx.icons = {}
basicgfx.icons.score = love.graphics.newImage("basic/score.png")
basicgfx.icons.spawn = basicgfx.icons.score
basicgfx.icons.goal = love.graphics.newImage("basic/goal.png")
basicgfx.icons["break"] = love.graphics.newImage("basic/break.png")
basicgfx.icons.hero = love.graphics.newImage("basic/hero.png")
basicgfx.icons.opengoal = love.graphics.newImage("basic/opengoal.png")
basicgfx.icons.testenemy = love.graphics.newImage("basic/testenemy.png")
basicgfx.icons.shroom = love.graphics.newImage("basic/shroom.png")
]]

basicgfx:setupIcons("basic")

basicgfx.quads = {}



basicgfx.trollCoords = {}
basicgfx.trollTime = 1

basicgfx.decs = {}
basicgfx.decTime = 0
basicgfx.decAnimN = 1
basicgfx.decs[1] = newAnim(love.graphics.newImage("basic/dec1.png"),32,32,8)

local function is3(a)
	if a == 3 then
		return 1
	end
	return 0
end

for i = 1,9 do
	local x = ((i-1)%3) + 1
	local y = math.floor((i-1)/3)+1
	basicgfx.quads[i] = love.graphics.newQuad(34*(x-1) - is3(x),34*(y-1) - is3(y),32,32,256,256)
end



function basicgfx:getPic()
	return self.pic
end

function basicgfx:getIcon(s)
	return self.icons[s]
end

function basicgfx:getQuads()
	return self.quads
end

function basicgfx:drawBg()
	love.graphics.setColor(255,255,255,50)
	
	local i = 1
	while i < #self.trollCoords do
		love.graphics.push()
		love.graphics.scale(10*math.sin(0.001*self.trollCoords[i]+self.trollCoords[i+1]))
		love.graphics.rectangle("line",self.trollCoords[i],self.trollCoords[i+1],10,10)
		love.graphics.pop()
		i = i + 2
	end
	
	love.graphics.setColor(255,255,255)
end

function basicgfx:update(dt)
	self.decTime = self.decTime + dt
	self.decAnimN = math.floor(self.decTime*8)+1	
	for i = 1,#self.decs do
		local dec = self.decs[i]
		dec.n = self.decAnimN%dec.maxn + 1	
	end
	
		
	self.trollTime = self.trollTime - dt
	if self.trollTime < 0 then
		self.trollTime = 0.05
		self.trollCoords[#self.trollCoords+1] = 0
		self.trollCoords[#self.trollCoords+1] = math.random()*height
	end
	local i = 1
	while i < #self.trollCoords do
		self.trollCoords[i] = self.trollCoords[i]+200*dt
		if self.trollCoords[i] > width then
			table.remove(self.trollCoords,i)
			table.remove(self.trollCoords,i)
		end
		i = i+2
	end
end

function basicgfx:drawDec(decs)
	for i = 1,#decs do
		local dec = decs[i]
		if self.decs[dec[1]] then
			--love.graphics.draw(self.decs[dec[1]],(dec[2]-1)*32,(dec[3]-1)*32)
			self.decs[dec[1]]:draw((dec[2]-0.5)*32,(dec[3]-1)*32)
		end
	end
end

function basicgfx.nmyQuad(sx,sy) 
	return love.graphics.newQuad(0,0,32,32,sx,sy)
end

function basicgfx:editorDrawNmys(nmys)
	for i = 1,#nmys do
		local nmy = nmys[i]
		local name = self.nmyNameList[nmy[1]]
		if name then
			local icon = self.icons[name]
			local x = (nmy[2]-1)*32
			local y = (nmy[3]-1)*32
			love.graphics.drawq(icon,self.nmyQuad(icon:getWidth(),icon:getHeight()),x,y)
		end
	end
end

return basicgfx
