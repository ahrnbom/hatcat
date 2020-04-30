--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]


local function newHero(pic,x,y,fallpic)
	local hero = newGO(pic,x,y)
	hero.fallpic = fallpic
	hero.walkpic = pic

	hero.fallt = 0
	
	hero.flagHero = true
	hero.shroomSpeed = 0
	
	local fallspeed = 150
	local walkspeed = 70
	
	
	function hero:load()
		self.dir = true
		if state.underwater then
			self.water = true
		end
	end	
		
	--[[local function collide(hero,item)
		if not item then return false end
		return hero.x > 32*(item.x-1) and hero.x < 32*(item.x-1) + item.w  and hero.y < 32*(item.y-1) + item.h + 5 and hero.y > 32*(item.y-1) 
	end]]
	
	local function nmyCollide(hero,nmy) 
		return hero.x > nmy.x - 16 and hero.x < nmy.x + 16 and math.abs(hero.y - nmy.y) < 16
	end
	
	function hero:rideCamel(camel)

		self.flagRide = true
		camel.flagRide = true
		camel.olddraw = camel.draw
		camel.draw = function() end
		for i=1,#state.moving do
			if state.moving[i]==camel then
				table.remove(state.moving,i)
				break
			end
			
		end
		self.oldwalkpic = self.walkpic
		self.oldfallpic = self.fallpic
		
		self.dir = camel.dir
		
		self.walkpic = newAnim(state.gfx.icons.camelcat,32,64,8,0.5,-32)
		self.fallpic = self.walkpic
		
	end
	
	function hero:update(dt)
		
		if self.water then
			dt = dt/2
		end
		local walkspeed = walkspeed
		if self.flagRide then
			walkspeed = walkspeed * 1.55
		end
		self:checkShrooms(dt,fallspeed,walkspeed)
	
		if not self:tryFall(fallspeed*dt) then
			self:tryWalk(walkspeed*dt)
			self.pic = self.walkpic
			self.fallt = 0
		else
			if self.fallt > 0.1 then
				self.pic = self.fallpic
			else
				self.fallt = self.fallt + dt
			end
		end
		if self.y > 1000 then
			state:die()
		end
		for i = 1,#state.items.list do
			if stdCollide(self,state.items.list[i]) then
				state.items.list[i]:collide(self)
			end
			
		end
		for i = 2,#state.moving do
			if nmyCollide(self,state.moving[i]) then
				state.moving[i].pattern.collide(state.moving[i])
			end
		end
	end
	
	
	return hero:new()
end

return newHero
