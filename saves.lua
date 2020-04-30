-- This software is released under the MIT License. See LICENSE.txt for details.

local alphabet = "abcdefghijklmnopqrstuvwxyz"

--[[
	kod:
		1-9: antalet banor i rad som är klarade med minloops
		0: fler än 9 banor i rad
		a-y: antalet loopar banan är klarad i
		z: fler än 25 loopar
		-: 99 loopar
]]

local function lolchecksum(s)
	local sum = 0
	for i = 1, #s do
		sum = sum + string.byte(s:sub(i,i)) + 1
	end
	return "" .. (sum % 9)
end

function importsave(strin)
	local shopped = tonumber(strin:sub(-2,-2))
	if shopped == nil then
		print("not a number")
		return false
	end
	
	local sausage = {false, false, false}
	if shopped==1 then
		sausage[1] = true
	elseif shopped==2 then
		sausage[2] = true
	elseif shopped==3 then
		sausage[3] = true
	elseif shopped==4 then
		sausage[1] = true
		sausage[2] = true
	elseif shopped==5 then
		sausage[2] = true
		sausage[3] = true
	elseif shopped==6 then
		sausage[1] = true
		sausage[3] = true
	elseif shopped==7 then
		sausage[1] = true
		sausage[2] = true
		sausage[3] = true
	elseif shopped==8 then
		print("an 8")
		return false
	elseif shopped==9 then
		print("a 9")
		return false	
	end
	
	local lhs = {}
	for i = 1,9 do
		lhs[worlds[i]] = {}
		for j = 1,7 do
			lhs[worlds[i]][j] = 99
		end
	end

	local function seths(w,l,a)
		print("writing " .. worlds[w] .. ":" .. l .. " as " .. a)
		lhs[worlds[w]][l] = a
	end
	
	local pos = 1
	local str = strin:sub(1,-3)
	local len = #str
	
	local w = 1
	local l = 1
	
	local astr = "a"
	
	while pos <= len do
		local char = str:sub(pos, pos)
		local num = tonumber(char)
		
		if num ~= nil then
			local val = num
			while num == 0 do
				val = val + 9
				pos = pos + 1
				if pos > len then
					print("wrong 0")
					return false
				end
				num = tonumber(str:sub(pos,pos))
				if num == nil then
					print("wrong 0, case 2")
					return false
				end
				val = val + num
			end
				
			for i = 1, val do
				if w > 8 then
					print "tldr"
					return false
				end
				seths(w,l,minLoops[worlds[w]][l])
				
				l = l + 1
				if l > 7 then
					l = 1
					w = w + 1
				end
			end
			pos = pos + 1
			
		elseif char=="-" then
			pos = pos + 1
			l = l + 1
			if l > 7 then
				w = w + 1
				l = 1
				
			end
		else
			num = 0
			while char=="z" do
				num = num + char:byte() - astr:byte() + 1
				pos = pos + 1
				if pos > len then
					print("wrong z")
					return false
				end
				char = str:sub(pos,pos)
			end
			num = num + char:byte() - astr:byte() + 1
			if num==minLoops[worlds[w]][l] then
				print("minloop")
				return false
			end
			seths(w,l,num)
			
			pos = pos + 1
			l = l + 1
			if l > 7 then
				w = w + 1
				l = 1
			end
		end
		
	end
	
	if w > 8 then
		print "tldr"
		return false
	end
	
	hs = lhs
	shopstate:write(sausage)
	
	love.filesystem.write("mappos.lua", "return {1,1}")
	
	if loadmap then
		globalpack = w
		globalnumber = l
		saveHS(hs)
		loadmap()
	else
		globalpack = w
		globalnumber = l
	end
	return true
end

function exportsaves()
	local s = ""
	local ml_inarow = 0
	local nr_inarow = 0
	local done = false
	
	for i = 1, #worlds do
		local world = hs[worlds[i]]
		for j = 1, #world do
				local level = world[j]
				
				if level < 99 and nr_inarow > 0 then
					for k = 1, nr_inarow do
						s = s .. "-"
					end
					nr_inarow = 0
				end
				
				if level == minLoops[worlds[i]][j] and level ~= 99 then
					ml_inarow = ml_inarow + 1
				else
					if ml_inarow > 0 and nr_inarow == 0 then
						while ml_inarow > 9 do
							s = s .. "0"
							ml_inarow = ml_inarow - 9
						end
						s = s .. ml_inarow
						
					end
					ml_inarow = 0
					
					if level == 99 then
						nr_inarow = nr_inarow + 1
					else
						
						while level > #alphabet - 1 do
							s = s .. "z"
							level = level - (#alphabet - 1)
						end
						s = s .. alphabet:sub(level,level)
					end
				end
			
		end
	end
	
	local sg = shopstate:getSausage()
	local num = 0
	if sg[1] then
		num = num + 1
		if sg[2] or sg[3] then
			num = num + 1
			if not sg[2] then
				num = num + 1
			end
		end
	end
	if sg[2] then
		num = num + 2
	end
	if sg[3] then
		num = num + 3
	end
	
	s = s .. num
	
	-- checksum
	local cs = lolchecksum(s)
	
	s = s .. cs
	
	return s
end

savessstate = stateClass:newSubClass()

function savessstate.deldata()
	exit_prompt = newpopup("are you sure?", {{"yes",savessstate.deldata2},{"no",function() 
		exit_prompt = nil
	end}})
		
end

function savessstate.deldata2()
	local files = {"iwanttopoophere", "ibuysausage", "mappos.lua", "hs.lua", "options.lua"}
	local hugesuccess = true
	for i,v in ipairs(files) do
		if love.filesystem.exists(v) then
			local res = love.filesystem.remove(v)
			if v ~= "mappos.lua" and v~= "hs.lua" and v~= "options.lua" and not res then
				exit_prompt = newpopup("deleting didn't work!", {{"ok", function() exit_prompt = nil end}})
				hugesuccess = false
				break
			end
		end
		
	end
	hs = require "bhs"
	calc_beatenlevels()
	globalpack = 1
	globalnumber = 1
	if hugesuccess then
		
		exit_prompt = nil
		
	end
	
	
end



function savessstate:load()
	self.gfx = love.graphics.newImage("res/introfg.png")
	self.lolpass = "your password is:"

	self.butts = newButtList()
	self.butts:add(newButt("back", 50 + width*0.1, 40 + height*0.1, 
	function() 
		changeState(optionsState) 
		
	end))
	self.butts:add(newButt("delete all data", centerx, centery + 150, self.deldata))
	self.butts:add(newButt("export save data", centerx, centery, function() 
		
		local lines = 1
		local newpass = exportsaves()
		local origpass = newpass
		while font:getWidth(newpass)/lines > width*0.9 do
			lines = lines + 1
			local half = #origpass / lines
			newpass = ""
			for i = 1, lines do
				newpass = newpass .. origpass:sub((i-1)*half + 1, i*half) .. " "
			end
		end
		state.pass = newpass
		state.butts.list[3].tween.clicktime = 0
	end))
	self.butts:add(newButt("import save data", centerx, centery - 150, function() 
		state.import = "" 
		state.butts.list[4].tween.clicktime = 0
	end))
	
	self.keyboard = newButtList()
	
	self.keyboard:add(newButt("back",50, 40, function() 
		state.import = nil 
		state.keyboard.list[1].tween.clicktime = 0
		state.keyboard.list[1].tween.fact = 1
	end))
	
	self.byletter = {}
	
	local dx = width*0.8 / 10
	local dy = height/9
	local function a(let, y, x)
		self.keyboard:add(newButt(let, width * 0.05 + dx*x, 180 + dy*y, function() 
			if let == "<-" then
				state.import = state.import:sub(1,-2)
			else
				state.import = state.import .. let 
			end
		end))
		self.byletter[let] = self.keyboard.list[#self.keyboard.list]
	end
	
	a("1",0,1)
	a("2",0,2)
	a("3",0,3)
	a("4",0,4)
	a("5",0,5)
	a("6",0,6)
	a("7",0,7)
	a("8",0,8)
	a("9",0,9)
	a("0",0,10)
	a("q",1,1)
	a("w",1,2)
	a("e",1,3)
	a("r",1,4)
	a("t",1,5)
	a("y",1,6)
	a("u",1,7)
	a("i",1,8)
	a("o",1,9)
	a("p",1,10)
	a("a",2,1)
	a("s",2,2)
	a("d",2,3) 
	a("f",2,4)
	a("g",2,5)
	a("h",2,6)
	a("j",2,7)
	a("k",2,8)
	a("l",2,9)
	a("z",3,1)
	a("x",3,2)
	a("c",3,3)
	a("v",3,4)
	a("b",3,5)
	a("n",3,6)
	a("m",3,7)
	a("-",3,8)
	a("<-",3,10)
	
	self.keyboard:add(newButt("ok", centerx ,180 + 4.5*dy, function()

		if state.import == "ouiimlikesamsonitsthesourceofmystrength" then
			funkMode = true
			changeState(titleScreen)
		elseif state.import == "awesomesauce" then
			lolmusiceasteregg = true
			audio:shutup()
			audio = newAudioList2() 
			audio:fillCompletely()
			changeState(titleScreen)
		elseif lolchecksum(state.import:sub(1,-2))==state.import:sub(-1) then
			print "correct checksum, loading save data"
			local res = importsave(state.import)
			if res then	
				changeState(titleScreen) 
			else
				exit_prompt = newpopup("incorrect password! :<",{{"ok", function() 
					exit_prompt = nil
				end}})
			end
			
		else
			exit_prompt = newpopup("incorrect password!",{{"ok", function() 
				exit_prompt = nil
			end}})
		end
	end))
end

function savessstate:draw()
	love.graphics.setColor(0,40,0)
	love.graphics.rectangle("fill",0,0,width,height)
	love.graphics.setColor(255,255,255,40)
	love.graphics.draw(self.gfx, width - 400*2, height - 512*2 + 50,0,2,2)
	love.graphics.setColor(255,255,255)
	if self.pass then
		love.graphics.print(self.lolpass, centerx - font:getWidth(self.lolpass)*0.5, centery - 100)
		love.graphics.printf(self.pass, 0, centery - 60, width - 30, "center")
	elseif state.import then
		self.keyboard:draw()
		love.graphics.print("password:",width*0.15,20)
		local str = self.import
		if font:getWidth(str) > width*0.85 then
			local len = math.ceil(#str / 2)
			str = str:sub(1,len) .. " " .. str:sub(len+1)
		end
		love.graphics.printf(str, width*0.15, 50, width*0.85, "left")
	else
		self.butts:draw()
	end
end

function savessstate:mousepressed()
	if self.pass then
		self.pass = nil
	elseif state.import then
		self.keyboard:click()
		
	else
		self.butts:click()
	end
end

function savessstate.is_ok(k)
	local a = "a"
	local z = "z"
	local zero = "0"
	local nine = "9"

	return (k:byte() >= zero:byte() and k:byte() <= nine:byte()) or (k:byte() >= a:byte() and k:byte() <= z:byte())
end

function savessstate:keypressed(k)
	if k:sub(1,2) == "kp" then
		k = k:sub(3)
		if k=="enter" then
			k = "return"
		end
	end
	if state.import ~= nil then
		if k == "backspace" then
			self.import = self.import:sub(1,-2)
			local butt = self.byletter['<-']
			if butt then
				butt.tween.clicktime = butt.tween.mclicktime
				audio:playSfx("butt")
			end
		elseif #k==1 and self.is_ok(k) then
			self.import = self.import .. k
			local butt = self.byletter[k]
			if butt then
				butt.tween.clicktime = butt.tween.mclicktime
				audio:playSfx("butt")
			end
		elseif #k==1 then
			self.import = self.import .. "-"
			local butt = self.byletter['-']
			if butt then
				butt.tween.clicktime = butt.tween.mclicktime
				audio:playSfx("butt")
			end
		elseif k=="return" or k=="kpenter" then
			self.keyboard.list[#self.keyboard.list].click()
		end
	end
	
end