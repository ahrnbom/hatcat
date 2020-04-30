--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

local editorItemClass = newClass()

function editorItemClass:draw()

	if self.w == 64 then
		self.pic:draw((self.x+0.5)*32,(self.y-1)*32)
	else
		self.pic:draw((self.x-0.5)*32,(self.y-1)*32)
	end

end

function editorItemClass:load(game)

end

function editorItemClass:inside(x,y) --TODO tveksam funktion, när används den? värdena har helt olika skalor, self.w och self.h är 32 typ, meden self.x kör heltal D:
	local x = x + 1
	local y = y + 1
	return (x > self.x and x < self.x + self.w and y > self.y and y < self.y + self.h)
end

local collisions = {}
collisions["spawn"] = function(self,hero)
	
end
collisions["goal"] = function(self,hero)
	local win = true
	for i = 1,#state.items.list do
		if state.items.list[i].s == 'score' then
			win = false
		end
	end
	if win then
		state.epicWin = true
		if likeaboss then
			changeState(creditsState)
		else
			state:die()
		end
	end
end
collisions["score"] = function(self,hero)
	state.items:add({x = self.x,y=self.y})
	local lastOne = true
	local pos = 0
	for i = 1,#state.items.list do
		if state.items.list[i].s == 'score' then
			lastOne = false
		elseif state.items.list[i].s == 'goal' then
			pos = i
		end
	end
	if lastOne then
		local goal = state.items.list[pos]
		goal.pic = newAnim(self.gfx.icons['opengoal'],32,32,1)
		goal.pic:setFilter("nearest","nearest")
	end
	
	state.effects:add(self.pic, 32*(self.x-0.5), 32*(self.y-1))
	audio:playSfx("key")
end

collisions["break"] = function(self,hero)
	state:die()
end

collisions.button = function(self,hero)
	state.pushTheButtonAndLetMeKnow = true --detta är sjukt awesome
	
	self.pic.n = 2
	self.pic.flagReset = true
end

collisions.shroom = function(self,hero)
	if not hero.shroomSpeed then
		hero.shroomSpeed = 300
	end
	if hero.shroomSpeed < 250 then
		audio:playSfx("jump")
	end
	hero.shroomSpeed = 300
	
end

collisions.buttblock = function(self,hero)
	
end

collisions.spikes = function(self,hero)
	if (not hero.flagRide) and hero.flagHero then
		state.flagLavaDeath = true
		state:die()
	end
end

collisions.iceblock = function(self, hero)
	--själva kollisionskollen görs i gamestate, i isEmpty
end

local numAnim = {}
numAnim.shroom = 2
numAnim.goal = 2
numAnim.score = 8
numAnim["break"] = 8
numAnim.spawn = 1
numAnim.button = 2
numAnim.buttblock = 1
numAnim.spikes = 1
numAnim.iceblock = 8

numAnimRate = {}
numAnimRate.score = 0.1
numAnimRate.button = math.huge
numAnimRate.iceblock = math.huge
numAnimRate["break"] = 0.05

function newEItem(s,x,y,gfx)

	
	local o = editorItemClass:newInstance()
	o.s = s
	o.collide = collisions[s]
	o.x = x
	o.y = y
	local width = 32
	if s=="button" or s=="spikes" then
		width = 64
	end
	o.pic = newAnim(gfx.icons[s],width,32,numAnim[s],numAnimRate[s] or 0.5)
	o.pic:setFilter("nearest","nearest")
	
	if s == "score" or s=="spawn" then
		o.gfx = gfx
	end
	if s=="shroom" or s=="button" or s=="spikes" or s=="iceblock" then
		o.flagNmyCollide = true
	end
	if s=="buttblock" then
		o.pic.flagButtblock = true
	end
	
	o.w = width
	o.h = 32
	return o
end

local itemListClass = newClass()

function newItemList()
	local o = itemListClass:newInstance()
	o.list = {}
	return o
end

function itemListClass:add(item)
	local toRemove = nil
	for i,v in ipairs(self.list) do
		if v.x == item.x and v.y == item.y then
			toRemove = i
		end
	end
	if toRemove then
		table.remove(self.list,toRemove)
	else
		table.insert(self.list,item)
	end
end

function itemListClass:draw(troll)
	for i = 1,#self.list do
		if troll and self.list[i].s == 'spawn' then
		
		else
			self.list[i]:draw()
		end
	end
end
