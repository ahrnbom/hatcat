--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

controlClass = newClass()

function controlClass:keypressed(k)
	if k==' ' then 
		if not state.tryAgainScreen then
			self.butts.list[1].click()
		else
			state.tryagain.butts.list[2].click()
		end
	elseif k=='f' then
		local tween = self.butts.troll2.list[1].tween
		tween.clicktime = tween.mclicktime
	elseif k=='g' then
		local tween = self.butts.troll2.list[2].tween
		tween.clicktime = tween.mclicktime
	end
end

function controlClass:mousepressed(k)

end

function controlClass:mousereleased(k)

end

local function join3(a, b, c)
	local lists = {a,b,c}
	local i = 1
	local j = 1
	return function()
		if j > 3 then
				return nil
		end
		local res = lists[j][i]
		i = i + 1
		if i > #lists[j] then
			i = 1
			j = j + 1
			
		end
		return res
	end
end

function controlClass:update(dt)
	--[[
	for v in join3(self.butts.list, self.butts.troll.list, self.butts.troll2.list) do
		v.displayKeyshortcut = false
		local x,y = love.mouse.getPosition()
		if v:inside(x,y) then
			v.displayKeyshortcut = true
		end
	end
	]]
	self:update2(dt)
end

function controlClass.switch(buttList)
	local butt = buttList.list[1]
	if butt.s == "pause" then
		butt.s = "resume"
		butt.w = font:getWidth("resume") + butt.extraw
	else
		butt.s = "pause"
		butt.w = font:getWidth("pause") + butt.extraw
	end
end

function controlClass:load()
	local smallnumber = 0
	if smallMode then
		smallnumber = 25
	end

	self.butts = newButtListPro()
	self.butts:add(newButt("start",80 - smallnumber,40,function()
		state.pause = not state.pause
		self.butts.yes = not self.butts.yes
		self.switch(self.butts)
	end))
	self.butts.list[1].keyshortcut = "(space)"
	self.butts:add2(newButt("give up",80 - smallnumber,height - 40,function()
		state:die("giveup")
		if preciseControls then
			self.loopOpen = false
			self.game.newloop = nil
		end
	end))
	self.butts.troll.list[#self.butts.troll.list].keyshortcut = "(escape)"
	self.butts:add2(newLPButt("zoom in",width - 80 + smallnumber,height - 40,function(dt)
		
		dt = dt or love.timer.getDelta()
		state:changeZoom(2*dt) --tidigare 0.3
		

	end))
	self.butts.troll.list[#self.butts.troll.list].keyshortcut = "(scroll wheel)"
	self.butts:add2(newLPButt("zoom out",width - 90 - 125 + smallnumber,height - 40,function(dt)
		
		dt = dt or love.timer.getDelta()
		state:changeZoom(-2*dt)
		
	end))
	self.butts.troll.list[#self.butts.troll.list].keyshortcut = "(scroll wheel)"
	self.butts:add3(newButt("fast",width - 80 + smallnumber,40,function()
		state.fast = not state.fast
		state.slow = false
	end),function()
		return state.fast
	end)
	self.butts.troll2.list[#self.butts.troll2.list].keyshortcut = "(f)"
	self.butts:add3(newButt("slow",width - 80 - 90 + smallnumber,40,function()
		state.slow = not state.slow
		state.fast = false
	end),function()
		return state.slow
	end)
	self.butts.troll2.list[#self.butts.troll2.list].keyshortcut = "(g)"
	self.butts.yes = true
end

function newControl()
	return controlClass:newInstance()
end

function controlClass:set(troll)
	self.game = troll
	self:load()
	return self
end
-- x = (x + camx*zoom - centx)/zoom
-- invers x*zoom = x + cam*zoom - cent
-- invers x =x*zoom - cam*zoom + cent

function controlClass:toCoords(x,y) --gör om skärmkoordinater till spelkoordinater
	local x = (x + self.game.camerax*self.game.zoom - centerx)/self.game.zoom
	local y = (y + self.game.cameray*self.game.zoom - centery)/self.game.zoom
	return x,y
end
