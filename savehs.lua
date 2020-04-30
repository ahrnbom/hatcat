--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

function saveHS(hs)
	
	--s = "local hs = {}\nfor i=1,#worlds do\n	hs[worlds[i]] = {}\nend\n"
	--for i=1,#worlds do
	--	local world = worlds[i]
	--	local hsw = hs[world]
	--	for j=1,#hsw do
	--		s = s.."hs['"..world.."']["..j.."] = "..hsw[j].."\n"
	--	end
	--	
	--end
	
	--s = s.."\nreturn hs"
	
	s = exportsaves()
	
	love.filesystem.write("awesomesavefile",s)
end
