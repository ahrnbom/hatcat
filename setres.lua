--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

setResState = newState()

local dx = 30
local xposs1 = {100-dx, 250-dx, 400-dx, 560-dx}
local xposs2 = {100-dx, 260-dx, 390-dx}
local yposs = {100, 250, 400}

function setResState:load()
	self.flagOptionsState = true
	self.gfx = love.graphics.newImage("res/introfg.png")

	self.butts = newButtList()
	self.butts:add(newButt("go back",xposs1[1],yposs[1],function()
		changeState(optionsState)
	end))
	
--window
	self.butts:add(newButt("800 x 480",xposs1[1],yposs[2],function()
		setResolution(800,480,false)
	end))
	
	self.butts:add(newButt("800 x 600",xposs1[2],yposs[2],function()
		setResolution(800,600,false)
	end))
	
	self.butts:add(newButt("1080 x 720",xposs1[3],yposs[2],function()
		setResolution(1080,720,false)
	end))
	
	self.butts:add(newButt("1920 x 1080",xposs1[4],yposs[2],function()
		setResolution(1920,1080,false)
	end))

--fullscreen
	self.butts:add(newButt("1280 x 720",xposs2[1],yposs[3],function()
		setResolution(1280,720,true)
	end))

	self.butts:add(newButt("1920 x 1080",xposs2[2],yposs[3],function()
		setResolution(1920,1080,true)
	end))
	
	self.butts:add(newButt("auto",xposs2[3],yposs[3],function()
		local modes = love.graphics.getModes()
		table.sort(modes, function(a, b) return a.width*a.height < b.width*b.height end)
		
		for i=#modes,1,-1 do
			local mode = modes[i]
			local w = mode.width
			local h = mode.height
			if w >= 800 and w <= 1920 and h >= 480 and h <=1080 then
				setResolution(w,h,true)
				return
			end
		end
		exit_prompt = newpopup("your screen is strange :<", {{"ok",function()
			exit_prompt = nil
			end}})
	end))
	
	self.butts.flagLolCoords = true
end


function setResState:draw()
	love.graphics.setColor(0,40,0)
	love.graphics.rectangle("fill",0,0,width,height)
	love.graphics.setColor(255,255,255,40)
	love.graphics.draw(self.gfx, width - 400*2, height - 512*2 + 50,0,2,2)
	love.graphics.setColor(255,255,255)
	love.graphics.push()
		love.graphics.translate(centerx - x_corr, centery - y_corr)
		self.butts:draw()
		love.graphics.print("window:",10,yposs[2]-70)
		love.graphics.print("fullscreen:",10,yposs[3]-70)
	love.graphics.pop()
end

function setResState:mousepressed()
	self.butts:click()
end
