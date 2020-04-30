--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

nmyClass = gameobject:newSubClass()

function nmyClass:update(dt)
	self.pattern.update(self,dt)
	self:checkShrooms(dt)
	for i=1,#state.items.list do
		if state.items.list[i].flagNmyCollide and stdCollide(self,state.items.list[i]) then
			state.items.list[i]:collide(self)
		end
	end
end

--[[nmyClass.draw = function(self,dy,dx,mirror)
	gameobject.draw(self,dy+self.h,dx,mirror)
end]]

function newNmyType(pic,nQuads,nHeight)
	local o = nmyClass:newSubClass()
	if not nHeight then
		print "I AM ERROR: no nHeight for enemy"
		nHeight = 1
	end
	o.pic = newAnim(pic,32,32*nHeight,nQuads)
	o.w = pic:getWidth()
	o.h = pic:getHeight()
	o.timer = 0
	return o
end

function newEnemy(string,gfx)
	local enemy = newNmyType(gfx.icons[string],gfx.nmyNbrQuads[string],gfx.nmyNbrHeight[string])
	enemy.pattern = nmyPatterns[string]
	return enemy
end
