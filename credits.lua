--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

creditsState = stateClass:newSubClass()

function creditsState:load()
	self.pos = height
	
	audio:playMusic("credits", true)

	local m = "martin 'a-bone' ahrnbom"
	local g = "gunnar 'gunkmeister' weibull"
	self.text = {
		"",
		"hat cat credits",
		"",
		"",
		"",
		"producer: " .. m,
		"art director: " .. g,
		"",
		"",
		"gameplay director: " .. m,
		"design director: " .. g,
		"music director: " .. g,
		"story director: " .. m,
		"",
		"",
		"music composer: " .. g,
		"",
		"map data manager: " .. m,
		"",
		"programmers:",
		"\tmain system: " .. m,
		"\tdisplay system: " .. m,
		"\tenemy program: " .. m,
		"\tboss enemy program: " .. m,
		"\tprogram: " .. m,
		"\ttechnical program: " .. m,
		"\ttool program: "..m,
		"\tcamera program: " .. m,
		"",
		"",
		"designers: ",
		"\tcharacter design: " .. g,
		"\tfield design: "..g,
		"\tlevel design: " .. m,
		"\teffects design: ".. g,
		"\tprerendered background design: " .. g,
		"\titem design: "..g,
		"",
		"",
		"orchestra: ",
		"\tconductor: " .. g,
		"\tsquare wave: " .. g,
		"\ttriangle wave bass: "..g,
		"\tsine wave: "..g,
		"\twhite noise percussion: "..g,
		"\tthat guy that fetched drinks during",
		"\t \t rehearsals: "..g,
		"\tmusic recorded in funky ape studios, lund, sweden",
		"",
		"",
		"art work unit: ",
		"\tconcept artist: ".. g,
		"\tpixel picasso: ".. g,
		"\tcharacter illustration: " .. g,
		"\tlead animator: ".. g,
		"\tpoorly paid tween animator: "..g,
		"\tillustration support: "..g,
		"\tmanual editor: " .. m,
		"\tcartographer: "..g,
		"",
		"",
		"support unit: ",
		"\tsupervisors: " .. g,
		"\tschedule management: " .. m, 
		"\tcoordinator: " .. m,
		"\tscript support: " .. g,
		"\tenglish text writer: " .. m,
		"\tenglish text translator: " .. m,
		"\ttechnical support: " .. m,
		"\tmotion editor: " .. g,
		"",
		"",
		"progress management: " .. m,
		"",
		"",
		"mad hatter: "..g,
		"",
		"",
		"production baby: simon",
		"",
		"",
		
		"special thanks to:",
		"\t"..m,
		"\t"..g,
		"",
		"",
		"executive producers: ",
		"\t"..m,
		"\t"..g,
		"",
		"",
		"presented by:",
		"\tt-bone independent software solutions",
		"\t \t" .. m,
		"\tfunky ape studios",
		"\t \t" .. g,
		"",
		""
	}
	
	for i = 1, height/font:getHeight() do
		table.insert(self.text, "")
	end
	table.insert(self.text, "the end")
	
	for i=1,#self.text do
		self.text[i] = string.gsub(self.text[i],"\t","  ",1)
	end
	
	local length = self:getY(#self.text)
	self.speed = length / (57+5)
	
	self.anims = {}
	
	local worlds = {"skies", "forest", "seas", "chaos", "caverns", "summit", "serenity", "tower"}
	for i=1,8 do
		self.anims[i] = newAnim(love.graphics.newImageLol("gfx-" .. worlds[i] .. "/katten.png"), 32, 32, 8, 0.1)
		self.anims[i+8] = newAnim(love.graphics.newImage("gfx-" .. worlds[i] .. "/testenemy.png"), 32, 32, 4, 0.1)
	end
	table.insert(self.anims, newAnim(love.graphics.newImage("gfx-chaos/camel.png"),32,64,8,0.1))
	table.insert(self.anims, newAnim(love.graphics.newImage("gfx-forest/nekosan.png"),32,32,4,0.1))
	
	local len = #self.anims
	local rand = function(n)
		local i = math.ceil(n*math.random())
		if i==0 or i>n then
			return rand(n)
		end
		return i
	end
	
	self.lol = {}
	for i = 1, #self.text do
		self.lol[i] = rand(len)
	end
	
	self.flip = false
	self.t = 0
	self.tt = 0
	
	self.col = {r=0,g=0,b=0}
end

function creditsState:getY(i)
	return self.pos + i*font:getHeight() + 3
end

local function lol(bool, i)
	if i%3 > 1 then
		return bool
	end
	return not bool
end

function creditsState:color(c)
	local val = 50
	c.r = val - val*math.cos(5*self.tt)
	c.g = val - val*math.cos(3*self.tt)
	c.b = val - val*math.cos(2*self.tt)
end

local inv = function(i)
	if i==0 then
		return 1
	end
	return 0
end

function creditsState:draw()
	love.graphics.setColor(self.col.r, self.col.g, self.col.b)
	love.graphics.rectangle("fill",0,0,width,height)
	love.graphics.setColor(255,255,255)
	for i = 1,#self.text do
		local s = self.text[i]
		love.graphics.print(s, centerx - 260, self:getY(i))
		local anim = self.anims[self.lol[i]]
		anim:draw(32 + (width-64)*inv(i%2), self:getY(i) - anim.h + 32, lol(self.flip, i))
	end
end

function creditsState:update(dt)
	if not release and love.keyboard.isDown("f") then
		dt = dt*4
	end
	if self:getY(#self.text) > height - 64 then
		self.pos = self.pos - self.speed*dt
	end
	for i=1,#self.anims do
		self.anims[i]:stdUpdate(dt)
	end
	self.t = self.t + dt
	if self.t > 0.5 then
		self.flip = not self.flip
		self.t = 0
	end
	self.tt = self.tt + dt*0.1
	self:color(self.col)
end
