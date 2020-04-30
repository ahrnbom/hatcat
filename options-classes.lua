--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

allOptions = {}
allOptionNames = {}

optionClass = newClass()
function newOption(name,func)
	local o = optionClass:newInstance()
	o.name = name
	o.func = func
	return o
end

function optionClass:exec()
	self.func()
end

questionClass = newClass()

function newQuestion(name,answers)
	local o = questionClass:newInstance()
	o.name = name
	o.ans = answers
	allOptions[name] = o
	table.insert(allOptionNames,name)
end

function questionClass:getStandardOption()
	return self.ans[1]
end

function getStandardOptions()
	local o = {}
	for i,v in pairs(allOptions) do
		o[i] = v:getStandardOption().name
	end
	return o
end

function optionsToString()
	local s = "options = {}\n"
	for i,v in pairs(options) do
		s = s.."options['"..i.."'] = '"..v.."'\n"
	end
	return s
end

function writeOptions()
	love.filesystem.write("options.lua",optionsToString())
end

function loadOptions()
	
	local ok,lol = pcall(love.filesystem.load,"options.lua")
	if ok then
		lol()
	else 
		options = getStandardOptions()
		print("I AM ERROR: Failed to load settings properly")
	end
	
	if options["controls"] == nil then
		options.controls = "fast"
	end
	if options["sound effects"] == nil then
		options["sound effects"] = "on"
	end
	
	for i,v in pairs(options) do
		local option = allOptions[i]
		for j = 1,#option.ans do
			if option.ans[j].name == v then
				option.ans[j]:exec()
			end
		end
	end
	
end

newQuestion("show fps",{
	newOption("yes",function()
		showFPS = true
	end),
	newOption("no",function()
		showFPS = false
	end)
})

newQuestion("draw mode",{
	newOption("sb",function()
		drawMode = 1
	end),
	newOption("fb",function()
		drawMode = 2
	end)
})

newQuestion("sound",{
	newOption("on",function()
		lolSound = true
		print(audio.theNameOfTheCurrentlyPlayingMusic)
		audio:playMusic(audio.theNameOfTheCurrentlyPlayingMusic)
	end),
	newOption("off",function()
		lolSound = false
		if audio then
			audio:shutup()
		end
	end)
})

newQuestion("sound effects", {
	newOption("on", function()
		lolSfx = true
	end),
	newOption("off", function()
		lolSfx = false
		if audio then
			audio:sfxShutup()
		end
	end)
})

newQuestion("controls",{
	newOption("fast", function()
		preciseControls = false
	end),
	newOption("precise", function()
		preciseControls = true
	end)
})


loadOptions()
--writeOptions()
