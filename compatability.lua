--[[
This software is released under the MIT License. See LICENSE.txt for details.
]]

--this helps games made for LÖVE 0.8.0 run on LÖVE 0.9.0
--should be required at the top of main.lua
--it only covers some aspects but should be enough for a "simple" game like hatcat

if not love.graphics.setLineWidth then
	function love.graphics.setLineWidth()
	
	end
	
	function love.graphics.getLineWidth()
	
	end
end


if not love.window then
	return
end

love.graphics.getModes = love.window.getFullscreenModes

local modes = love.window.getFullscreenModes()
function love.graphics.checkMode(w, h, fs)
	if not fs then
		return true
	end
	
	for i,v in ipairs(modes) do
		if v.width == w and v.height == h then
			return true
		end
	end
	
	return false
end

love.graphics.drawq = love.graphics.draw

love.graphics.setMode = function( width, height, fullscreen, vsync, fsaa )
	love.window.setMode(width, height, {fullscreen=fullscreen, vsync=vsync, fsaa=fsaa})
end

local newSB = love.graphics.newSpriteBatch
function love.graphics.newSpriteBatch(image, size)
	local sb = newSB(image, size)
	local mt = getmetatable(sb)
	mt.__index.addq = mt.__index.add
	return sb
end

local newPS = love.graphics.newParticleSystem
function love.graphics.newParticleSystem(image, buffer)
	local ps = newPS(image, buffer)
	local mt = getmetatable(ps)
	ps.__index.setParticleLife = ps.__index.setParticleLifetime
	return ps
end