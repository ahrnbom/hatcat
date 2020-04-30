--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

--love.graphics.setIcon(love.graphics.newImage("res/icon.png"))

require "compatability"

release = true

function math.round(x) 
	return math.ceil(x-0.5)
end

function set_huge(b)
	if b then
		
		lolhuge = true
		love.mouse.getX = function()
			local x = origmouse.getX()
			return x*0.5
		end
		love.mouse.getY = function()
			local x = origmouse.getY()
			return x*0.5
		end
		love.mouse.getPosition = function()
			local x = origmouse.getX()
			local y = origmouse.getY()
			return x*0.5, y*0.5
		end
	else
		lolhuge = false
		love.mouse.getX = origmouse.getX
		love.mouse.getY = origmouse.getY
		love.mouse.getPosition = origmouse.getPosition
	end
end


function love.load()
	if love.graphics.setDefaultFilter then
		love.graphics.setDefaultFilter("nearest", "nearest", 1)
	end

	origmouse = {}
	origmouse.getX = love.mouse.getX
	origmouse.getY = love.mouse.getY
	origmouse.getPosition = love.mouse.getPosition

	print("Hat Cat version 1." .. require("version") .. " started!")
	
	if release then
		print = function() end
	end
	lolNecoDirection = false
	
	worlds = {"sunny skies", "funky forest", "seven seas", "cactus chaos", "crystal caverns", "shiver summit", "stellar serenity", "twilight tower","shop"}
	
	function stdCollide(hero,item)
		if not item then return false end
		if hero.flagRide then
			return hero.x > 32*(item.x-1) and hero.x < 32*(item.x-1) + item.w  and hero.y - 32< 32*(item.y-1) + item.h + 5 and hero.y > 32*(item.y-1) 
		elseif hero.pattern and hero.pattern.flagFallSpike and item.s == "button" then
			return hero.x > 32*(item.x-1) and hero.x < 32*(item.x-1) + item.w*1.5  and hero.y < 32*(item.y-1) + item.h + 5 and hero.y > 32*(item.y-1) 
		elseif item.s == "button" then
			return hero.x > 32*(item.x-1) and hero.x < 32*(item.x-1) + item.w*1.25  and hero.y < 32*(item.y-1) + item.h + 5 and hero.y > 32*(item.y-1) 
		else
			return hero.x > 32*(item.x-1) and hero.x < 32*(item.x-1) + item.w  and hero.y < 32*(item.y-1) + item.h + 5 and hero.y > 32*(item.y-1) 
		end
	end
	
	function stdCollide2(x,y,item)
		if not item then return false end
		return x > 32*(item.x-1) and x < 32*(item.x-1) + item.w  and y < 32*(item.y-1) + item.h + 5 and y > 32*(item.y-1) 
	end
	
	
	local oldNewImage = love.graphics.newImage
	function love.graphics.newImage(r)
		local i = oldNewImage(r)
		i:setFilter("nearest","nearest")
		i:setWrap("clamp","clamp")
		return i
	end
	
	love.graphics.newImageLol = love.graphics.newImage --always keeps cats normal
	
	
	function awesomePoints(x1,y1,x2,y2)
		local l = math.sqrt(math.pow(x1-x2,2) + math.pow(y1-y2,2))
		local d = math.atan2(y2-y1,x2-x1)
		local points = {}
		for i = 1,l,10 do
			table.insert(points,{math.floor(x1 +i*math.cos(d)),math.floor(y1 + i*math.sin(d))})
		end
		return points
	end
	
	function awesomeLine(x1,y1,x2,y2) 
		--[[local l = math.sqrt(math.pow(x1-x2,2) + math.pow(y1-y2,2))
		local d = math.atan2(y2-y1,x2-x1)
		for i = 1,l,4 do
			love.graphics.point(0.5 + x1 +i*math.cos(d), 0.5 + y1 + i*math.sin(d))
			love.graphics.point(0.5 + x1 +i*math.cos(d),1.5+y1 + i*math.sin(d))
			love.graphics.point(1.5 + x1 +i*math.cos(d),0.5 + y1 + i*math.sin(d))
			love.graphics.point(1.5 + x1 +i*math.cos(d),1.5 + y1 + i*math.sin(d))
		end]]
		love.graphics.line(x1,y1,x2,y2)
	end

	function lolCenter(s, x, y)
		return s, x - font:getWidth(s)*0.5, y - font:getHeight()*0.5
	end
	
	--globalnumber = 1

	ctime = 0.5
	
	computerMode = false
	if love.graphics.getWidth() == 800 and love.graphics.getHeight() == 600 then
		computerMode = true
	end
	
	
	
	smallMode = true --SMALLMODE
	
	--local fontlol = "res/smallfont.png"
	local fontlol = "res/newfont.png"
	if love.graphics.getWidth()>480 then
		fontlol = "res/newfont.png"
		smallMode = false
	end
	font = love.graphics.newImageFont(fontlol," abcdefghijklmnopqrstuvwxyz0123456789/.?!A,<:-O';()")
	
	if font.setFilter then
		font:setFilter("nearest","nearest")
	end
	
	love.graphics.setFont(font)
	
	--setResolution(love.graphics.getWidth(),love.graphics.getHeight(),false,true)
	
	require 'tbone-class'
	require 'minloops'
	require 'savehs'
	require 'animsb'
	require 'audio2'
	require 'state'
	require 'butt'
	require 'popup'
	require 'shop'
	require 'hint'
	
	require 'saves'
	
	
	local res = false
	
	if love.filesystem.exists("awesomesavefile") then
		local save = love.filesystem.read("awesomesavefile")
		res = importsave(save)
	end	
	
	if not res then
		if pcall(function()
			hs = require "hs"
		end) then
			if type(hs)=="boolean" then
				hs = require "bhs"
			end
		else
			hs = require "bhs"
		end
		
		while type(hs)=="boolean" do
			hs = require "bhs"
		end
	end
	
	require 'map'
	require 'menustate'
	require 'anim'
	require 'options-classes'
	require 'go'
	require 'titlestate'
	require 'titlestate2'
	require 'trollstate'
	require 'titlescreen'
	require 'optionsstate'
	require 'editoritem'
	require 'editor'
	require 'editor-select'
	require 'sb-system'
	require 'fb-system'
	require 'gfx'
	require 'control'
	require 'controll' --problem?
	require 'controll-precise'
	require 'nmypatterns'
	require 'nmy'
	require 'gamestate'
	require 'confetti' -- every good game requires confetti
	require 'minigame'
	require 'uctions'
	require 'setres'
	require 'credits'
	require 'stest'
	require 'poem'
	
	require 'levelnames'
	
	lolhuge = false
	
	function setResolution(w,h,fs,noChange)
		
		if not love.graphics.checkMode(w, h, fs or false) then
			exit_prompt = newpopup("sorry, not supported", {{"ok",function()
				exit_prompt = nil
			end}})
			return
		end
		
		local fac = 1
		
		if h and h < 1001 then
			set_huge(false)
		end
		
		if h and h > 1000 then
			set_huge(true)
			w = w*0.5
			h = h*0.5
			fac = 2
		end
		
		
		width = w or width
		height = h or height
		centerx = width/2
		centery = height/2
		troll = false
		if fs then
			troll = true
		end
		if computerMode and (not noChange) then
			love.graphics.setMode(width*fac,height*fac,troll,false)
			if troll then
				flagFullscreen = true
			end
		end
		
		x_corr = 400 - 130
		y_corr = 240
		
		if height < 500 then
			y_corr = 250
		end
	end
	
	setResolution(love.graphics.getWidth(),love.graphics.getHeight(),false, true)
	
	x_corr = 400 - 130
	y_corr = 240
	
	
	--MgE2v3Am
	
	
	
	state = stateClass
	if release then
		changeState(trollClass)
	else
		changeState(titleScreen)
		if audio then
			audio:fillCompletely()
		end
	end
	globalTicker = 0
	love.graphics.setLineWidth(3)
	oldSetColor = love.graphics.setColor
	function love.graphics.setColor(a,b,c,d)
		if funkMode and a==255 and b==255 and c==255 then
			oldSetColor(200 + 55*math.sin(1 + 5*globalTicker),200 + 55*math.cos(2*globalTicker),200 + 55*math.sin(3*globalTicker),d)
		else
			oldSetColor(a,b,math.ceil(c),d)
		end
	end
	
	newEffects = require 'effect'
	
	
end

--[[ orsakar lite buggar
function love.focus(f)
	if not f then
		state.pause = true
		if state.c and state.c.butts then
			state.c.butts.yes = true
		end
	end
end]]

function love.focus(f)
	if not f then
		mouseOutsideBounds = true
	else
		mouseOutsideBounds = false
	end
end

--[[
f(0) = 0
f(1) = 1
f'(0) = 0
f'(1) = 0
f(x) = a*x^3 + b*x^2 + c*x + d

d = 0
a + b + c = 1
c = 0
3a + 2b + c = 0

a + b = 1
3a + 2b = 0

a = 1-b
3 - 3b + 2b = 0
-b = -3
b = 3

a = -2 
]]
function smooth_step(x)
	return -2*x*x*x + 3*x*x
end
local two_thirds = 0.625 --snyggt, va? :P

function goodsmoothstep(x, lower, upper)
	local y = (x - lower)/(upper - lower)
	return lower + (3*y*y - 2*y*y*y)*(upper - lower)
	
end

function love.draw()
	if lolhuge then
		love.graphics.push()
			love.graphics.scale(2,2)
			love.draw2()
		love.graphics.pop()
	else
		love.draw2()
	end
	
	
end

function love.draw2()
	if not theTimes then 

		state:draw()
		if state.tryAgainScreen then
			love.graphics.setColor(0,0,0,150)
			love.graphics.rectangle("fill",0,0,width,height)
			love.graphics.setColor(255,255,255,255)
			
			state:tryAgainDraw()
		end
		
		
		if pause then
			love.graphics.setColor(0,0,0,100)
			love.graphics.rectangle("fill",0,0,width,height)
			love.graphics.setColor(255,255,255,255)
		end
	end 
	--local z = smooth_step(two_thirds*lolt) * 1.599999
	
	local epicfailure = math.floor(255*math.sin((math.pi/2) * (lolt/ctime)))
	
	love.graphics.setColor(0,0,0,epicfailure)
	love.graphics.rectangle("fill",0,0,width,height)
	love.graphics.setColor(255,255,255,255)
	
	if exit_prompt then
		love.graphics.setColor(0,0,0,180)
		love.graphics.rectangle("fill",0,0,width,height)
		love.graphics.setColor(255,255,255)
		exit_prompt:draw()
	end
	
end

mainTime = 0
mainDT = 0.01666666666

mainTime2 = 0 --ökar bara uppåt hela tiden

function love.update(dt)
	
	
	dt = math.min(dt, 0.35)
	--[[
	mainTime = mainTime + dt
	while mainTime > mainDT do
		mainUpdate(mainDT)
		mainTime = mainTime - mainDT
	end
	]]
	mainUpdate(dt)
	mainTime2 = mainTime2 + dt
end

function mainUpdate(dt)
	audio:update(dt)
	globalTicker = globalTicker + dt*0.5
	if globalTicker > 6.283 then
		globalTicker = 0
	end

	if not changingState then
		if not pause then
			if exit_prompt then
				--nada
			elseif state.tryAgainScreen then
				state:tryAgainUpdate(dt)
			else
				state:update(dt)
				if state.fast then
					state:update(dt)
					state:update(dt)
				end
			end
		end
	elseif not exit_prompt then
		lolt = lolt + dt
		if lolt > 0.7 * ctime then
			theTimes = true
		end
		if lolt > 1.5*ctime then
			theTimes = false
		end
		if lolt > ctime then
			if not lolmark then
				rChangeState(changingState)
				lolmark = true
			end
			if lolt > 2*ctime then
				changingState = nil
				lolt = 0

			end
		end
	end
end

local function lolexit()
	if saveHS then
		saveHS()
	end
	if love.event.quit then
		love.event.quit()
	else
		--LÖVE 0.7.2 or earlier
		love.event.push('q')
	end
end

exit_prompt = nil

function love.keypressed(k)
	if changingState then
		if exit_prompt then
			if k=="return" or k=="kpenter" or k==" " then
				exit_prompt.anss.list[1].click()
			end
			if k=="escape" and exit_prompt.anss.list[2] then
				exit_prompt.anss.list[2].click()
		end
		return
	end
		return
	end
	if exit_prompt then
		if k=="return" or k=="kpenter" or k==" " then
			exit_prompt.anss.list[1].click()
		end
		if k=="escape" and exit_prompt.anss.list[2] then
			exit_prompt.anss.list[2].click()
		end
		return
	end
	if (not release) and k == "y" then
		 state.bosshealth = 1
	end
	if k=="f4" and love.keyboard.isDown("lalt") then
		lolexit()
	end
	if k=="escape" then
		if not state.flagGameStateClass then
			exit_prompt = newpopup("really quit?",{{"yes",lolexit},{"no", function()
				exit_prompt = nil
			end}})
			
		else
			-- gamestate
			if not state.tryAgainScreen then
				local butt = state.c.butts.troll.list[1]
				butt.click()
			end
		end
	elseif (not release) and k=='0' then
		if funkMode then
			funkMode = false
		else
			funkMode = true
		end
	end
	if not lolstate then
		if k=="up" then
			k="w"
		elseif k=="left" then
			k="a"
		elseif k=="right" then
			k="d"
		elseif k=="down" then
			k="s"
		end
		
		state:keypressed(k)
	end
end

function love.keyreleased(k)
	if state.keyreleased then
		if k=="up" then
			k="w"
		elseif k=="left" then
			k="a"
		elseif k=="right" then
			k="d"
		elseif k=="down" then
			k="s"
		end
		state:keyreleased(k)
	end
end

local old_isDown = love.keyboard.isDown
function love.keyboard.isDown(k)
	local k2 = k
	if k=="w" then
		k2="up"
	elseif k=="a" then
		k2="left"
	elseif k=="d" then
		k2="right"
	elseif k=="s" then
		k2="down"
	end
	
	return old_isDown(k) or old_isDown(k2)
end

function love.mousepressed(x,y,k)
	if not changingState then
		if state.tryAgainScreen then
			
			state:tryAgainClick(k)
		else
			if k=='l' then
				if exit_prompt then
					exit_prompt:mousepressed()
				else
					state:mousepressed(k)
				end
			elseif state.scrollwheel then
				if k == "wu" or k=="wd" then
					state:scrollwheel(k)
				end
			end
		end
	elseif k=='l' then
		if exit_prompt then
			exit_prompt:mousepressed()
		end
	end
end

function love.mousereleased(x,y,k)
	if not (changingState or state.tryAgainScreen) then
		if k=='l' then
			state:mousereleased(k)
		end
	end
end
