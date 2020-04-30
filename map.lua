-- This software is released under the MIT License. See LICENSE.txt for details.

-- HERE IS THE MAP- WHERE DO YOU WISH TO GO?


function loadmap()

	if smallMode then
		scaleFactor = 0.8
	else
		scaleFactor = 1
	end

	local map = newClass()
	map.nodes={}

	local function newNode(n,x,y)
		local node = {}
		node.n = n
		node.x = x
		node.y = y
		if n==1 then
			node.youShallNotPass = false
		else
			node.youShallNotPass = true
		end
		node.connect = {}
		table.insert(map.nodes,node)
		return node
	end

	local function singleInsert(a,b)
		for i=1,#a do
			if a[i] == b then
				return
			end
		end
		table.insert(a,b)
	end

	local function connect(n1,n2)
		singleInsert(n1.connect,n2)
		singleInsert(n2.connect,n1)
	end

	function fixnodes()
		local ln = 0
		for line in love.filesystem.lines("mapnodes.lua") do
			
			ln = ln + 1
			local n = 0
			local x = nil
			local y = nil
			local connect = {}
			for word in string.gmatch(line,"%d+") do
				
				n = n + 1
				if n==1 then
					x = tonumber(word)
				elseif n==2 then
					y = tonumber(word)
				else
					table.insert(connect,tonumber(word))
				end
			end
			local node = newNode(ln,x,y)
			node.preconnect = connect
		end
		for i=1,#map.nodes do
			local node = map.nodes[i]
			for j = 1,#node.preconnect do
				connect(node,map.nodes[node.preconnect[j]])
			end
			node.preconnect = nil
		end
	end

	function calc_beatenlevels()
		beatenlevels = {}
		for i=1,(7*(#worlds) + 3) do 
			beatenlevels[i] = 0
			local wi = math.ceil(i/7)
			local li = ((i-1)%7) + 1
			local world = worlds[wi]
			if type(hs)=="boolean" then 
				hs = require "bhs"
			end
			
			local records = hs[ world ]
			if records then
				local record = records[li]
				if record ~= 99 then
					beatenlevels[i] = 1
				end
			end
		end
	end

	calc_beatenlevels()
	--BEAT ALL THE LEVELS!
	fixnodes()

	function newMap(w,h,pos) 

		if smallMode then
			scaleFactor = 0.8
		else
			scaleFactor = 1
		end

		if width > 1600 then
			scaleFactor = 1.25
		end
		
		local o = map:newInstance()
		
		local mappiclol = love.graphics.newImage("res/map14.png")
		
		if not (drawMode == 2) then
			o.pic = love.graphics.newSpriteBatch(mappiclol,1)
			o.pic:add(0,0,0,3) --myes... överväg quads	
		else
			if love.graphics.newFramebuffer then
				o.pic = love.graphics.newFramebuffer(512*4,512*4)
			else
				o.pic = love.graphics.newCanvas(512*4,512*4)
			end
			o.pic:renderTo(function()
				love.graphics.draw(mappiclol,0,0,0,3)
			end)
		end
		o.w = w
		o.h = h
		o.s = ""
		o.butt = newMLButt({""},0,0,function() end)
		o.pos = pos
		o:updatePos()
		o.x = o.nx
		o.y = o.ny
		
		o.minx = 0
		o.miny = 0
		o.maxx = 512*3 - o.w
		o.maxy = 512*3 - o.h
		if smallMode or (width > 1600) then
			o.maxx = 512*3 - o.w/scaleFactor
			o.maxy = 512*3 - o.h/scaleFactor
		end

		
		
		if o.x < 0 then
			o.x = 1
		end
		if o.x > o.maxx then
			o.x = o.maxx - 1
		end
		if o.y > o.maxy then
			o.y = o.maxy - 1
		end
		if o.y < 0 then
			o.y = 1
		end
		
		
		
		o.nodered = love.graphics.newImage("res/mapnode_red.png")
		o.nodegreen = love.graphics.newImage("res/mapnode_green.png")
		o.nodeblue = love.graphics.newImage("res/mapnode_blue.png")
		o.nodeyellow = love.graphics.newImage("res/mapnode_yellow.png")

		o:updateNodes()
		
		o.maphero = newAnim(love.graphics.newImage("res/katten.png"),32,32,8)
		o.maphero.z = 2
		o.maphero.mirror = true
		
		o.lolshroomAnim = newAnim(love.graphics.newImage("res/mushroom.png"), 32, 32, 8, 0.15)
		o.lolshroomAnim.z = 3
		
		o.sukiAnim = newAnim(love.graphics.newImage("res/moon.png"), 64, 64, 4, 0.4)
		o.sukiAnim.z = 3
		
		o.cactusAnim = newAnim(love.graphics.newImage("res/cactus.png"), 32, 32, 16, 0.1)
		o.caveAnim = newAnim(love.graphics.newImage("res/cave.png"), 16, 16, 8, 0.2)
		o.palmAnim = newAnim(love.graphics.newImage("res/palm.png"), 32, 32, 16, 0.15)
		o.granAnim = newAnim(love.graphics.newImage("res/gran.png"), 32, 32, 16, 0.16)
		o.hoshiAnim = newAnim(love.graphics.newImage("res/star.png"), 32, 32, 4, 0.17)
		o.thoshiAnim = newAnim(love.graphics.newImage("res/towerstar.png"), 16, 16, 4, 0.17)
		o.windowAnim = newAnim(love.graphics.newImage("res/towerwindow.png"), 16, 16, 4, 0.09)
		o.wavesAnim = newAnim(love.graphics.newImage("res/waves.png"), 32, 16, 6, 0.1)
		o.cactusAnim.z = 3
		o.caveAnim.z = 3
		o.palmAnim.z = 3
		o.granAnim.z = 3
		o.hoshiAnim.z = 3
		o.thoshiAnim.z = 3
		o.windowAnim.z = 3
		o.wavesAnim.z = 3
		
		
		o.cacti = {{360,415},{303,410},{336,469},{380,450},{425,471}}
		o.caves = {{411,313},{449,301}}
		o.palms = {{409,372},{33,453},{475,464},{506,457},{482,404},{400,472}}
		o.grans = {{323,213},{410,225},{434,232},{452,225},{471,231},{420,187},{496,196},{317,183}} --fenomenal grammatik
		o.hoshis = {{353,73},{409,55},{330,31},{485,68},{491,106}, {450,22}}
		o.thoshis = {{266,154},{277,143},{267,127},{271,85}}
		o.wavesLOL = {{105,403},{170,466},{175,404},{144,437},{40,407},{109,476},{225, 400}, {232, 490}}
		--{31,376},{50,450},
		local node = o.nodes[1]
		for i=1,#o.nodes do
			if o.nodes[i].n == o.pos then
				node = o.nodes[i]
			end
		end
		o.cposx = node.x
		o.cposy = node.y
		o.cgoalx = node.x
		o.cgoaly = node.y
		o.path = {}
		o.pathn = 1
		local function iCanHas(list,a,b)
			for i=1,#list do
				if (list[i][1] == a and list[i][2] == b) or (list[i][1] == b and list[i][2] == a) then
					return true
				end
			end
			return false
		end
		
		local function generateConnections(nodes)
			local sb
			local lulzPic = love.graphics.newImage("res/pixel.png")
			if not (drawMode == 2) then
				sb = love.graphics.newSpriteBatch(lulzPic,10000)
			else
				if love.graphics.newFramebuffer then
					sb = love.graphics.newFramebuffer(512*4,512*4)
				else
					sb = love.graphics.newCanvas(512*4,512*4)
				end
			end
			local cons = {}
			local toDraw = {}

			for i=1,#nodes do
				local node = nodes[i]
				for j=1,#node.connect do
					local othernode = node.connect[j]
					if not (node.youShallNotPass or othernode.youShallNotPass) then 
						if not iCanHas(cons,node,othernode) then
							local points = awesomePoints(node.x,node.y,othernode.x,othernode.y)
							for k=1,#points do
								
								if not (drawMode == 2) then
									
									sb:add(points[k][1],points[k][2])
									
								else
									table.insert(toDraw,{x=points[k][1],y=points[k][2]})
								end
							end
							table.insert(cons,{node,othernode})
						end
					end
				end
			end
			if drawMode == 2 then
				sb:renderTo(function()
					for i=1,#toDraw do
						love.graphics.draw(lulzPic,toDraw[i].x,toDraw[i].y)
					end
				end)
			end
			return sb
		end
		
		o.points = generateConnections(o.nodes)
		
		o.testAnim = newAnimSB(love.graphics.newImage("res/mapanim.png"),6,5,80,50)
		o.testAnim:add(1,0,314)
		o.testAnim:add(2,197,150)
		o.testAnim:add(3,218,0)
		
		o.testAnim:add(6,343,274)
		o.testAnim:add(6,343,274+13)
		o.testAnim:add(6,343,274+13*2)
		o.testAnim:add(6,343,274+13*3)
		
		o.testAnim:add(6,327,350)
		o.testAnim:add(6,327,350+13)
		o.testAnim:add(6,327,350+13*2)
		
		o.testAnim:finalize()
		
		o.trees = newAnimSB(love.graphics.newImage("res/funkytree.png"),4,2,32,32) --TODO
		o.trees:add(1,154,259) --there are so many different kinds of trees
		o.trees:add(1,184,252)
		o.trees:add(1,171,293)
		o.trees:add(1,108,304)
		o.trees:add(1,210,275)
		o.trees:add(1,207,320)
		o.trees:add(1,156,323)
		o.trees:add(1,62,285)
		o.trees:add(1,59,320)
		o.trees:add(1,70,214)
		o.trees:add(1,94,213)
		o.trees:add(1,4,257)
		o.trees:add(1,430/3,860/3)
		
		o.trees:add(2,21,298)
		o.trees:add(2,20,227)

		o.trees:finalize()
		
		o.clouds = {}
		o.clouds.pic = love.graphics.newImage("res/clouds.png")
		o.clouds.w = o.clouds.pic:getWidth()
		o.clouds.h = o.clouds.pic:getHeight()
		o.clouds.quads = {}
		o.clouds.quads[1] = love.graphics.newQuad(0,0,77,43,o.clouds.w,o.clouds.h)
		o.clouds.quads[2] = love.graphics.newQuad(0,44,77,43,o.clouds.w,o.clouds.h)
		o.clouds.quads[3] = love.graphics.newQuad(0,86,77,25,o.clouds.w,o.clouds.h)
		o.clouds.quads[4] = love.graphics.newQuad(0,116,77,25,o.clouds.w,o.clouds.h)
		o.clouds.quads[5] = love.graphics.newQuad(0,143,77,25,o.clouds.w,o.clouds.h)
		o.clouds.quads[6] = love.graphics.newQuad(0,175,77,45,o.clouds.w,o.clouds.h)
		o.clouds.xs = {2,124,95,4,123,30}			
		o.clouds.ys = {55,79,9,116,45,5}
		
		o.heros = {}
		for i=1,#worlds do
			
			local world = worlds[i]
				local gfx = getGfx(world)
				if gfx then
					local icon = gfx.icons.hero
					local hero = newAnim(icon,32,32,8)
					
					if lolNecoDirection ~= nil then
						
						hero.mirror = lolNecoDirection
						
					end
					hero.z = 2
					o.heros[world] = hero
				end
		end
		
		o.firstUpdate = true
		
		return o
	end

	function map:changeHero(diff)
		if self.lolherodiff == diff then
			return
		end
		if self.heros[diff] then
			self.maphero = self.heros[diff]
			
		end
		self.lolherodiff = diff
	end

	local function cloudfix(a)
		if a==1 then
			return 1
		elseif a==2 then
			return 2
		elseif a==3 then
			return 1
		elseif a==4 then
			return 2.5
		elseif a==5 then
			return 3
		elseif a==6 then
			return 4
		end
	end

	function map:drawclouds()
		for i=#self.clouds.quads,1,-1 do
			local x = self.clouds.xs[i]*3 + cloudfix(i)*60*math.cos(globalTicker+cloudfix(i))
			local y = self.clouds.ys[i]*3 + 40*math.sin(cloudfix(i)*globalTicker)/cloudfix(i)
			love.graphics.drawq(self.clouds.pic,self.clouds.quads[i],x,y,0,3)
		end
	end

	function map:updateNodes()
		for i = 2,#self.nodes do
			self.nodes[i].youShallNotPass = true
		end
		for i = 1,#self.nodes do --nodes måste ligga i rätt ordning!!1
			local node = self.nodes[i]
			if beatenlevels[i] == 1 then
				for j = 1,#node.connect do
					node.connect[j].youShallNotPass = nil
				end
			end
			if coincounter[i] then
				node.coin = true --TODO
			end
		end
	end

	function map:drawMapHero()
		local x,y = self:getCPos()
		local dx = -16
		if self.maphero.mirror then
			dx = 16
		end
		self.maphero:draw(x - dx,y - 64,self.maphero.mirror)
	end

	function retPos(n)
		if n<0 then
			return 0
		end
		return n
	end

	function map:draw(c)
		love.graphics.push()
			if smallMode then
				love.graphics.scale(scaleFactor,scaleFactor)
			end
			love.graphics.translate(-retPos(self.x),-retPos(self.y))
			love.graphics.draw(self.pic,0,0,0,1) 
			self.testAnim:draw(3)
			self:drawclouds()
			self.trees:draw(3)
			for i,v in ipairs(self.cacti) do
				self.cactusAnim:draw(v[1]*3,v[2]*3)
			end
			for i,v in ipairs(self.caves) do
				self.caveAnim:draw(v[1]*3,v[2]*3)
			end
			for i,v in ipairs(self.palms) do
				self.palmAnim:draw(v[1]*3,v[2]*3)
			end
			for i,v in ipairs(self.grans) do
				self.granAnim:draw(v[1]*3,v[2]*3)
			end
			for i,v in ipairs(self.hoshis) do
				self.hoshiAnim:draw(v[1]*3,v[2]*3)
			end
			self.sukiAnim:draw(474*3, 6*3, true)
			self.lolshroomAnim:draw(140*3, 337*3)
			for i,v in ipairs(self.thoshis) do
				self.thoshiAnim:draw((v[1]+6)*3,(v[2]-4)*3)
			end
			for i,v in ipairs(self.wavesLOL) do
				self.wavesAnim:draw(v[1]*3,v[2]*3)
			end
			self.windowAnim:draw(266*3, 31*3, true)
		love.graphics.pop()
		c:draw()
		love.graphics.push()
			if smallMode then
				love.graphics.scale(scaleFactor,scaleFactor)
			end
			love.graphics.translate(-retPos(self.x),-retPos(self.y))
			self:drawNodes()
			
			
		love.graphics.pop()
		
	end

	function map:getCPos()
		return self.cposx,self.cposy
	end


	local function drawConnections(node)
		for i=1,#node.connect do
			local othernode = node.connect[i]
			--love.graphics.line(node.x - 10,node.y, othernode.x + 10, othernode.y)
			awesomeLine(node.x - 10,node.y, othernode.x + 10, othernode.y)
		end
	end

	function map:drawNodes()
		local x,y
		--[[for i=1,#self.nodes do
			local node = self.nodes[i]
			drawConnections(node)
		end]]
		love.graphics.draw(self.points,0,0)
		
		for i=1,#self.nodes do
			local node = self.nodes[i]
			
			if node.n == self.pos then
				x = node.x - 32
				y = node.y - 32
				love.graphics.draw(self.nodegreen,x,y,0,2)
				--self.butt.x = x + 250
				--self.butt.y = y - 10
				self.butt.x = width - self.butt.w/2 - 10 --+self.x
				self.butt.y = height - self.butt.h/2 - 10 --+self.y
			else
				if node.youShallNotPass then
					love.graphics.draw(self.nodered,node.x - 32,node.y - 32,0,2)
				else
					if node.coin then
						love.graphics.draw(self.nodeyellow,node.x - 32,node.y - 32,0,2)
					else
						love.graphics.draw(self.nodeblue,node.x - 32,node.y - 32,0,2)
					end
				end
			end
			
		end
		self:drawMapHero()
		--self.butt:draw()
		--love.graphics.line(x+32,y+32,self.butt.x - self.butt.w/2,self.butt.y + self.butt.h/2)
	end

	local function findPath(n1,n2,ns,allns) --TODO fixa för fan
		for i=1,#n1.connect do
			local node = n1.connect[i]
			if node == n2 and not node.youShallNotPass then
				return ns
			end
			if not node.youShallNotPass then 
				local ok = true
				for j=1,#ns do
					if ns[j] == node then
						ok = false
					end
				end
				if ok then
					local ns2 = {}
					for j=1,#ns do
						ns2[j] = ns[j]
					end
					table.insert(ns2,n1)
					local r = findPath(node,n2,ns2,allns)
					if r then
						return r
					end
				end
			end
		end
	end

	local function cloneAdd(list,node)
		local res = {}
		for i=1,#list do
			res[i] = list[i]
		end
		res[#res+1] = node
		return res
	end

	local function contains(list,node)
		for i=1,#list do
			if list[i] == node then
				return true
			end
		end
		return false
	end

	local function generatePath(n1,n2,path)
		local path = cloneAdd(path,n1)
		for i=1,#n1.connect do
			local target = n1.connect[i]
			if target == n2 and not target.youShallNotPass then
				return cloneAdd(path,target)
			end
		end
		--okej, vi är inte omedelbart bredvid målet

		for i=#n1.connect,1,-1 do
			local target = n1.connect[i]
			--kolla om target är en plats vi tidigare varit på
			if (not target.youShallNotPass) and (not contains(path,target)) then
				local res = generatePath(target,n2,path)
				if res then
					return res
				end
			end 
		end
	end


	function map:click()
		local x,y = love.mouse.getPosition()
		x = x/scaleFactor
		y = y/scaleFactor
		x = x + retPos(self.x)
		y = y + retPos(self.y)
		local bestPos = 1
		local bestDist = 90000
		for i=1,#self.nodes do
			local node=self.nodes[i]
			local dist = math.pow(x - node.x,2)+math.pow(y - node.y,2)
			if dist < bestDist then
				bestDist = dist
				bestPos = node.n
			end
		end
		if bestDist > 10000 then
			return
		end
		
		local node = self.nodes[bestPos]
		if node == self.nodes[self.pos] then
			return
		end
		local path = generatePath(self.nodes[self.pos],node,{})
		if path then
			--local path = findPath(self.nodes[self.pos],node,{},{}) --TODO
		
			self.path = path
			self.pathn = 1
			
			table.insert(path,1,self.nodes[self.pos]) --fulhack men det hjälper lite, han går först rakt dit han var på väg, och sedan följer han
			
			--printPath(path)
			
			self.cgoalx = self.path[self.pathn].x
			self.cgoaly = self.path[self.pathn].y
			
			state:setNM(node.n)
		end
	end

	function map:updatePos()
		local node = self.nodes[self.pos]
		local cx = node.x
		local cy = node.y
		self.nx = cx - self.w/2
		self.ny = cy - self.h/2
		if self.nx < 0 then
			self.nx = 0
		end
		if self.ny < 0 then
			self.ny = 0
		end
	end

	function map:update(dt)
		self.cactusAnim:stdUpdate(dt)
		self.caveAnim:stdUpdate(dt)
		self.palmAnim:stdUpdate(dt)
		self.granAnim:stdUpdate(dt)
		self.hoshiAnim:stdUpdate(dt)
		self.thoshiAnim:stdUpdate(dt)
		self.windowAnim:stdUpdate(dt)
		self.wavesAnim:stdUpdate(dt)
		self.sukiAnim:stdUpdate(2*dt)
		self.testAnim:update(dt,0.15)
		self.lolshroomAnim:stdUpdate(dt)
		self.trees:update(dt,0.25)
		self.maphero:stdUpdate(4*dt)
		self.butt:setS(self.s)
		local newx = self.x + dt*(-self.x + self.nx)
		local newy = self.y + dt*(-self.y + self.ny)
		if newx > self.minx and newx < self.maxx then
			self.x = newx
		end
		if newy > self.miny and newy < self.maxy then
			self.y = newy
		end
		
		--från cpos till cgoal
		local dir = math.atan2(self.cgoaly-self.cposy,self.cgoalx-self.cposx)
		
		
		if math.pow(self.cposx-self.cgoalx,2) + math.pow(self.cposy-self.cgoaly,2) < 50 then

			self.pathn = self.pathn + 1
			if self.path[self.pathn] then
				self.cgoalx = self.path[self.pathn].x
				self.cgoaly = self.path[self.pathn].y
			end
		else
			
			self.maphero.mirror = (math.abs(dir)<math.pi/2)
			self.cposx = self.cposx + dt*200*math.cos(dir)
			self.cposy = self.cposy + dt*200*math.sin(dir)
		end
		
		if self.firstUpdate and (lolNecoDirection ~= nil) then
			self.maphero.mirror = lolNecoDirection
			
		end
		
		self.firstUpdate = false
	end

	function map:setS(s)
		self.s = s
	end
end

loadmap()