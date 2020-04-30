--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

stateClass = newClass()

function newState()
	return stateClass:newSubClass()
end

function stateClass:isEmpty(x,y)
	print "I AM ERROR... FOR REALZ"
end

function stateClass:update(dt)

end

function stateClass:load()

end

function stateClass:draw()

end

function stateClass:keypressed(k)

end

function stateClass:mousepressed(k)

end

function stateClass:mousereleased(k)

end

function changeState(s)
	if state.flagMenuStateLol then
		lolNecoDirection = state.map.maphero.mirror
		if globalpack then
			local str = "return {" .. globalpack .. "," .. globalnumber .. "}"
			love.filesystem.write("mappos.lua", str)
		end
	end
	changingState = s
	lolt = 0
	lolmark = false
	theTimes = false
end

function rChangeState(s)
	state = s:newInstance()
	state:load()
	
end
