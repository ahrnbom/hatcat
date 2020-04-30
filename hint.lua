--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

local hint = newClass()

--flaggas med .active om de ska ritas i gamestate, de ska ligga som state.hint

function newHint(stringz)
	local o = hint:newInstance()
	o.strings = stringz
	o.h = #stringz * (font:getHeight() + 10)
	local mpos = 1
	for i=1,#stringz do
		if #stringz[mpos] > mpos then
			mpos = i
		end
	end
	o.w = font:getWidth(stringz[mpos]) + 20
	o.fh = font:getHeight()+10
	return o
end

function hint:draw(x,y)


	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("line",x,y,self.w,self.h)
	love.graphics.setColor(0,0,0)
	
	love.graphics.setColor(255,255,255)
	for i=1,#self.strings do
		love.graphics.print(self.strings[i],10+x,y+10+(i-1)*self.fh)
	end
end
