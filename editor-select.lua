--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

editorSClass = newState()
local n
local diffs = worlds
local m

function editorSClass:load()
	m = globalpack or 1
	n = globalnumber or 1

	
	self.butts = newButtList()
	self.butts:add(newButt("options",70,40,function()
		changeState(optionsState)
	end))
	local function leftshift()
		if n > 1 then
			n = n - 1
		end
	end
	local function rightshift()
		n = n + 1
	end
	self.butts:add(newButt("last pack",centerx - 250,centery - 100,function()
		if m > 1 then
			m = m - 1
		end
	end))
	self.butts:add(newButt("next pack",centerx + 250,centery - 100,function()
		if m < #diffs then
			m = m + 1
		end
	end)) 
	local left = newButt("last level",centerx - 250,centery + 0,leftshift)
	local right = newButt("next level",centerx + 250,centery + 0,rightshift)
	if not love.phone then
		self.butts:add(newButt("editor",centerx + 0,centery + 50,function()
			nextLevelForEditorLol = n
			nextDiffForEditorLol = diffs[m]
			changeState(editorClass)
		end))
	end
	self.butts:add(newButt("play",centerx + 0,centery - 50,function()
		nextLevelForEditorLol = n
		nextDiffForEditorLol = diffs[m]
		changeState(gamestateClass)
	end))
	self.butts:add(right)
	self.butts:add(left)
end

function editorSClass:mousepressed()
	self.butts:click()
end

function editorSClass:keypressed(k)
	if not love.phone and k==" " then
		self.butts.list[5]:click()
	end
end

function editorSClass:update(dt)
	--love.timer.sleep(20)
end

function editorSClass:draw()

	self.butts:draw()
	love.graphics.print("choose level: "..n,centerx-100,centery-15)
	love.graphics.print("level pack: "..diffs[m],centerx - 150, 50)
	
end
