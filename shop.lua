--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

shopstate = stateClass:newSubClass()

shopstate.values={15,20,20}

function shopstate:load()
	audio:playMusic("shop")
	self.texts = {"sound test", "secret hat", "hatsnake"}
	self.b = newButtList()
	
	local strings = {"secret 1 for 15 coins", "secret 2 for 20 coins", "secret 3 for 20 coins"}
	local str_len = font:getWidth(strings[1]) + 36
	
	local dy = 141
	
	self.b:add(newButt("back", 50, 50, self.goback))
	self.b:add(newButt(strings[1],centerx - str_len,centery - dy, self.secret1))
	self.b:add(newButt(strings[2],centerx,centery - dy, self.secret2))
	self.b:add(newButt(strings[3],centerx + str_len,centery - dy, self.secret3))
	self.sausage = self.getSausage()

	self:text()
	
	self.lolpic = love.graphics.newImage("res/shop.png")
	self.lolscale = 2
	--[[while self.lolpic:getHeight()*self.lolscale < height and self.lolpic:getWidth()*self.lolscale < width do
		self.lolscale = self.lolscale * 2
	end]]
	self.corr_uctions = 0
	if height > 900 then
		self.lolscale = 3
		self.corr_uctions = -5
	end
	
	self.hatcat = newAnim(love.graphics.newImage("gfx-skies/katten.png"),32,32,8,0.2)
	self.hatcat.z = self.lolscale*1.5
	
	self.littlemonkeylost = newAnim(love.graphics.newImage("res/gunnars_logga.png"),128,128,8,0.15)
	self.littlemonkeylost.z = self.lolscale*0.75
	
	self.tv = newAnim(love.graphics.newImage("res/tv.png"), 64, 64, 8, 0.1)
	self.tv.z = self.lolscale
end

function shopstate.cost() --called from outside
	local sg = shopstate.getSausage()
	local c = 0
	for i,v in ipairs(sg) do
		if v then
			c = c + shopstate.values[i]
		end
	end
	return c
end

function shopstate.getSausage() --can be called from outside
	local sausage = {}
	
	if love.filesystem.isFile("ibuysausage") then
		local con = love.filesystem.read("ibuysausage")
		local i = 1
		for num in con:gmatch("%d") do
			sausage[i] = tonumber(num)==1
			i = i+1
		end
	else
		sausage = {false,false,false}
	end
	
	return sausage
end

function shopstate:text()
	for i,v in ipairs(self.sausage) do
		if v then
			self.b.list[i+1]:setS(self.texts[i])
		end
	end
end

function shopstate:write(sausage)
	local s = ""
	for i = 1, 3 do
		local b = sausage[i]
		if b then
			s = s.."1 "
		else
			s = s.."0 "
		end
	end
	love.filesystem.write("ibuysausage", s)
end

function shopstate:buy(price, n, f)
	if self.sausage[n] then
		f()
	
	elseif coins >= price then
		
		coins = coins - price
		self.sausage[n] = true
		self:text()
		self:write(self.sausage)
	end
end

function shopstate.secret1()
	state:buy(15,1,function()
		changeState(soundTest)
	end)
end

function shopstate.secret2()
	state:buy(20,2,function()
		local f = love.graphics.newImage
		function love.graphics.newImage(src)
			if string.match(src,"katten") then
				return f("res/lolcat.png")
			elseif string.match(src,"catfall") then
				return f("res/lolcatfall.png")
			elseif string.match(src,"kamelkatt") then
				return f("gfx-chaos/kamelkatt_bonus.png")
			else
				return f(src)
			end
		end
		
		changeState(menuClass)
	end)
end

function shopstate.secret3()
	state:buy(20,3,function()
		changeState(minigameClass)
	end)
end

function shopstate.goback()
	globalpack = 9
	globalnumber = 1
	saveHS(hs)
	changeState(menuClass)
end

function shopstate:update(dt)
	self.hatcat:stdUpdate(dt)
	self.littlemonkeylost:stdUpdate(dt)
	self.tv:stdUpdate(dt)
end

function shopstate:draw()
	love.graphics.draw(self.lolpic, centerx - self.lolscale*self.lolpic:getWidth()*0.5, centery - self.lolscale*self.lolpic:getHeight()*0.5, 0, self.lolscale)
	self.tv:draw(centerx - self.lolscale*(256-120-self.corr_uctions), centery - self.lolscale*(128-106), true)
	--local s = "coins: " .. coins
	local s = "want to buy something? you have " .. coins .. " coins"
	love.graphics.print(s, centerx - font:getWidth(s)*0.5, 30)
	self.hatcat:draw(centerx + (400-256)*self.lolscale, centery + (190-32-128)*self.lolscale)
	self.littlemonkeylost:draw(centerx + (200-256)*self.lolscale, centery + (190-44-32-128)*self.lolscale, true)
	self.b:draw()
end

function shopstate:mousepressed()
	
	self.b:click()
end

function shopstate:keypressed(k)
	if (not release) and k=="p" then
		coins = 64
	end
end
