--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

local function saveLevel(lvl,items,decs,nmys,filename,folder)
	local str = "local function lol(gfx)\nlocal items = newItemList()\n"
	for i=1,#items.list do
		local item = items.list[i]
		str = str.."items:add(newEItem('"..item.s.."',"..item.x..","..item.y..",gfx))\n"
	end
	
	str = str.."local decs = {}\n"
	for i=1,#decs do
		local dec = decs[i]
		str = str.."decs["..i.."] = {"..dec[1]..", "..dec[2]..", "..dec[3].."}\n"
	end
	
	str = str.."local nmys = {}\n"
	for i=1,#nmys do
		local nmy = nmys[i]
		str = str.."nmys["..i.."] = {"..nmy[1]..", "..nmy[2]..", "..nmy[3].."}\n"
	end
	
	
	str = str.."local lvl = {}\n"
	for i=1,#lvl do
		str = str.."lvl["..i.."] = {}\n"
		for j=1,#lvl[1] do
			if lvl[i][j] ~= 0 then
				str=str.."lvl["..i.."]["..j.."] = "..lvl[i][j].."\n"
			end
		end
	end
	
	
	
	str = str.."return lvl,items,decs,nmys\nend\nreturn lol"
	--[[ verkar inte vara nödvändigt
	if love.filesystem.exists(folder) then --PROBLEM när mappen finns i huvudmappen, lol
		
	else
		love.filesystem.mkdir(folder)
	end
	]] 
	love.filesystem.mkdir(folder)
	
	love.filesystem.write(folder.."/"..filename,str)
	
end
return saveLevel
