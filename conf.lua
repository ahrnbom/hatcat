--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

function love.conf(t)
	t.identity="hatcat"
	t.author = "T-Bone IndepEndent Software Solutions"
	
	t.title = "Hat Cat and the Obvious Crimes Against the Fundamental Laws of Physics"
	
	t.modules.physics = false
	
	
	--t.console = true
	--t.release = false
	
	t.console = false
	t.release = true
	
	if t.window then
		t.window.icon = "res/icon.png"
		t.window.vsync = false
	else
		t.screen.vsync = false
	end
end


