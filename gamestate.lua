--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

gamestateClass = stateClass:newSubClass()

gamestateClass.noInput = false

function gamestateClass:isEmpty(x,y, noice)
	local trollx = math.floor(x/32)+1
	local trolly = math.floor(y/32)+1
	if self.lvl[trollx] and self.lvl[trollx][trolly] then
		if self.lvl[trollx][trolly] == 5 then
			return false
		end
	end
	
	if self.pushTheButtonAndLetMeKnow then
		for i=1,#self.buttblocks do --fantastiskt namn
			if stdCollide2(x,y,self.buttblocks[i]) then
				return false
			end
		end
	end
	
	for i = 1, #self.iceblocks do
		local iceblock = self.iceblocks[i]
		if not iceblock.counter then
			iceblock.counter = 0
		end
		if stdCollide2(x,y, iceblock) then
			if not iceblock.pic.flagInvisible and iceblock.counter < 0.5 then
				if not noice then
					iceblock.counter = iceblock.counter + self.delta*0.5
				end
				local t = iceblock.counter * 2 * 8
				local t2 = math.ceil(t)
				if t2 == 0 then
					t2 = 1
				end
				iceblock.pic.n = t2
				if t>=8 then
					iceblock.pic.flagInvisible = true
				end
				return false
			else
				iceblock.pic.flagInvisible = true
				
			end
		end
	end
	
	return true
end

function gamestateClass:die(argstring)
	self.fast = false
	self.slow = false
	if self.tryagain.returnButt.list[1] then
		local tween = self.tryagain.returnButt.list[1].tween
		tween.clicktime = 0
		tween.fact = 1
	end
	
	if argstring == "giveup" then
		self.tryAgainCanGoBack = true
	else
		self.tryAgainCanGoBack = nil
		if self.flagLavaDeath and self.diffstr == "crystal caverns" and self.lvlnbr == 6 then
			self.flagFurminated = true
		end
		
		print(self.hero.x .. " " .. self.hero.y)
		if self.diffstr == "stellar serenity" and self.lvlnbr == 5 and self.hero.x > 700 and self.hero.y > 222 and self.hero.y < 225 then -- and then?
			doktorkosmos = true
			audio:shutup()
			local song = love.audio.newSource("audio/drk.ogg")
			song:setLooping(true)
			audio.mlist["stellar serenity"] = song
		end
	end

	globalzoom = self.zoom
	if self.epicWin then
		
		globalnumber = self.lvlnbr --???
		globalpack = 1
		for i=1,#worlds do
			if worlds[i]==self.diffstr then
				globalpack = i
			end
		end
		beatenlevels[self.lvlnbr + 7*(globalpack-1)] = 1
		
		if self.numLoops < hs[self.diffstr][self.lvlnbr] then
			local ml = minLoops[self.diffstr][self.lvlnbr]
			if hs[self.diffstr][self.lvlnbr] > ml and self.numLoops <= ml then
				--visa "you've got a coin lulz"
				audio:playMusic("winfanfare",true)
				exit_prompt = newpopup("coin obtained!",{{"ok",function()
					exit_prompt = nil
				end}})
			end
			
			hs[self.diffstr][self.lvlnbr] = self.numLoops
			saveHS(hs)
			
		end

		
		changeState(menuClass)
		return
	end
	self.tryAgainScreen = true
	
end

function gamestateClass:changeZoom(dz,abs)
	if abs then
		self.zoom = dz
	else
		self.zoom = self.zoom + dz
	end
	if self.zoom < 0.16 then
		self.zoom = 0.16
	end
	if self.zoom > 7 then
		self.zoom = 7
	end
end

local function signedcompare(x,y,z)
	local sign = true
	if z < 0 then
		sign = false
	end
	
	if sign then
		return x < y
	else
		return x > -y
	end
	
end

function gamestateClass:moveCam(dx,dy)
	local factor = 1
	if self.slow then
		factor = 3
	elseif self.fast then
		factor = 0.33
	end

	local nx = self.camerax + dx*factor
	local ny = self.cameray + dy*factor
	
	if signedcompare(nx, 2000, dx) then
		self.camerax = nx
	end
	if signedcompare(ny, 2000, dy) then
		self.cameray = ny
	end
end

function gamestateClass:moveCamCont(x,y)
	self.camovex = x
	self.camovey = y
end

function gamestateClass:makeLoop()
	--if not self.loop.draw then return end
	audio:sfxShutup('loop2')
	if self.newloop then
		if not self.newloop.int then
			self.loop.active = false
			self.loop.draw = false
			self.newloop = nil
			for i,v in ipairs(self.moving) do
				v.insideLoop = false
				v.insideLoop2 = false
			end
			audio:playSfx("close2")
			return
		end
		self.loop = self.newloop
		self.newloop = nil
		
	end
	
	if math.abs(self.loop.w) > 2 and math.abs(self.loop.h) > 2 then
		self.numLoops = self.numLoops + 1
		
		self.loop.active = true
		self.loop.draw = true
		
		if self.loop.w < 0 then
			self.loop.x = self.loop.x + self.loop.w
			self.loop.w = self.loop.w * -1
		end
		if self.loop.h < 0 then
			self.loop.y = self.loop.y + self.loop.h
			self.loop.h = self.loop.h * -1
		end
		
		for i,v in ipairs(self.moving) do
			local y_corr = 0
			if v.flagHero then
				y_corr = -1
			end
			if v.x > self.loop.x and v.y + y_corr > self.loop.y and v.x < self.loop.x+self.loop.w and v.y < self.loop.y+self.loop.h + 1 then
				v.insideLoop = true
			else
				v.insideLoop = false
			end
		end
		audio:playSfx("close")
	else
		self.loop.active = false
		self.loop.draw = false
		audio:playSfx("close2")
	end
end

function gamestateClass:beginLoop(x,y)
	self.newloop = {}
	self.newloop.x = x
	self.newloop.y = y
	self.newloop.w = 0
	self.newloop.h = 0
	self.newloop.active = false
	self.newloop.draw = true
	audio:playSfxRepeat('loop2')
end

function gamestateClass:updateLoop(x,y)
	if self.newloop then
		self.newloop.w = x - self.newloop.x
		self.newloop.h = y - self.newloop.y
		local res = false
		local sx = math.min(self.newloop.x,self.newloop.x+self.newloop.w)
		local mx = math.max(self.newloop.x,self.newloop.x+self.newloop.w)
		local sy = math.min(self.newloop.y,self.newloop.y+self.newloop.h)
		local my = math.max(self.newloop.y,self.newloop.y+self.newloop.h)
		
		
		for i,v in ipairs(self.moving) do
			if v.x > sx and v.y-1 > sy and v.x < mx and v.y + 1 < my then
				v.insideLoop2 = true
				res = true	
			else
				v.insideLoop2 = false
			end
		end
		
		local containsBreak = false
		for i,v in ipairs(self.breaks) do
			local x = (v.x-1)*32
			local y = (v.y-1)*32
			if x + 32 > sx and y + 32 > sy and x < mx and y+2 < my then
				containsBreak = true
			end
		end
		if containsBreak then
			
			self.newloop.int = false
			audio:loopingPitch(0.7)
			return
		end
		self.newloop.int = res
		if res then
			audio:loopingPitch(1)
		else
			audio:loopingPitch(0.7)
		end
		
	end
end

function gamestateClass:breakLoop()
	self.loop.draw = false
	self.loop.active = false
	audio:sfxShutup('loop2')
end

function gamestateClass:addCircle(x, y)
	table.insert(self.circles, {x = x, y = y, t = 0})
end


function gamestateClass:loadlevel(n,s,gfx)
	local troll = love.filesystem.load(s.."/lvl"..n..".lua")
	local lvl,items,decs,nmys = troll()(gfx)
	for i = 1,100 do
		for j = 1,100 do
			if not lvl[i][j] then
				lvl[i][j] = 0
			end
		end
	end
	return lvl,items,decs,nmys or {}
end


--HÄR BÖRJAR LOAD
function gamestateClass:load()
	
	self.effects = newEffects()
	
	self.epictime = 0
	
	self.flagGameStateClass = true
	self.outsideAlpha = 180

	self.slow = false
	self.fast = false

	if self.bosshealth then
		self.bosshealth = 16
	end
	self.circles = {}

	self.delta = 0
	self.numLoops = 0
	
	
	self.pushTheButtonAndLetMeKnow = false
	
	
	self.hint = newHint(
		{
		"desu",
		"lololol",
		"how are you reading this?"
		}
	)
	
	self.tryagain = require("tryagain")()

	self.camovex = 0
	self.camovey = 0
	

	self.lvlnbr = self.lvlnbr or nextLevelForEditorLol
	nextLevelForEditorLol = nil
	self.diffstr = self.diffstr or nextDiffForEditorLol
	nextDiffForEditorLol = nil
	
	if self.diffstr == "seven seas" then
		self.underwater = true
	end
	
	if not dontPlayMusic then
		audio:playMusic(self.diffstr) 
		
	end
	self.gfx = getGfx(self.diffstr) 
	
	local nmys = nil
	self.lvl, self.items, self.decs,nmys = self:loadlevel(self.lvlnbr,self.diffstr,self.gfx)
	if drawMode and drawMode == 1 then
		self.engine = newSBsys(self.gfx,self.lvl)
	else
		self.engine = newFBsys(self.gfx,self.lvl)
	end
	
	--blocks
	self.buttblocks = {}
	self.iceblocks = {}
	
	--earlybirds, håll så tom som möjligt
	self.earlybirds = {}
	
	for i = 1,#self.items.list do
		
		if self.items.list[i].s == 'spawn' then
			self.spawnx = self.items.list[i].x*32
			self.spawny = self.items.list[i].y*32
		elseif self.items.list[i].s == "buttblock" then --fyller buttblocks med alla buttblocks
			table.insert(self.buttblocks,self.items.list[i])
		elseif self.items.list[i].s == "iceblock" then
			table.insert(self.iceblocks, self.items.list[i])
		elseif self.items.list[i].s == 'button' then
			table.insert(self.earlybirds,self.items.list[i])
		end
		
		self.items.list[i]:load(self)
	end
	
	self.breaks = {}
	for i = 1,#self.items.list do
		if self.items.list[i].s=='break' then
			table.insert(self.breaks,self.items.list[i])
		end
	end
	
	self.camerax = self.spawnx
	self.cameray = self.spawny
	self.zoom = globalzoom or 2
	if preciseControls then
		self.c = conTrollP:set(self)
	else
		self.c = conTroll:set(self)
	end
	
	self.c.loopOpen = false
	
	self.lvlw = #self.lvl*32
	self.lvlh = #self.lvl[1]*32
	
	
	self.moving = {}
	
	local createHero = require('hero')
	self.hero = createHero(newAnim(self.gfx.icons.hero,32,32,8),self.spawnx,self.spawny-1,newAnim(self.gfx.icons.herofall,32,32,4))
	
	table.insert(self.moving,self.hero) --ABSOLUT NÖDVÄNDIGT ATT HJÄLTEN ÄR FÖRST
	
	for i = 1,#nmys do
		local nmy = newEnemy(self.gfx.nmyNameList[nmys[i][1]],self.gfx):newInstance()
		nmy:setPos((nmys[i][2]-1)*32,(nmys[i][3]-1)*32 - 1)
		table.insert(self.moving,nmy)
	end
	
	self.loop = {}
	self.pause = true
	
	local hasScore = false
	local goalPos = 0
	for i = 1,#self.items.list do
		if state.items.list[i].s == 'score' then
			hasScore = true
		elseif state.items.list[i].s == 'goal' then
			goalPos = i
		end
	end
	if not hasScore then
		self.items.list[goalPos].pic = newAnim(self.gfx.icons['opengoal'],32,32,2)
	end
	
	self.levelname = levelnames[self.diffstr][self.lvlnbr]
	if not self.levelname then
		self.levelname = ""
	end
	self.lvlnamew = font:getWidth(self.levelname)
	if self.flagUctions then
		self.levelname = ""
	end
	
	self.tc = {255,255,255}
	if self.diffstr == "sunny skies" or self.diffstr == "cactus chaos" then
		self.tc = {0,0,0}
	end
	
	if self.diffstr == "stellar serenity" and doktorkosmos then
		self.hero.walkpic.pic = love.graphics.newImage("res/drk.png")
		self.hero.fallpic.pic = love.graphics.newImage("res/drkf.png")
	end
end

local function isTrue(a)
	if a then return 1 end
	return -1
end

function gamestateClass:toScreenCoordsX(x)
	return (x*self.zoom + centerx - self.camerax*self.zoom)
end

function gamestateClass:toScreenCoordsY(y)
	return (y*self.zoom + centery - self.cameray*self.zoom)
end

function gamestateClass:toWorldCoordsX(sx)
	return sx/self.zoom - centerx/self.zoom + self.camerax
end

function gamestateClass:toWorldCoordsY(sy)
	return sy/self.zoom - centery/self.zoom + self.cameray
end

function gamestateClass:tryAgainDraw()
	self.tryagain:draw()
end

function gamestateClass:drawInScissors(dx, dy)
	if love.window then
		-- >__> what is this I don't even
		dy = 0
	end
	local f = 1
	if lolhuge then
		f = 2
	end
	
	local loop = self.loop
	
	love.graphics.setScissor(
		f*self:toScreenCoordsX(loop.x + dx), 
		f*self:toScreenCoordsY(loop.y + dy),
		f*loop.w*self.zoom,
		f*loop.h*self.zoom
	)
	local moving = self.moving
	for i=1,#moving do
		if moving[i].insideLoop then
			local alpha1 = 255
			local alpha2 = 140
			if moving[i].lolAlpha then
				alpha1 = alpha1 * moving[i].lolAlpha
				alpha2 = alpha2 * moving[i].lolAlpha
			end
			love.graphics.setColor(255,255,255,alpha1)
			moving[i]:draw(dx,dy,moving[i].dir)
			love.graphics.setColor(255,255,255,alpha2)
			moving[i]:draw(loop.h + dy,dx, moving[i].dir)
			moving[i]:draw(-loop.h + dy,dx, moving[i].dir)
			moving[i]:draw(dy, -loop.w + dx, moving[i].dir)
			moving[i]:draw(dy, loop.w + dx, moving[i].dir)
		end
	end
	love.graphics.setColor(255,255,255)
				
	love.graphics.setScissor()
end

function gamestateClass:scrollwheel(k)
	if k == "wd" then
		self:changeZoom(-0.5)
		self.c.butts.troll.list[3].click()
		audio:playSfx("butt")
	else
		self:changeZoom(0.5)
		self.c.butts.troll.list[2].click()
		audio:playSfx("butt")
	end
end

local function lolfix(val)
	return val
end

function gamestateClass:draw()
	self.engine.gfx:drawBg()
	love.graphics.push()
		local cx = math.ceil(self.camerax*self.zoom)
		local cy = math.ceil(self.cameray*self.zoom)
		--local cx = (self.camerax*self.zoom)
		--local cy = (self.cameray*self.zoom)
		love.graphics.translate(-cx + centerx,-cy + centery)
		love.graphics.scale(self.zoom)
		--self.engine:draw()
		self.items:draw(true)
		if self.pushTheButtonAndLetMeKnow then
			for i=1,#self.buttblocks do
				love.graphics.draw(self.gfx.icons.buttblock2,(self.buttblocks[i].x-1)*32,(self.buttblocks[i].y-1)*32)
			end
		end
		self.gfx:drawDec(self.decs or {})
		local epicmoving = self.moving
		if self.loop.active then
			love.graphics.push()
			love.graphics.setColor(255,255,255,self.outsideAlpha)
			
			for i=1,#epicmoving do
				if not epicmoving[i].insideLoop then
					
					epicmoving[i]:draw(0,0,epicmoving[i].dir)
				end
			end
			love.graphics.pop()
			
			
			self:drawInScissors(0,0)
			

		else
			for i=1,#epicmoving do
				if epicmoving[i].lolAlpha then
					love.graphics.setColor(255,255,255,255*epicmoving[i].lolAlpha)
				end
				if (self.newloop and self.newloop.active == false and self.newloop.draw == true) then
					--vi håller på att bygga en loop
					if not epicmoving[i].insideLoop2 then
						love.graphics.setColor(self.outsideAlpha, self.outsideAlpha, self.outsideAlpha)
					end
				end
				epicmoving[i]:draw(0,0,epicmoving[i].dir)
				love.graphics.setColor(255,255,255)
			end
		end

	
		self.engine:draw() --småmärklig position, fungerar bra för moln iaf
		
		local loop = self.loop
		if loop.draw then
			
			if loop.active then
				love.graphics.setColor(0,0,0,100)
				local thousand = 300000*self.zoom
				if love.graphics.setInvertedStencil then
					love.graphics.setInvertedStencil(function()
						love.graphics.rectangle("fill", loop.x, loop.y, loop.w, loop.h)
					end)
					love.graphics.rectangle("fill", -thousand, -thousand, 2*thousand, 2*thousand)
					love.graphics.setInvertedStencil()
				else
					love.graphics.rectangle("fill",-thousand,-thousand,lolfix(thousand+loop.x),2*thousand)
					love.graphics.rectangle("fill",lolfix(loop.x+loop.w),-thousand,thousand,2*thousand)
					love.graphics.rectangle("fill",lolfix(loop.x),-thousand,lolfix(loop.w),lolfix(thousand+loop.y))
					love.graphics.rectangle("fill",lolfix(loop.x),lolfix(loop.y + loop.h), lolfix(loop.w), thousand)
				end
				
				love.graphics.setColor(0,255,255,20)
			else
				love.graphics.setColor(255,0,0,20)				
			end
			
			love.graphics.rectangle("fill",loop.x,loop.y,loop.w,loop.h-1)
			
			if loop.active then
				love.graphics.setColor(0,255,255)
			else
				love.graphics.setColor(255,0,0)				
			end
			
			love.graphics.setLineWidth(4/self.zoom)
			love.graphics.rectangle("line",loop.x, loop.y, loop.w, loop.h)
			love.graphics.setLineWidth(3)
		end
		
		--NEWLOOP
		if self.newloop then
			local newloop = self.newloop
			if newloop.int then
				love.graphics.setColor(0,255,0, 128)			
			else
				love.graphics.setColor(255,0,0, 128)
			end
			
			love.graphics.setLineWidth(4/self.zoom)
			love.graphics.rectangle("line",newloop.x,newloop.y,newloop.w + 1, newloop.h + 1)
			love.graphics.setLineWidth(3)
			if preciseControls then
				if newloop.int then
					love.graphics.setColor(0,255,0)			
				else
					love.graphics.setColor(255,0,0)
				end
				local cs = 12/self.zoom
				love.graphics.circle("fill", newloop.x, newloop.y, cs, 30)
				love.graphics.circle("fill", newloop.x + newloop.w, newloop.y, cs, 30)
				love.graphics.circle("fill", newloop.x, newloop.y + newloop.h, cs, 30)
				love.graphics.circle("fill", newloop.x + newloop.w, newloop.y + newloop.h, cs, 30)
			end
			if newloop.int then
				love.graphics.setColor(0,255,0,20)			
			else
				love.graphics.setColor(255,0,0,20)
			end
			love.graphics.rectangle("fill", newloop.x, newloop.y, newloop.w, newloop.h - 1)
			love.graphics.setColor(255,255,255)
		end
		
		for i,v in ipairs(self.circles) do
			love.graphics.setColor(255,0,255,math.max(255 - v.t*255, 0))
			love.graphics.circle("line", v.x, v.y, v.t*100, 128)
		end
		love.graphics.setColor(255,255,255)
		self.effects:draw()
	love.graphics.pop()
	
	if self.engine.gfx.drawFg then
		self.engine.gfx:drawFg()
	end
	
	if not self.noInput and not love.keyboard.isDown("n") then
		self.c:draw()
		local s = ""
		if self.bosshealth then
			s = "boss health: " .. self.bosshealth
		
		elseif showFPS then
			
			s = "loops: " ..  self.numLoops .. "/" .. minLoops[self.diffstr][self.lvlnbr] .. "  fps: "..love.timer.getFPS()
			if minLoops[self.diffstr][self.lvlnbr] == 99 then
				s = "boss health: " .. 16
			end
		else
			s = "loops: " .. self.numLoops .. "/" .. minLoops[self.diffstr][self.lvlnbr]
			if minLoops[self.diffstr][self.lvlnbr] == 99 then
				s = "boss health: " .. 16
			end
		end
		love.graphics.print(s,centerx-font:getWidth(s)*0.5,height - 40)
		if self.hint.active then
			self.hint:draw(10,100)
		end
	end
	if self.epictime < 4 then
		love.graphics.setColor(self.tc[1], self.tc[2], self.tc[3], 255*smooth_step(1 - self.epictime*0.25))
		love.graphics.printf(self.levelname, width*0.1, centery - 150, width*0.8, "center")
	end
end

function gamestateClass:tryAgainUpdate(dt)

end

function gamestateClass:keyreleased(k)
	if k=="f" then
		self.fast = false
		self.slow = false
		
	elseif k=="g" then
		self.slow = false
		self.fast = false
	end
end

function gamestateClass:update(dt)
	
	self.effects:update(dt)
	
	if self.fast then
		audio:setSpeed(1.2)
	elseif self.slow then
		audio:setSpeed(0.8)
	else
		audio:setSpeed(1)
	end

	self.epictime = self.epictime + dt
	for i = #self.circles, 1, -1 do
		local v = self.circles[i]
		v.t = v.t + dt
		if v.t > 1 then
			table.remove(self.circles, i)
		end
	end
	
	if not self.noInput then
		if self.fast or love.keyboard.isDown("f") then
			--dt = dt*3
			-- görs i main istället, stabilare så
			self.fast = true
			self.slow = false
		else
			self.fast = false
		end
		if self.slow or love.keyboard.isDown("g") then
			dt = dt*0.33
			self.slow = true
			self.fast = false
		else
			self.slow = false
		end
	end
	
	self.delta = dt
	if not self.bosshealth then
		self.pushTheButtonAndLetMeKnow = false
	end
	self:earlyCollisions() 
	self:updateAnims(dt) --bara editoritems
	if not self.pause then
		self.engine.gfx:update(dt)
	end
	if not self.noInput then
		self:moveCam(self.camovex*dt, self.camovey*dt)
		self.c:update(dt)
	end
	if self.pause then
		return 
	end
	
	for i=1,#self.moving do
		if self.moving and self.moving[i] then
		   if (not self.loop.active) or self.moving[i].insideLoop then
				self.moving[i]:animLoop(dt,0.1)
				self.moving[i]:update(dt)
			end
		end
	end
	
	self:earlyCollisions()

end

function gamestateClass:earlyCollisions()
	for i=1,#self.earlybirds do
		local obj = self.earlybirds[i]
		for j=1,#self.moving do
			if stdCollide(self.moving[j],obj) then
				obj:collide(obj,self.moving[j])
			end
		end
	end
end

function gamestateClass:updateAnims(dt)
	for i=1,#self.items.list do
		self.items.list[i].pic:stdUpdate(dt)
	end
end

function gamestateClass:tryAgainClick(k)
	
	if k=="l" then
		self.tryagain:click()
		
	end
end

function gamestateClass:keypressed(k)
	self.c:keypressed(k)
	
	
end

function gamestateClass:mousepressed(k)
	self.c:mousepressed(k)
	
end

function gamestateClass:mousereleased(k)
	self.c:mousereleased(k)
end
