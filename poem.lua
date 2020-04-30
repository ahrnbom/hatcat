--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

poemState = stateClass:newSubClass()

function poemState:load()
	self.ss = {"roses are red", "violets are blue", "all my base", "are belong to you"}
	self.t = 0
	self.p = 1
	self.delta = 1.5
	self.cs = {{255,50,50},{100,100,255},{255,255,255},{255,255,255}}
end

function poemState:draw()
	local s = self.ss[self.p]
	local x = 100 + self.t*50 + self.p*50
	local y = 100*self.p
	local c = self.cs[self.p]
	love.graphics.setColor(c[1],c[2],c[3],255*math.sin(self.t*math.pi/self.delta))
	love.graphics.print(s,x,y)
	love.graphics.setColor(255,255,255)
end

function poemState:update(dt)
	self.t = self.t + dt
	if self.t > self.delta then
		self.t = 0
		self.p = self.p + 1
		if self.p > #self.ss then
			changeState(menuClass)
			self.p = 1
		end
	end
end

