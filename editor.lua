--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

editorClass = stateClass:newSubClass()

editorClass.saveLevel = require('editor-save')

local cspeed = 150

function editorClass:addIcon(s,x,y)
	self.icons:add(newEItem(s,x,y,self.gfx))
end

function editorClass:load()
	self.loltime = 0

	self.camerax = 0
	self.cameray = 0
	
	
		
	self.lvlnbr = nextLevelForEditorLol
	nextLevelForEditorLol = nil
	
	self.diffstr = nextDiffForEditorLol
	nextDiffForEditorLol = nil
	
	self.icons = newItemList()
	
	self.gfx = getGfx(self.diffstr)
	
	local ok,chunk,result
	ok, chunk = pcall(love.filesystem.load,""..self.diffstr.."/lvl"..self.lvlnbr..".lua")
	if ok and chunk then
		local lol = chunk()
		self.lvl,self.icons,self.decs,self.nmys = lol(self.gfx)
		for i = 1,100 do
		for j = 1,100 do
			if not self.lvl[i][j] then
				self.lvl[i][j] = 0
			end
		end
	end
	else
		self.lvl = newLevel()
	end
	
	if not self.decs then
		self.decs = {}
	end
	self.cDec = 1
	
	if not self.nmys then
		self.nmys = {}
	end
	self.cNmy = 1
	
	self.sbsys = newSBsys(self.gfx,self.lvl)
	self.cTile = 5
	
	
	self.uctions = "     controls:   w,a,s,d - move camera   v - save level   q - quit   " .. 
		"k,l - scroll decorations   o - add or remove decoration   ',' '.' - scroll enemies    " ..
		"z - add or remove enemy   c - add key    p - spawn point    g - goal   " ..
		"b - insert loopbreak   m - insert mushroom   t - insert button    u - insert button block   " ..
		"i - insert spikes   e - insert iceblock"
	self.uctions_width = font:getWidth(self.uctions)
	self.uctions_x = 0
end

function editorClass.lolnil(a,b)
	if a[b] then
		return a[b]
	end
	return "nothing: "..b
end

function editorClass:draw()
	love.graphics.push()
		love.graphics.translate(-self.camerax,-self.cameray)
		self.sbsys:draw()
		self.icons:draw()
		self.gfx:drawDec(self.decs)
		self.gfx:editorDrawNmys(self.nmys)
	love.graphics.pop()
	love.graphics.print("level number: "..self.lvlnbr,width - 300,10)
	love.graphics.print("current tile: "..self.cTile,width - 300,40)
	love.graphics.print("current dec.: "..self.cDec,width - 300,70)
	love.graphics.print("current nmy: "..self.lolnil(gfxClass.nmyNameList,self.cNmy),width - 300,100)
	love.graphics.print("nbr of nmys: "..#self.nmys,width - 300,130)
	if self.lolsaved then
		love.graphics.print("saved as "..self.diffstr.."/lvl"..self.lvlnbr..".lua",10,height - 40)
	else
		love.graphics.print(self.uctions, self.uctions_x, height - 40)
		love.graphics.print(self.uctions, self.uctions_x + self.uctions_width, height - 40)
	end
end

function editorClass:update(dt)
	self.loltime = self.loltime + dt
	if self.loltime > 1 then
		--fix_everything(self.sbsys.lvl)
		self.loltime = 0
	end
	self.uctions_x = self.uctions_x - 70*dt
	if self.uctions_x < -self.uctions_width then
		self.uctions_x = 0
	end
	if self.lolsaved then
		self.lolsaved = self.lolsaved - dt
		if self.lolsaved < 0 then
			self.lolsaved = nil
		end
	end
	if love.keyboard.isDown('w') then
		self.cameray = self.cameray - cspeed*dt
	end
	if love.keyboard.isDown('a') then
		self.camerax = self.camerax - cspeed*dt
	end
	if love.keyboard.isDown('s') then
		self.cameray = self.cameray + cspeed*dt
	end
	if love.keyboard.isDown('d') then
		self.camerax = self.camerax + cspeed*dt
	end
	
end

function editorClass:keypressed(k)
	
	local key = tonumber(k)
	if key then
		self.cTile = key
	end
	
	if k == 'q' then
		changeState(editorSClass)
		globalnumber = self.lvlnbr
		for i=1,#worlds do
			if worlds[i] == self.diffstr then
				globalpack = i
			end
		end
	end
	
	if k=='c' or k=='p' or k=='g' or k=='b' or k=='m' or k=='t' or k=='u' or k=='i' or k=='e' then --som i sCore, sPawn och Goal och Break och buTton och bUttblock och spIkes och icEblock :ppPPPPppPppPPpp fett logiskt
		local mx,my = love.mouse.getPosition()
		mx = mx + self.camerax
		my = my + self.cameray
		local x = math.floor(mx/32)+1
		local y = math.floor(my/32)+1
		for i=1,#self.icons do
			if self.icons[i].x == x and self.icons[i].y == y then
				table.remove(self.icons,i)
				return
			end
		end
		if k=='c' then
			self:addIcon('score',x,y)
		elseif k=='p' then
			self:addIcon('spawn',x,y)
		elseif k=='g' then
			self:addIcon('goal',x,y)
		elseif k=='b' then 
			self:addIcon('break',x,y) --bryter loopar
		elseif k=='m' then
			self:addIcon('shroom',x,y) --svamp
		elseif k=='t' then	
			self:addIcon('button',x,y)
		elseif k=='u' then
			self:addIcon('buttblock',x,y)
		elseif k=='i' then
			self:addIcon('spikes',x,y)
		elseif k=='e' then
			self:addIcon('iceblock',x,y)
		end
	elseif k=='v' then --som i saVe :ppPPppPPppPPpp
		self.saveLevel(self.lvl,self.icons,self.decs,self.nmys,"lvl"..self.lvlnbr..".lua",self.diffstr)
		self.lolsaved = 5
	elseif k=='k' then --ingen logik; föregående dekoration
		if self.cDec > 1 then
			self.cDec = self.cDec - 1
		end
	elseif k=='l' then --ingen logik; nästa dekoration
		self.cDec = self.cDec + 1
	elseif k=='o' then --ingen logik; lägg/ta bort dekoration
		local mx,my = love.mouse.getPosition()
		mx = mx + self.camerax
		my = my + self.cameray
		local x = math.floor(mx/32)+1
		local y = math.floor(my/32)+1
		
		for i = 1,#self.decs do
			if self.decs[i][2] == x and self.decs[i][3] == y then
				table.remove(self.decs,i)
				return
			end
		end
		self.decs[#self.decs+1] = {self.cDec,x,y}
	elseif k==',' then --ingen logik, föregående fiende
		if self.cNmy > 1 then
			self.cNmy = self.cNmy - 1
		end
	elseif k=='.' then --ingen logik, nästa fiende
		self.cNmy = self.cNmy + 1
	elseif k=='z' then --ingen logik, lägg in fiende
		local mx,my = love.mouse.getPosition()
		mx = mx + self.camerax
		my = my + self.cameray
		local x = math.floor(mx/32)+1
		local y = math.floor(my/32)+1
		
		for i = 1,#self.nmys do
			if self.nmys[i][2] == x and self.nmys[i][3] == y then
				table.remove(self.nmys,i)
				return
			end
		end
		self.nmys[#self.nmys + 1] = {self.cNmy,x,y}

	end
	
end	

function editorClass:mousepressed(k)
	if k ~= 'l' then
		return
	end
	local mx,my = love.mouse.getPosition()
	mx = mx + self.camerax
	my = my + self.cameray
	local x = math.floor(mx/32)+1
	local y = math.floor(my/32)+1
	if x > #self.sbsys.lvl then 
		while x > #self.sbsys.lvl do
			self.sbsys.lvl[#self.sbsys.lvl+1] = {}
			for i = 1,#self.sbsys.lvl[1] do
				self.sbsys.lvl[#self.sbsys.lvl][i] = 0
			end
		end
	end
	if y > #self.sbsys.lvl[1] then
		while y > #self.sbsys.lvl[1] do
			for i = 1,#self.sbsys.lvl do
				self.sbsys.lvl[i][#self.sbsys.lvl[i]+1] = 0
			end
		end
	end	
	
	if self.cTile == 5 then
		local lvl = self.sbsys.lvl
		if lvl[x][y] ~= 5 then
			lvl[x][y] = self.cTile
			self:tryCorner(lvl,x+1,y,6)
			self:tryCorner(lvl,x-1,y,4)
			self:tryCorner(lvl,x,y+1,8)
			self:tryCorner(lvl,x,y-1,2)
			self:tryCorner(lvl,x+1,y+1,9)
			self:tryCorner(lvl,x-1,y-1,1)
			self:tryCorner(lvl,x-1,y+1,7)
			self:tryCorner(lvl,x+1,y-1,3)
		else
			lvl[x][y] = 0
			self:trollEmpty(lvl,x,y)
			self:trollEmpty(lvl,x-1,y)
			self:trollEmpty(lvl,x+1,y)
			self:trollEmpty(lvl,x,y-1)
			self:trollEmpty(lvl,x,y+1)
			self:trollEmpty(lvl,x-1,y-1)
			self:trollEmpty(lvl,x+1,y+1)
			self:trollEmpty(lvl,x+1,y-1)
			self:trollEmpty(lvl,x-1,y+1)
		end
	elseif self.cTile%2==0 then
		lvl[x][y] = 10*lvl[x][y] + self.cTile
	elseif self.cTile == 0 or self.cTile%2 == 1 then
		lvl[x][y] = self.cTile
	end
	self.sbsys:fill()
end

function editorClass:trollEmpty(lvl,x,y)
	if not lvl[x] then return end
	if not lvl[x][y] then return end
	if lvl[x][y] == 5 then return end
	local troll = 0
	if self:isSolidTroll(lvl,x+1,y) and troll < 10 then
		troll = 10*troll + 4
	end
	if self:isSolidTroll(lvl,x-1,y) and troll < 10 then
		troll = 10*troll + 6
	end
	if self:isSolidTroll(lvl,x,y-1) and troll < 10 then
		troll = 10*troll + 8
	end
	if self:isSolidTroll(lvl,x,y+1) and troll < 10 then
		troll = 10*troll + 2
	end
	if troll == 0 then
		if self:isSolidTroll(lvl,x+1,y+1) and troll < 10 then
			troll = 10*troll + 1
		end
		if self:isSolidTroll(lvl,x-1,y-1) and troll < 10 then
			troll = 10*troll + 9
		end
		if self:isSolidTroll(lvl,x+1,y-1) and troll < 10 then
			troll = 10*troll + 7
		end
		if self:isSolidTroll(lvl,x-1,y+1) and troll < 10 then
			troll = 10*troll + 3
		end
	end
	lvl[x][y] = troll
end

function editorClass:isSolidTroll(lvl,x,y)
	if not lvl[x] then return false end
	if not lvl[x][y] then return false end
	return lvl[x][y] == 5
end 

function editorClass:tryCorner(lvl,x,y,v)
	
	if not lvl[x] then return end
	if not lvl[x][y] then return end
	local a = lvl[x][y]
	if self:isCornerLol(a) then
		if a < 10 then
			lvl[x][y] = a*10 + v
		else
			lvl[x][y] = v
		end
	elseif v%2 == 0 and (a==6 or a==4 or a==2 or a==8) then
		lvl[x][y] = a*10 + v
	end
	
end

function editorClass:isCornerLol(a)
	if a > 10 then
		local b = math.floor(a/10)
		a = a%10
		return self:isCornerLol(a) and self:isCornerLol(b)
	else
		return (a == 0 or a==9 or a==1 or a == 7 or a == 3)
	end
end

--[[
function fix_everything(lvl)
	print("lol "..love.timer.getFPS())
	for x = 1,#lvl do
		for y = 1,#lvl[1] do
			if isSolidTroll(lvl,x,y) then
				tryCorner(lvl,x+1,y,6)
				tryCorner(lvl,x-1,y,4)
				tryCorner(lvl,x,y+1,8)
				tryCorner(lvl,x,y-1,2)
				tryCorner(lvl,x+1,y+1,9)
				tryCorner(lvl,x-1,y-1,1)
				tryCorner(lvl,x-1,y+1,7)
				tryCorner(lvl,x+1,y-1,3)

			end
			trollEmpty(lvl,x,y)
		end
	end
end
]]

function newLevel()
	local l = {}
	for i = 1,100 do
		l[i] = {}
		for j = 1,100 do
			l[i][j] = 0
		end
	end
	return l
end
