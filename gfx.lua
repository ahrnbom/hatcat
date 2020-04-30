--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

gfxClass = newClass()

gfxClass.nmyNameList = {"testenemy","nekosan", "camel","piraya","urchin","fallspike","theboss","deadboss"}
gfxClass.nmyNbrQuads = {testenemy = 4,nekosan = 4, camel = 8,piraya = 4,urchin = 1, fallspike = 8, theboss = 8,deadboss = 8}
gfxClass.nmyNbrHeight = {testenemy = 1,nekosan = 1, camel = 2,piraya = 1,urchin = 1, fallspike = 1, theboss = 2, deadboss = 2}

function getGfx(name)
	local pos = string.find(name, " ")
	if pos then
		name = "gfx-"..string.sub(name,pos+1)
		if (love.filesystem.exists(name.."/gfx.lua")) then
			local troll = love.filesystem.load(name.."/gfx.lua")
			return troll()
		end
	end
end

function gfxClass:setupIcons(name)
	self.pic = love.graphics.newImage(name.."/bg.png")
	self.icons = {}
	self.icons.score = love.graphics.newImage(name.."/score.png")
	self.icons.spawn = self.icons.score
	self.icons.goal = love.graphics.newImage(name.."/goal.png")
	self.icons["break"] = love.graphics.newImage(name.."/break.png")
	self.icons.hero = love.graphics.newImage(name.."/katten.png")
	self.icons.herofall = love.graphics.newImage(name.."/catfall.png")
	self.icons.opengoal = love.graphics.newImage(name.."/opengoal.png")
	self.icons.testenemy = love.graphics.newImage(name.."/testenemy.png")
	self.icons.shroom = love.graphics.newImage(name.."/shroom.png")
	self.icons.button = love.graphics.newImage(name.."/pushthebuttonandletmeknow.png")
	self.icons.buttblock = love.graphics.newImage(name.."/buttblock.png")
	self.icons.buttblock2 = love.graphics.newImage(name.."/buttblock2.png")
	self.icons.nekosan = love.graphics.newImage(name.."/nekosan.png")
	self.icons.spikes = love.graphics.newImage(name.."/spikes.png")
	self.icons.fallspike = love.graphics.newImage(name.."/fspike.png")
	self.icons.iceblock = love.graphics.newImage(name.."/iceblock.png")
	self.icons.theboss = love.graphics.newImage(name.."/theboss.png")
	self.icons.deadboss = love.graphics.newImage(name.."/deadboss.png")
end

function gfxClass:load()

end

function gfxClass:drawBg()

end

function gfxClass:whatever()

end

function gfxClass:update(dt)

end


function gfxClass.nmyQuad(sx,sy) --ENDAST FÖR EDITORN
	return love.graphics.newQuad(0,0,32,32,sx,sy)
end

function gfxClass:editorDrawNmys(nmys)
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

function gfxClass:drawDec(decs)
	for i = 1,#decs do
		local dec = decs[i]
		if self.decs[dec[1]] then
			--love.graphics.draw(self.decs[dec[1]],(dec[2]-1)*32,(dec[3]-1)*32)
			self.decs[dec[1]]:draw((dec[2]-0.5)*32,(dec[3]-1)*32)
		end
	end
end


function gfxClass:getPic()
	return self.pic
end

function gfxClass:getIcon(s)
	return self.icons[s]
end

function gfxClass:getQuads()
	return self.quads
end
