--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

function desu()
	local smallnumber = 0
	if smallMode then
		smallnumber = 50
	end

	local lol = {}
	lol.butts = newButtList()
	lol.butts:add(newButt("return to map",centerx,centery+150 + smallnumber,function()
		changeState(menuClass)

		globalnumber = state.lvlnbr --???
		globalpack = 1
		for i=1,#worlds do
			if worlds[i]==state.diffstr then
				globalpack = i
			end
		end
	end))

	lol.butts:add(newButt("retry",centerx,centery - smallnumber,function()
		
		state:load()
		state.tryAgainScreen = false
	end))
	lol.butts.list[#lol.butts.list].keyshortcut = "(space)"
	lol.returnButt = newButtList()

	lol.returnButt:add(newButt("continue",centerx,centery-150,function()
		state.tryAgainScreen = false
	end))
	
	for i,v in ipairs(lol.butts.list) do
		v.popup = true
	end
	for i,v in ipairs(lol.returnButt.list) do
		v.popup = true
	end
	
	function lol:click()
		if state.tryAgainCanGoBack then
			self.returnButt:click()
		end
		self.butts:click()
	end

	function lol:draw()
	
		if not state.tryAgainCanGoBack then
			audio:playMusic("endingfanfare", true)
		end
		local biglulz = false
		if state.flagFurminated then
			love.graphics.printf("you have been furminated", 0, centery-150, width ,"center")
			biglulz = true
		end
		self.butts:draw()
		if state.tryAgainCanGoBack then
			self.returnButt:draw()
		else
			if not biglulz then
				love.graphics.printf("what a cat-astrophe", 0, centery - 150, width, "center")
			end
		end
	end





	return lol
end
return desu
