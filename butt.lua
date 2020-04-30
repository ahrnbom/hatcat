--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

buttClass = newClass()

if smallMode then
	buttClass.margin = 10
	buttClass.extraw = 15
	buttClass.extrah = 6
	buttClass.smallnumber = 6
else
	buttClass.margin = 20
	buttClass.extraw = 30
	buttClass.extrah = 15
	buttClass.smallnumber = 0
end

function newTween()
	local tween = {}
	tween.fact = 1
	tween.clicktime = 0
	tween.mclicktime = 0.5
	return tween
end

function newButt(s,x,y,f,w,h,t)
	local o = buttClass:newInstance()
	o:setS(s)
	o.x = x
	o.y = y
	local tween = newTween()
	o.click = function()
		tween.clicktime = tween.mclicktime
		f()
		audio:playSfx("butt")
	end
	o.tween = tween
	return o
end


function buttClass:setS(s)
	self.s = s
	
	self.w = font:getWidth(s) + self.extraw
	self.h = font:getHeight() + self.extrah
end

function buttClass:troll()
	self.flagAsTrollLol = true
	return self
end

function buttClass:drawlol(transparent)
	
	self:draw(transparent)
end

function buttClass:draw(transparent, purple)
	if self.flagNoAnimLol then
		return self:draw2(transparent, purple)
	end
	love.graphics.setColor(255,255,255)
	love.graphics.push()
	
		local tween = self.tween
		local x,y = love.mouse.getPosition()
		if state.flagOptionsState and not exit_prompt then
			-- modify x, y
			x = x - centerx + x_corr
			y = y - centery + y_corr
		end
		
		local dt = love.timer.getDelta()
		
		local upperbound = 1.2
		
		if self:inside(x,y) and (self.popup or not exit_prompt) and (self.popup or not state.tryAgainScreen) and not love.mouse.isDown("l") then
		
			if self.keyshortcut then
				local w = font:getWidth(self.keyshortcut)
				local y = self.y - self.h - 15
				if y < 0 then
					y = self.y + self.h - 15
				end
				love.graphics.print(self.keyshortcut, self.x - w/2, y - self.smallnumber)
			end
	
		
			tween.fact = tween.fact + 1.5*dt
			tween.fact = math.min(tween.fact, upperbound)
		else
			tween.fact = tween.fact - 1.5*dt
			tween.fact = math.max(tween.fact, 1)
		end
		
		local fact = goodsmoothstep(tween.fact, 1, upperbound)
		local fact2 = 1
		
		if tween.clicktime > 0 then
			local diff = tween.mclicktime - tween.clicktime
			fact2 = 0.1429*(6+math.cos(2*math.pi*diff/tween.mclicktime))
			fact = fact * fact2
			fact2 = (19+fact2)*0.05
			tween.clicktime = tween.clicktime - 2*dt
		end
		love.graphics.translate(self.x, self.y)
		love.graphics.scale(fact, fact)
		love.graphics.rotate(2*math.pi*fact2)
		love.graphics.translate(-self.x, -self.y)
			
		
		self:draw2(transparent, purple, true)
		
	love.graphics.pop()
	love.graphics.print(self.s, self.x - self.w/2 + self.extraw/2,self.y - self.h/2 + 10 - self.smallnumber)
end

function buttClass:draw2(transparent, purple, henshin)

	local t = 100
	local t2 = 255
	if transparent then
		t = 50
		t2 = 50
	end
	if purple or (self.lolf and self.lolf()) then
		self:trollDraw(henshin)
		return
	end
	if not self.noborder then
		love.graphics.setColor(0,0,0,t)
		love.graphics.rectangle("fill",self.x-self.w/2,self.y-self.h/2,self.w-1,self.h-1)
	end
	love.graphics.setColor(255,255,255,t2)
	if not self.noborder then
		love.graphics.rectangle("line",self.x-self.w/2,self.y-self.h/2,self.w,self.h)
	end
	if not henshin then
		love.graphics.print(self.s, self.x - self.w/2 + self.extraw/2,self.y - self.h/2 + 10 - self.smallnumber)
	end
	
end

function buttClass:trollDraw(henshin)
	
	love.graphics.setColor(0,0,0)
	love.graphics.rectangle("fill",self.x-self.w/2,self.y-self.h/2,self.w-1,self.h-1)
	love.graphics.setColor(255,0,255)
	love.graphics.rectangle("line",self.x-self.w/2,self.y-self.h/2,self.w,self.h)
	if not henshin then
		love.graphics.print(self.s, self.x - self.w/2 + self.extraw/2,self.y - self.h/2 + 10 - self.smallnumber)
	end
	
end

function buttClass:inside(x,y)
	return x > self.x-self.w/2 - self.margin and y > self.y - self.h/2 - self.margin and x < self.x + self.w/2 + self.margin and y < self.y + self.h/2 + self.margin
	
end

function buttClass:mousepressed()
	if self:inside(love.mouse.getPosition()) then
		
		self:click()
	end
end

buttListClass = newClass({"list"})

function newButtList()
	return buttListClass:newInstance()
end

function buttListClass:add(b)
	table.insert(self.list,b)
end

function buttListClass:draw(transparent,t2)
	for i = 1,#self.list do
		if self.flagLolCoords then
			self.list[i]:drawlol(transparent,t2)
		else
			self.list[i]:draw(transparent,t2)
		end
	end
end

function buttListClass:click()
	local x,y = love.mouse.getPosition()
	if self.flagLolCoords then
		x = -centerx + x_corr + x
		y = -centery + y_corr + y
	end
	if self.corr then
		x = x - self.corr.x
		y = y - self.corr.y
	end
	local res = false
	
	for i = 1,#self.list do
		if self.list[i]:inside(x,y) then
			self.list[i].click()
			res = true
			break	
		end
	end
	return res
end

function buttListClass:lolInside()
	local x,y = love.mouse.getPosition()
	if self.flagLolCoords then
		x = -centerx + x_corr + x
		y = -centery + y_corr + y
	end
	if self.corr then
		x = x - self.corr.x
		y = y - self.corr.y
	end
	local res = false
	
	for i = 1,#self.list do
		if self.list[i]:inside(x,y) then
			--self.list[i].click()
			res = true
			break	
		end
	end
	return res
end



function buttListClass:update(dt) --TODO så vitt jag vet används denna inte..?
	--behövs endast om LPButts finns i listan
	if not love.mouse.isDown('l') then
		return
	end
		
	
	for i = 1,#self.list do
	
		if self.list[i].flagLP then
			
			self.list[i]:update(dt)
		end
	end
end

buttListClassPro = buttListClass:newSubClass()

function newButtListPro()
	local o = buttListClassPro:newInstance()
	o.yes = false
	o.troll = newButtList()
	o.troll2 = newButtList()
	return o
end

function buttListClassPro:add2(b)
	self.troll:add(b)
end


function buttListClassPro:add3(b,f)
	self.troll2:add(b)
	b.lolf = f
end

function buttListClassPro:draw(transparent)
	for i = 1,#self.list do
		self.list[i]:draw(transparent)
	end
	--if self.yes then
		self.troll:draw(transparent)
	--else
		self.troll2:draw(transparent)
	--end
end

function buttListClassPro:click()
	local x,y = love.mouse.getPosition()
	local res = false
	
	for i = 1,#self.list do
		if self.list[i]:inside(x,y) then
			self.list[i].click()
			res = true
			break	
		end
	end
	
	--if self.yes then
		local trollres1 = self.troll:click()
		res = trollres1 or res
	--else
		local trollres2 = self.troll2:click()
		res = trollres2 or res
	--end
	
	return res
end

function buttListClassPro:lolInside()
	local x,y = love.mouse.getPosition()
	local res = false
	
	for i = 1,#self.list do
		if self.list[i]:inside(x,y) then
			--self.list[i].click()
			res = true
			break	
		end
	end
	
	--if self.yes then
		local trollres = self.troll:lolInside()
		res = trollres or res
	--else
		local trollres = self.troll2:lolInside()
		res = trollres or res
	--end
	
	return res
end

function buttListClassPro:update(dt) 
	--behövs endast om LPButts finns i listan
	if not love.mouse.isDown('l') then
		return
	end
	
	for i = 1,#self.troll.list do
		if self.troll.list[i].flagLP then
			self.troll.list[i]:update(dt)
		end
	end
end

local MLButt = buttClass:newSubClass()

function newMLButt(s,x,y,f,w,h)
	local o = MLButt:newInstance()
	o:setS(s)
	o.x = x
	o.y = y
	
	o.click = f
	o.extraw = o.extraw + 40
	return o
end

function MLButt:setS(ss) 
	self.n = #ss
	self.s = ss
	local s = ss[1]
	for i=1,#ss do
		if #ss[i] > #s then
			s = ss[i]
		end
	end
	self.w = font:getWidth(s) + self.extraw
	self.h = self.n*font:getHeight() + self.extrah
	
end

function MLButt:draw(dx)
	local dx = dx or 0
	love.graphics.setColor(0,0,0,100)
	love.graphics.rectangle("fill",self.x-self.w/2,self.y-self.h/2,self.w-1,self.h-1)
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("line",self.x-self.w/2,self.y-self.h/2,self.w,self.h)
	for i=1,#self.s do
		love.graphics.print(self.s[i], self.x - self.w/2 + self.extraw/2 + dx,self.y - self.h/2 + (i-1)*32 + 10 - self.smallnumber)
	end
end

local LPButt = buttClass:newSubClass()

function LPButt:update(dt,mx,my)
	--utgår ifrån att musen trycks ner

	mx = mx or love.mouse.getX()
	my = my or love.mouse.getY()
	if self:inside(mx,my) then
		self.click(dt)
	end
end

function newLPButt(s,x,y,f)
	local o = LPButt:newInstance()
	o:setS(s)
	o.x = x
	o.y = y
	local tween = newTween()
	o.click = function()
		tween.clicktime = tween.mclicktime
		f()
	end
	o.tween = tween
	o.flagLP = true
	return o
end
