--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

minigameClass = stateClass:newSubClass()

function minigameClass:load()
	self.conf = newConfetti()

	self.effects = newEffects()

	self.bg = love.graphics.newImage("gfx-forest/background.png")
	self.bgw = self.bg:getWidth()
	self.bgh = self.bg:getHeight()

	self.oldRecord = self.oldRecord or 0
	if self.snake then
		if #self.snake >= self.oldRecord then
			self.oldRecord = #self.snake - 1
			love.filesystem.write("iwanttopoophere", ""..self.oldRecord)
		end
		
	end
	
	if self.oldRecord == 0 and love.filesystem.isFile("iwanttopoophere") then
		local rec = love.filesystem.read("iwanttopoophere")
		self.oldRecord = tonumber(rec)
	end
	self.flip = true
	
	self.lol = 1
	if height < 600 then
		self.lol = 0.5
	end
	
	audio:playMusic("rocks")
	
	self.exit = newButt("exit",50,height - 30, function()
		changeState(shopstate)
	end)
	--self.cat = newAnim(love.graphics.newImage("gfx-skies/katten.png"), 32, 32, 8, 0.1)
	self.cats = {}
	self.nmys = {}
	local worlds = {"skies", "forest", "seas", "chaos", "caverns", "summit", "serenity", "tower"}
	for i = 1, 8 do
		self.cats[i] = newAnim(love.graphics.newImageLol("gfx-" .. worlds[i] .. "/katten.png"), 32, 32, 8, 0.1)
		self.nmys[i] = newAnim(love.graphics.newImage("gfx-" .. worlds[i] .. "/testenemy.png"), 32, 32, 4, 0.1)
	end
	
	self.title = true
	self.titstring = "hatsnake and the obvious rip-off of a classic game"
	
	self.n = 16
	self.height = height - 10
	self.blocksize = self.height/self.n
	self.origx = (width - self.height)*0.5
	self.origy = 4
	
	self.snake = {{}} --hehe
	
	self.snake[1].x = self.n/2
	self.snake[1].y = self.n/2
	self.snake[1].dir = 1
	self.snake[1].c = self:generate(8)
	
	self.time = 0
	self.totaltime = 0
	self.rate = 0.25
	
	self.nmy = {x = self:generate(self.n - 2), y = self:generate(self.n - 2), c = self:generate(8)}
	
	self.busy = false
end

function minigameClass:generate(n)
	local val = math.ceil(math.random()*(n))
	if val > n then
		return n
	end
	if val == 0 then
		return 1
	end
	return val
end

function minigameClass:mirror(n)
	return n == 2 or n == 3
end

function minigameClass:draw()
	love.graphics.setColor(255,255,255,128)
	for x = 1, math.ceil(width/self.bgw) do
		for y = 1, math.ceil(height/self.bgh) do
			love.graphics.draw(self.bg, (x-1)*self.bgw, (y-1)*self.bgh)
		end
	end
	love.graphics.setColor(255,255,255)
	if self.title then
		love.graphics.print(self.titstring, centerx - font:getWidth(self.titstring)*0.5, centery - 70)
		love.graphics.print("space or click to start", centerx - font:getWidth("space or click to start")*0.5, centery - 10)
		if self.oldRecord > 0 then
			local s = "high score: " .. self.oldRecord
			love.graphics.print(s, centerx - font:getWidth(s)*0.5, centery + 50)
		end
		if self.winrar then
			love.graphics.print("a winrar is you", centerx - font:getWidth("a winrar is you")*0.5, centery + 110)
		end
	else
		love.graphics.print(""..#self.snake-1, 10, 10)
		love.graphics.rectangle("line",self.origx + self.lol*16, self.origy + self.lol*32, self.height - self.lol*64, self.height - self.lol*64)
		for i = 1, #self.snake do
			local cat = self.snake[i]
			self.cats[cat.c]:draw(self.origx + self.blocksize*cat.x, self.origy + self.blocksize*cat.y, self:mirror(cat.dir))
		end
		local c = self.nmy.c
		self.nmys[c]:draw(self.origx + self.blocksize*self.nmy.x, self.origy + self.blocksize*self.nmy.y, self.flip)
	end
	
	self.exit:draw()
	
	self.effects:draw()
	self.conf:draw()
end

function minigameClass:update(dt)
	self.effects:update(dt)
	self.conf:update(dt)
	
	if self.title then
		return
	end
	
	for i = 1, 8 do
		self.cats[i]:stdUpdate(dt)
		self.nmys[i]:stdUpdate(dt)
	end
	
	if #self.snake > 100 then
		self.winrar = true
	end
	
	self.time = self.time + dt
	self.totaltime = self.totaltime + dt
	self.rate = 0.05 + 0.2*math.exp(-self.totaltime*0.01)
	if self.time > self.rate then
		self.flip = not self.flip
		self.busy = false
		self.time = 0
		local head = self.snake[#self.snake]
		local new_x = head.x
		local new_y = head.y
		local dir = head.dir
		if dir == 1 then
			new_y = new_y - 1
		elseif dir == 2 then
			new_x = new_x + 1
		elseif dir == 3 then
			new_y = new_y + 1
		elseif dir == 4 then
			new_x = new_x - 1
		end
		
		if new_x == 0 or new_x == self.n - 1 or new_y == 0 or new_y == self.n - 1 then
			self:load()
			return
		end
		
		for i = 1, #self.snake - 1 do
			local cat = self.snake[i]
			if new_x == cat.x and new_y == cat.y then
				self:load()
				return
			end
		end
		
		local toRemove = true
		
		if new_x == self.nmy.x and new_y == self.nmy.y then
			
			self.effects:add(self.nmys[self.nmy.c], self.origx + self.blocksize*self.nmy.x, self.origy + self.blocksize*self.nmy.y)
			
			self.conf:spawn(self.origx + self.blocksize*self.nmy.x, self.origy + self.blocksize*self.nmy.y, 64 + 2*#self.snake)
			
			local oldc = self.nmy.c
			
			self.nmy.x = head.x
			self.nmy.y = head.y
			local calcs = 0
			while not self:nocollide(self.snake, self.nmy.x, self.nmy.y, new_x, new_y) do
				calcs = calcs + 1
				if calcs > 1024 then
					
					self:load()
					return
				end
				self.nmy.x = self:generate(self.n - 2)
				self.nmy.y = self:generate(self.n - 2)
			end
			audio:playSfx("kids")
			
			self.nmy.c = self:generate(#self.nmys)
			print(oldc .. " " .. self.nmy.c)
			while self.nmy.c == oldc do
				self.nmy.c = self:generate(#self.nmys)
			end
			toRemove = false
		end
		
		table.insert(self.snake, {x = new_x, y = new_y, dir = head.dir, c = self:generate(8)})
		if toRemove then
			table.remove(self.snake, 1)
		end
		
		
	end
end

function minigameClass:nocollide(list, x, y, xx, yy)
	if x == xx and y == yy then
		return false
	end
	for i = 1, #list do
		if list[i].x == x and list[i].y == y then
			return false
		end
	end
	
	return true
end

function minigameClass:keypressed(k)
	if (not self.title) and self.busy then
		return
	end
	if k==" " then
		self.title = false
	elseif k=="w" or k=="up" then
		self.snake[#self.snake].dir = 1
		self.busy = true
	elseif k=="a" or k=="left" then
		self.snake[#self.snake].dir = 4
		self.busy = true
	elseif k=="s" or k=="down" then
		self.snake[#self.snake].dir = 3
		self.busy = true
	elseif k=="d" or k=="right" then
		self.snake[#self.snake].dir = 2
		self.busy = true
	
	end
	
end

function minigameClass:mousepressed(k)
	self.title = false
	local x,y = love.mouse.getPosition()
	if self.exit:inside(x,y) then
		self.exit.click()
	end
	
	local xyScale = width/height
	local yxScale = height/width
	
	if y*xyScale > x then
		--nere vänster
		if height - y*xyScale > x then
			--vänster
			self:keypressed("left")
		else
			--ner
			self:keypressed("down")
		end
	else
		--uppe höger
		if height - y*xyScale > x then
			--upp
			self:keypressed("up")
		else
			--höger
			self:keypressed("right")
		end
	end
	
end
