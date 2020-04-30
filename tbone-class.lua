-- This software is released under the MIT License. See LICENSE.txt for details.

--T-Bone Class version 0.2

local class = {}
class.__index=class
class._bobbyTables={}
function class:init() end
function class:_init() self:init() end

function class:newInstance()
	local o = {}
	setmetatable(o,self)
	if self._bobbyTables then
		for i=1,#self._bobbyTables do
			o[self._bobbyTables[i]]={}
		end
	end
	
	o:_init()
	
	return o
end

function newClass(tables)
	local o = {}
	setmetatable(o,class)
	o.__index=o
	o._bobbyTables=tables
	return o
end

function class:addTable(tab)
	table.insert(self._bobbyTables,tab)
	
end

function class:newSubClass(tables)
	local o = {}
	setmetatable(o,self)
	o.__index=o
	if tables then
		if not o._bobbyTables then
			o._bobbyTables=tables 
		else
			local a = #o._bobbyTables 
			for i = a,a + #tables do
				o._bobbyTables[i]=tables[i-a]
			end
		end
	end
	return o
end

function newSubClass(mother,tables)
	return mother:newSubClass(tables)
end
