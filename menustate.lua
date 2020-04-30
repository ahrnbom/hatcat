--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

menuClass = stateClass:newSubClass()
local n,m 
pron = 1 --pron är banans nummer, relativt världen
local diffs = worlds
local nlvls = 7

function getNewHighscore()
	local hs = {}
	for i=1,#worlds do 
		local lol = {}
		for j=1,7 do
			lol[j] = 99
		end
		hs[worlds[i]] = lol
	end
	return hs
end

function menuClass:setNM(argn)
	if argn >= 1 and argn <= #diffs*nlvls - 1 then
		n = argn
		--m = math.floor(n/(nlvls+1))+1
		m = math.ceil(n/nlvls)
		self.map.pos = n
		pron = ((n-1)%nlvls) + 1
		self.map:updatePos()
		self.map:changeHero(worlds[m])
	end
	
end

function menuClass:load()
	
	self.seq = {"w","w","s","s","a","d","a","d","b","a"}
	self.seq_n = 1

	self.lolIJustPressedTheButtonLol = false
	self.flagMenuStateLol = true
	
	titleClass = nil
	
	likeaboss = false
	
	audio:playMusic("mapmusic")
	
	local savedlol = {0,0}
	if love.filesystem.exists("mappos.lua") then
		local mappos = love.filesystem.read("mappos.lua")
		local i = 1
		for num in string.gmatch(mappos, "%d+") do
			if i > 2 then
				savedlol = {0,0}
				break
			end
			
			savedlol[i] = tonumber(num)
			i = i + 1
		end
	end
	local savedpack = savedlol[1]
	local savednumber = savedlol[2]
	
	if savedpack == 0 then
		savedpack = nil
		savednumber = nil
	end

	m = globalpack or savedpack or 1
	n = globalnumber or savednumber or 1
	pron = n;
	
	
	
	local smallnumber
	if smallMode then
		smallnumber = 25
	else
		smallnumber = 0
	end

	coins = 0
	local lolcounterlulz = 1
	coincounter = {}
	
	for j, world in ipairs(diffs) do
		local h = hs[world]
		for i = 1, 7 do
			if h[i] <= minLoops[world][i] and minLoops[world][i]~=99 then
				coins = coins + 1
				coincounter[lolcounterlulz] = true
			end
			lolcounterlulz = lolcounterlulz + 1
		end
	end
	
	coins = coins - shopstate.cost()
	
	self.butts = newButtList()
	self.butts:add(newButt("play",80 - smallnumber*1.7,40,function() 
		nextLevelForEditorLol = pron
		nextDiffForEditorLol = diffs[m] 
		if diffs[m]=="shop" then
			changeState(shopstate)
		else
			changeState(gamestateClass)
		end
	end))
	self.butts.list[1].keyshortcut = "(space)"
	self.butts:add(newButt("options",width - 65 + smallnumber/2,40,function()
		changeState(optionsState)
		globalnumber = pron
		globalpack=m 
	end))
	self.butts:add(newButt("exit",60 - smallnumber,height - 40,function()
		globalpack = m
		globalnumber = pron
		goBackToThisState = nil
		changeState(titleScreen)
	end))
	
	if (not release) then
		self.butts:add(newButt("beat all levels",width - 130, height - 160,function()
			
			for i=1,#beatenlevels do
				beatenlevels[i] = 1
			end
			self.map:updateNodes()
		end))
	end
	
	
	require 'clock'	
	if width > 1600 then
		self.c = newClock(centerx / 1.25,30)
	else
		self.c = newClock(centerx,30)
	end
	
	self.map = newMap(width,height,(m-1)*7 + n)
	
	self.map:setS(getSlol(diffs[m],n))
	self.map:update(0)
	self.map:changeHero(diffs[m])
	if lolNecoDirection == nil then
		self.map.maphero.mirror = true
	end
	
	self.coinbutt = newButt("coins: "..coins,centerx,height - 40,function()
	
	end)
	self.coinbutt.flagNoAnimLol = true
	--self.coinbutt.noborder = true
	
end

function menuClass:draw()
	local large = false
	if width > 1600 then
		large = true
	end
	if large then
		love.graphics.push()
		love.graphics.scale(1.25)
	end
	self.map:draw(self.c)
	if large then
		love.graphics.pop()
	end
	self.butts:draw()
	self.map.butt:draw()
	--[[if showFPS then
		love.graphics.print("fps: "..love.timer.getFPS(),width/2 - 20,height - 30)
	end]]
	--love.graphics.print("coins: " .. coins,width/2 - 20,height - 40)
	self.coinbutt:draw()
end

function menuClass:mousepressed()
	if not self.butts:click() then
		self.map:click()
		self.map:setS(getSlol(diffs[m],pron))--{diffs[m].." - lvl "..pron,"record: xx loops","try to get xx loops"})
	end
end

function getSlol(diff,n)
	local nloops = minLoops[diff][n]
	local lols = " loops"
	if nloops == 1 then
		lols = " loop"
	end
	if not (diff == "shop") then
		local record = hs[diff][n]
		if record > nloops then
			if record == 99 then
				record = "none"
			else
				record = record .. " loops"
			end
			return {diff.." - lvl "..n,"record: "..record,"try to get "..nloops.. lols}
		elseif record == 99 then
			return {diff.." - lvl "..n,"record: none","good luck!"}
		end
		return {diff.." - lvl "..n,"record: "..record.." loops","coin obtained!"}
	else
		return {diff}
	end
end



function menuClass:keypressed(k)
	
	if (not release) and k=="e" then
		globalnumber = pron
		globalpack = m
		changeState(editorSClass)
	elseif k=="return" or k==" " then
		if not self.lolIJustPressedTheButtonLol then
			nextLevelForEditorLol = pron
			nextDiffForEditorLol = diffs[m]
			if diffs[m]=="shop" then
				changeState(shopstate)
			else
				changeState(gamestateClass)
			end
			self.lolIJustPressedTheButtonLol = true
		end
	elseif (not release) and k == "c" then
		
		changeState(creditsState)
	elseif k == self.seq[self.seq_n] then
		
		self.seq_n = self.seq_n + 1
		if self.seq_n > #self.seq then
			changeState(poemState)
		end
	else
		self.seq_n = 1
	end
	
end

function menuClass:update(dt)
	self.c:update(dt)
	self.map:update(dt)
end
