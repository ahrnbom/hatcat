--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

uctionsState = newState()

local gameState = gamestateClass

local function steal(name)
	uctionsState[name] = gameState[name]
end
steal "isEmpty"
steal "changeZoom"
steal "moveCam"
steal "moveCamCont"
steal "beginLoop"
steal "makeLoop"
steal "updateLoop"
steal "breakLoop"
steal "earlyCollisions"
steal "update"
steal "drawInScissors"

steal "updateAnims"
steal "toScreenCoordsX"
steal "toScreenCoordsY"

uctionsState.internalDraw = gameState.draw
uctionsState.internalLoad = gameState.load


function uctionsState:loadlevel(n,s,gfx)
--todo
	local troll = love.filesystem.load("uctionslvl.lua")
	local lvl,items,decs,nmys = troll()(gfx)
	for i = 1,100 do
		for j = 1,100 do
			if not lvl[i][j] then
				lvl[i][j] = 0
			end
		end
	end
	return lvl,items,decs,nmys or {}
end

function uctionsState:die()
	changeState(titleScreen)
end

function uctionsState:load()
	globalzoom = 2
	self.diffstr = "sunny skies"
	self.noInput = true
	self.flagUctions = true -- uctions uctions uctions
	self:internalLoad()
	self.pause = false
	self:beginLoop(256,100)
	self:updateLoop(480,380)
	self:makeLoop()
	self.camerax = self.camerax + 210
	self.cameray = self.cameray - 30
	self.zoom = self.zoom * (0.67)
	self.corr = 1
	self.ts = {255,255,255}
	if height > 720 then
		self.corr = 0.5
	end
	
	self.text = "hat cat walks forward until it reaches an obstacle or until it falls off an edge. " ..
				"you control it by creating a rectangular loop around it. once the loop is set up " ..
				"it cannot leave it; instead, when it tries to leave it on one side it ends up in the " ..
				"other side.\ncontrols: \n - wasd: move camera\n - mouse click and drag: create loops " ..
				"\n - f,g: fast forward and slow motion" ..
				"\n - space: pause the game\nnote that you can create and destroy loops while the game is paused"
				..
				"\nclick to continue"
				
	self.roflw, self.rofllines = font:getWrap(self.text, self.corr*width/2)
	self.rofly = height/2 - (font:getHeight() * self.rofllines) / 2
	
	
end

function uctionsState.mousepressed()
	local x,y = love.mouse.getPosition()
	if x<10 and y<10 then
		state.text = "if you need instructions, check out the closed uctionsbook\n"..
					"uctions uctions uctions uctions uctions uctions"
	end
	changeState(titleScreen)
end

function uctionsState:draw()
	self:internalDraw()
	love.graphics.setColor(255,255,255)
	love.graphics.print("instructions",10,10)
	love.graphics.printf(self.text, (width / 2) - 3, self.rofly, self.roflw-2)
end

