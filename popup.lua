--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

local popupclass = newClass()

function popupclass:draw()
	love.graphics.setColor(self.c[1],self.c[2],self.c[3],200)
	love.graphics.rectangle("fill",centerx-self.sizex/2,centery-50-self.sizey/3,self.sizex,self.sizey)
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("line",centerx-self.sizex/2,centery-50-self.sizey/3,self.sizex,self.sizey)
	self.text:draw()
	self.anss:draw()
end

function popupclass:mousepressed()
	self.anss:click()
end

function newpopup(text,answers) --answers={{"hello",function() lol()  end}, {"lol",function() end}}
	local o = popupclass:newInstance()
	
	local centery = centery - 50
	
	o.text = newButt(text,centerx,centery,function() end)
	o.text.noborder = true
	
	local bw = 100

	local x = centerx - #answers * bw / 2 + (bw/#answers)
	local y = centery + 120
	
	o.anss = newButtList()
	for i=1,#answers do
		local ans = answers[i]
		local butt = newButt(ans[1],x,y,ans[2])
		butt.popup = true
		o.anss:add(butt)
		x = x + bw
	end
	o.anss.list[1].keyshortcut = "(space)"
	if (o.anss.list[2]) then
		o.anss.list[2].keyshortcut = "(escape)"
	end
	o.sizex = math.max((10+bw)*(#answers),o.text.w) + 80
	o.sizey = font:getHeight() + 180 + 100
	
	o.c = {math.random()*205, math.random()*205, math.random()*205}
	
	return o
end
