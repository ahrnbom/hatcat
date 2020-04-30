--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

nmyPatterns = {}

function standardCollide(self)
	--self här verkar inte vara hjälten utan det man krockar med
	if not self.notDanger then
		state:die()
	end
	
end

local testenemy = {}
testenemy.fallspeed = 150
testenemy.walkspeed = 70
testenemy.collide = standardCollide
testenemy.lolmirror = true

function testenemy.update(self,dt)
	if likeaboss then
		local dx = 170*dt*self.bossdir.x
		local dy = 170*dt*self.bossdir.y
		self:move(dx, dy, nil, true)
		self.pic.rot = self.pic.rot + 10*dt
	else
		if not self:tryFall(self.pattern.fallspeed*dt) then
			self:tryWalk(self.pattern.walkspeed*dt)
		end
	end
end

nmyPatterns.testenemy = testenemy

local nekosan = {}
nmyPatterns.nekosan = nekosan

nekosan.collide = function(self)
	--TODO spela upp ett nyaa-ljud <3
end

nekosan.walkspeed = 100
nekosan.fallspeed = 170
nekosan.margin = 64

function nekosan.update(self,dt)
	if not self:tryFall(self.pattern.fallspeed*dt) then
		self:tryWalk(self.pattern.walkspeed*dt)
		if state.hero.x > self.x + self.pattern.margin then
			self.dir = true
		elseif state.hero.x + self.pattern.margin < self.x then
			self.dir = false
		end
	end
end

local camel = {}
nmyPatterns.camel = camel

camel.collide = function(self)
	--görs från hero
end

camel.walkspeed = 30
camel.fallspeed = 130
camel.margin = 16

function camel.update(self,dt)
	if self.flagRide then
		return
	end
	if math.abs(state.hero.x-self.x) + math.abs(state.hero.y-self.y) < self.pattern.margin then
		state.hero:rideCamel(self)
	end

	--[[if state.hero.x > self.x + self.pattern.margin then
		self.heroright = true
	elseif state.hero.x < self.x - self.pattern.margin then
		self.heroright = false
	end
	if self.dir == self.heroright then
		--hjälten är framför
		--self.pattern.walkspeed = 100
		--self.rage = true
	else
		--hjälten är bakom
		--self.pattern.walkspeed = 30
		--self.rage = false
	end]]
	if not self:tryFall(self.pattern.fallspeed*dt) then
		self:tryWalk(self.pattern.walkspeed*dt)
	end
end

local piraya = {}
nmyPatterns.piraya = piraya
piraya.collide = standardCollide

piraya.speed = 70

function piraya.update(self,dt)
	if not self.epicDX then
		self.epicDX = 0
	end
	local dx,dy
	if state.hero.x > self.x - self.epicDX*10 then
		dx = 1
		self.pic.flip = true
	else
		dx = -1
		self.pic.flip = false
	end
	if state.hero.y > self.y then
		dy = 1
	else
		dy = -1
	end
	if not state:isEmpty(self.x,self.y+self.pattern.speed*dt*dy) then
		dy = 0
	end
	if not state:isEmpty(self.x + self.pattern.speed*dt*dx,self.y) then
		dx = 0
	end
	local l = math.sqrt(dy*dy + dx*dx)
	if l==0 then
		return
	end
	self.epicDX = dx
	self:move(self.pattern.speed*dt*dx/l,self.pattern.speed*dt*dy/l)
end

local urchin = {}
nmyPatterns.urchin = urchin
urchin.collide = standardCollide
urchin.update = function(self,dt) 
	if not self.trollt then
		self.trollt = 0
	else
		self.trollt = self.trollt + 2*dt
	end
	local speed = 25*dt
	self:move(speed*math.cos(self.trollt),speed*math.sin(self.trollt))
end

local fallspike = {}
nmyPatterns.fallspike = fallspike
fallspike.collide = standardCollide
fallspike.flagFallSpike = true
fallspike.freeTime = 0

function fallspike.update(self,dt)
	if type(self.freeTime) == "nil" then
		self.freeTime = 0  -- fult och lite långsamt, men vafan YOLO
	end
	if self.fall then
		if not self:tryFall(100*dt) then
			
			self.notDanger = true
			self.lolAlpha = 0.5
			self.freeTime = 0
		else
			if self.freeTime > 0.1 then
				self.lolAlpha = 1
				self.notDanger = false
			end
			self.freeTime = self.freeTime + dt
		end
	else
		
		local dist = math.abs(state.hero.x - self.x)
		if dist < 64 and state.hero.y > self.y then
			self.fall = true
		end
	end
end

local function normalize(vec)
	local p2 = math.sqrt(vec.x*vec.x + vec.y*vec.y)
	vec.x = vec.x/p2
	vec.y = vec.y/p2
	return vec
end

local function nmyCollide(hero,nmy) 
	return hero.x > nmy.x - 16 and hero.x < nmy.x + 16 and math.abs(hero.y - nmy.y) < 16
end

local function rand()
	return 2*(math.random()-0.5)
end

local deadboss = {}
deadboss.collide = function() end

nmyPatterns.deadboss = deadboss
function deadboss:update(dt)
	
	self.y = self.y + 100*dt
end

local theboss = {}

theboss.collide = standardCollide
function theboss.update(self, dt)
	likeaboss = true
	
	if not self.bosstime then
		--setup
		self.bossdir = 1
		self.targ1x = state.hero.x + rand()*70
		self.targ1y = state.hero.y - 100
		self.bosstime = 0
		state.bosshealth = 16
	end
	self.bosstime = self.bosstime + dt
	if self.bosstime > 0.5 then
		self.targ1x = state.hero.x + rand()*70
		self.targ1y = state.hero.y - 100
		self.bossdir = -self.bossdir
		self.bosstime = 0
		local nmy = newEnemy("testenemy",state.gfx):newInstance()
		audio:playSfx("shoot")
		local sign = 1
		if state.hero.y < self.y then
			sign = -1
		end
		nmy:setPos(self.x, self.y + sign*20)
		nmy.bossdir = normalize({x = state.hero.x - self.x, y = state.hero.y - self.y})
		
		table.insert(state.moving, nmy)
		
		if state.loop and state.loop.active then
			nmy.insideLoop = true
			if math.random() > 0.8 then
				state:breakLoop()
				state:addCircle(self.x, self.y - 16)
				audio:playSfx("close2")
			end
		end
		
		nmy.pic.ox = 16
		nmy.pic.oy = 16
		
		if math.random()>0.85 then
			nmy.pic.col = {r = 255, g = 255, b = 0}
		end
	end
	
	local win = false
	for i = #state.moving, 1, -1 do
		local v = state.moving[i]
		if v.pic.col then
			if nmyCollide(self, v) then
				table.remove(state.moving, i)
				state.bosshealth = state.bosshealth - 1
				audio:playSfx("damage")
				if state.bosshealth == 0 then
					--WIIIIN
					state.pushTheButtonAndLetMeKnow = true
					win = true
					audio:playMusic("winfanfare",true)
					local deadboss = newEnemy("deadboss", state.gfx)
					deadboss.x = self.x
					deadboss.y = self.y + 128 - 32
					deadboss.pic.vertflip = true
					table.insert(state.moving, deadboss)
				end
			end
		end
	end
	
	
	local dx = self.x - self.targ1x
	if dx > 3 then
		self.pic.flip = true
	elseif dx < -3 then
		self.pic.flip = false
	end
	local dy = self.y - self.targ1y
	
	local dd = 1/math.sqrt(dx*dx + dy*dy)
	dx = dx*dd
	dy = dy*dd
	
	self:move(-128*dx*dt, -128*dy*dt)
	if win then
		local index = -1
		for i,v in ipairs(state.moving) do
			if v==self then
				index = i
			end
		end
		if index == -1 then
			print("I AM ERROR")
		end
		
		table.remove(state.moving, index)
	end
end
nmyPatterns.theboss = theboss

