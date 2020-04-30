local function test()
	local len = math.random(20)
	local alphabet = 'abcdefghijklmnopqrstuvwxyz-0123456789'
	local al = #alphabet
	local s = ''
	for i = 1,len do
		local ran = math.random(al)
		s = s .. alphabet:sub(ran,ran) -- ruu!
	end
	
	local numbers = '0123456789'
	local nl = #numbers
	
	for i = 1,2 do
		local ran = math.random(nl)
		s = s .. numbers:sub(ran, ran) -- ruu!
	end
	
	return s
end
math.randomseed(os.time())

for i = 1,100 do
	local str = test()
	local res = importsave(str)
	if res then
		local str2 = exportsaves()
		if str ~= str2 then
			print(str)
			print(str2)
		end
	end
end