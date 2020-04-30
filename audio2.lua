--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

local audioList = newClass({"mlist","slist","mnames","speed"})
audioList.cMusic = ""

function newAudioList2()
	local o = audioList:newInstance()
	--o:fillCompletely()
	o.musictime = 0
	return o
end

function audioList:fillCompletely()
	self.epicspeed = 1
	

	self:addMusic("stellar serenity",0.49*2)
	self:addMusic("funky forest",0.283*2)
	self:addMusic("sunny skies",0.33*2)
	self:addMusic("cactus chaos",0.4738*2)
	self:addMusic("seven seas",0.4935*2)
	self:addMusic("crystal caverns",0.591*2)
	self:addMusic("shiver summit",0.835*2)	
	self:addMusic("twilight tower",0.449*2)
	self:addMusic("mapmusic",0.32*2)
	self:addMusic("intro",0.49*2)
	self:addMusic("rocks",0.3679*2)
	self:addMusic("credits",0.65127*2)
	self:addMusic("shop",0.488*2)
	self:addMusic("winfanfare",0.32*2)
	self:addMusic("endingfanfare",0.4*2)
	
	self:addSfx("loop2", 1)
	self:addSfx("teleport", 2)
	self:addSfx("kids",2)
	self:addSfx("key",1)
	self:addSfx("butt",1)
	self:addSfx("jump",1)
	self:addSfx("damage",1)
	self:addSfx("shoot",1)
	self:addSfx("close",1)
	self:addSfx("close2",1)
	
end

function audioList:addMusic(res, speed)
	local music = love.audio.newSource("audio/"..res..".ogg",'stream')
	music:setLooping(true)
	if lolmusiceasteregg then
		music:setPitch(1.5)
	end
	self.mlist[res] = music
	table.insert(self.mnames, res)
	table.insert(self.speed, speed)
end

function audioList:playMusic(name, noloop)
	
	--[[if name == self.theNameOfTheCurrentlyPlayingMusic then
		local src = self.mlist[name]
		
		return
	end]]
	self.theNameOfTheCurrentlyPlayingMusic = name
	if not lolSound then
		return
	end
	
	self.musictime = 0
	self:sfxShutup()
	if noloop then
		self.mlist[name]:setLooping(false)
	end
	
	if (not (self.cMusic == name)) and self.mlist[name] then
		self:shutup()
		local soundSource = self.mlist[name]
		if not lolmusiceasteregg then
			soundSource:setPitch(1)
		end
		love.audio.play(soundSource)
		if soundSource.tell then
			love.audio.rewind(soundSource)
		end
		self.cMusic = name
	end
end

function audioList:update(dt)
	self.musictime = self.musictime + dt
	
	if lolSound and self.theNameOfTheCurrentlyPlayingMusic and self.musictime > 0.6 and self.musictime < 0.7 then
		print("testing " .. self.musictime)
		local desu = self.mlist[self.theNameOfTheCurrentlyPlayingMusic]
		if desu.tell then
			if desu:tell() < 0.36 then
				print("WE HAVE A PROBLEM WITH MUSIC")
				desu:stop()
				desu:play()
				self.musictime = 0
			end
		end
	end
end

function audioList:setSpeed(factor)
	if not lolSound then
		return
	end
	if not lolmusiceasteregg then
		self.mlist[self.theNameOfTheCurrentlyPlayingMusic]:setPitch(factor)
	end
	--self.epicspeed = factor
end

function audioList:addSfx(res, n)
	
	local list = {}
	for i = 1,n do
		list[i] = love.audio.newSource('audio/fx/' .. res .. '.ogg','static')
	end
	list.i = 1
	self.slist[res] = list
	
end

function audioList:playSfx(name)
	if not lolSfx then
		return
	end
	local list = self.slist[name]
	local src = list[list.i]
	list.i = list.i + 1
	if list.i > #list then
		list.i = 1
	end
	src:setLooping(false)
	src:setPitch(self.epicspeed)
	love.audio.play(src)
	love.audio.rewind(src)
end

function audioList:loopingPitch(pitch)
	if not lolSfx then
		return
	end
	local src = self.slist["loop2"][1]
	src:setPitch(pitch)
end

function audioList:playSfxRepeat(name)
	if not lolSfx then
		return
	end
	local src = self.slist[name][1]
	src:setLooping(true)
	src:setPitch(self.epicspeed)
	love.audio.play(src)
end

function audioList:sfxShutup(name)
	if name then
		local list = self.slist[name]
		for i,v in ipairs(list) do
			love.audio.stop(v)
		end
		
	else
		for i,v in pairs(self.slist) do
			for i2, v2 in ipairs(v) do
				love.audio.stop(v2)
			end
			
		end
	end
	
end

function audioList:shutup()
	if self.mlist[self.cMusic] then
		love.audio.stop(self.mlist[self.cMusic])
	end
	self.cMusic = ""
	self:sfxShutup()
end

audio = newAudioList2() 
