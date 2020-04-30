--[[

This software is released under the MIT License. See LICENSE.txt for details.
Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

optionsState = newState()

-- KAN BARA VISA FYRA INSTÄLLNINGAR I SMALLMODE
-- DU KAN VA

function optionsState:load()
	self.gfx = love.graphics.newImage("res/introfg.png")

	self.ver = require 'version'

	self.flagOptionsState = true
	
	self.butts = newButtList()
	function self.butts:draw()
		local j = 0
		for i = 1,#self.list do
			if self.list[i].flagAsTrollLol then
				self.list[i]:draw(false, true)
			else	
				self.list[i]:draw()
			end
		end
	end
	
	local smallnumber = 0
	if smallMode then
		smallnumber = 40
	end
	local corr = 1
	if height > 600 then
		local corr = height/600
	end
	
	self.questButts = newButtList()
	self.questButts.corr = {x = centerx - x_corr, y = centery - y_corr}
	
	local count = 0
	for i,v in pairs(allOptions) do
		count = count + 1 -- when I'm alone, I count myself!
		local y = count * 70/(smallnumber/150 + 1) + 100
		local epicstring = i
		if epicstring == "sound" then
			epicstring = "music"
		end
		self.butts:add(newButt(epicstring .. ":",(160 - 1.5*smallnumber),y - smallnumber,function()
		
		end))
		self.butts.list[#self.butts.list].flagNoAnimLol = true
		self.butts.list[#self.butts.list].noborder = true
		self.questButts:add(newButt("?",(30 - smallnumber/4),y - smallnumber,function()
			self.showInfo = i
		end))
		for j = 1,#v.ans do
			local troll = false
			if v.ans[j].name == options[i] then
				troll = true
			end
			local bb = newButt(v.ans[j].name,(250 + j*100/(smallnumber/50+1) - 2*smallnumber),y - smallnumber,function()
					options[i] = v.ans[j].name
					v.ans[j]:exec()
					self:load()
				end)
			
			if troll then
				bb = bb:troll()	
			end
			self.butts:add(bb)
		end
	end

	self.butts:add(newButt("back",50 - smallnumber,40,function()

		changeState(goBackToThisState or menuClass)
		writeOptions()
	end))
	if computerMode then
		self.butts:add(newButt("video settings",210-smallnumber, 40, function()
			changeState(setResState)
			writeOptions()
		end))
	end
	
	self.butts:add(newButt("data settings",400-smallnumber, 40, function()
		changeState(savessstate)
		writeOptions()
	end))
	
	self.butts.flagLolCoords = true
	
end



function optionsState:draw()
	
	love.graphics.setColor(0,40,0)
	love.graphics.rectangle("fill",0,0,width,height)
	love.graphics.setColor(255,255,255,40)
	love.graphics.draw(self.gfx, width - 400*2, height - 512*2 + 50,0,2,2)
	love.graphics.setColor(255,255,255)
	love.graphics.push()
		love.graphics.translate(centerx - x_corr, centery - y_corr)
		if self.showInfo then
			if self.info[self.showInfo] then
				local a = self.info[self.showInfo]
				for i=1,#a do
					love.graphics.print(a[i],30,30*(i+5))
				end
			end
		else
			self.butts:draw()
			self.questButts:draw()
		end
	love.graphics.pop()
	if height > 500 then
		love.graphics.print("version 1." .. self.ver, 30, height - 50)
	else
		love.graphics.print("version 1." .. self.ver, width - 130, height - 50)
	end
end

function optionsState:mousepressed(k)
	if self.showInfo then
		self.showInfo = nil
	else
		self.butts:click()
		self.questButts:click()
	end
end

optionsState.info = {}
optionsState.info["show fps"] = {
	"if chosen the 'fps', which means the amount",
	"of frames per second the game runs in, will be",
	"shown on the screen. if it is near or above 60,",
	"that means that the game runs smoothly."
}

optionsState.info["draw mode"] = {
	"different ways to display the graphics in",
	"the game. both should run just fine on almost",
	"all hardware. if one doesn't work smoothly, try",
	"the other."
}

optionsState.info["resolution"] = {
	"the resolution for the game. higher resolution",
	"means a larger window",
	"wait, how are you reading this?"
	
}

optionsState.info["sound"] = {
	"choose 'on' if you want to play the game with",
	"music. choose 'off' if you want it to be silent."
}

optionsState.info["sound effects"] = {
	"choose 'on' if you want to play the game with",
	"sound effects. choose 'off' otherwise."
}

optionsState.info["controls"] = {
	"with fast controls, loops are made as soon as you",
	"let go of the mouse button. in precise mode, you",
	"can adjust the loop before finishing it.",
	"clicking inside the loop finishes it, clicking ",
	"outside dismisses it."
}
