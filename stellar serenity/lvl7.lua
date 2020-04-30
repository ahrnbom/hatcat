local function lol(gfx)
local items = newItemList()
items:add(newEItem('iceblock',7,9,gfx))
items:add(newEItem('iceblock',8,9,gfx))
items:add(newEItem('iceblock',9,9,gfx))
items:add(newEItem('iceblock',10,9,gfx))
items:add(newEItem('iceblock',11,9,gfx))
items:add(newEItem('iceblock',12,9,gfx))
items:add(newEItem('iceblock',7,10,gfx))
items:add(newEItem('iceblock',8,10,gfx))
items:add(newEItem('iceblock',9,10,gfx))
items:add(newEItem('iceblock',10,10,gfx))
items:add(newEItem('iceblock',11,10,gfx))
items:add(newEItem('iceblock',12,10,gfx))
items:add(newEItem('iceblock',7,11,gfx))
items:add(newEItem('iceblock',8,11,gfx))
items:add(newEItem('iceblock',9,11,gfx))
items:add(newEItem('iceblock',10,11,gfx))
items:add(newEItem('iceblock',11,11,gfx))
items:add(newEItem('iceblock',12,11,gfx))
items:add(newEItem('break',6,8,gfx))
items:add(newEItem('break',13,8,gfx))
items:add(newEItem('break',18,8,gfx))
items:add(newEItem('break',13,9,gfx))
items:add(newEItem('break',6,9,gfx))
items:add(newEItem('spawn',9,8,gfx))
items:add(newEItem('score',20,8,gfx))
items:add(newEItem('button',15,14,gfx))
items:add(newEItem('break',28,8,gfx))
items:add(newEItem('score',26,8,gfx))
items:add(newEItem('goal',23,8,gfx))
items:add(newEItem('buttblock',22,8,gfx))
items:add(newEItem('buttblock',24,8,gfx))
local decs = {}
local nmys = {}
nmys[1] = {1, 7, 9}
nmys[2] = {1, 21, 9}
nmys[3] = {1, 25, 9}
local lvl = {}
lvl[1] = {}
lvl[2] = {}
lvl[3] = {}
lvl[4] = {}
lvl[5] = {}
lvl[6] = {}
lvl[7] = {}
lvl[8] = {}
lvl[9] = {}
lvl[10] = {}
lvl[11] = {}
lvl[12] = {}
lvl[13] = {}
lvl[13][13] = 1
lvl[13][14] = 14
lvl[13][15] = 4
lvl[13][16] = 7
lvl[14] = {}
lvl[14][13] = 2
lvl[14][14] = 5
lvl[14][15] = 5
lvl[14][16] = 78
lvl[15] = {}
lvl[15][13] = 3
lvl[15][14] = 26
lvl[15][15] = 5
lvl[15][16] = 8
lvl[16] = {}
lvl[16][14] = 32
lvl[16][15] = 5
lvl[16][16] = 98
lvl[17] = {}
lvl[17][13] = 1
lvl[17][14] = 32
lvl[17][15] = 5
lvl[17][16] = 98
lvl[18] = {}
lvl[18][7] = 1
lvl[18][8] = 4
lvl[18][9] = 74
lvl[18][10] = 7
lvl[18][13] = 2
lvl[18][14] = 5
lvl[18][15] = 5
lvl[18][16] = 98
lvl[19] = {}
lvl[19][7] = 2
lvl[19][8] = 5
lvl[19][9] = 5
lvl[19][10] = 78
lvl[19][13] = 3
lvl[19][14] = 36
lvl[19][15] = 6
lvl[19][16] = 9
lvl[20] = {}
lvl[20][7] = 3
lvl[20][8] = 26
lvl[20][9] = 5
lvl[20][10] = 8
lvl[21] = {}
lvl[21][8] = 32
lvl[21][9] = 5
lvl[21][10] = 98
lvl[22] = {}
lvl[22][8] = 32
lvl[22][9] = 5
lvl[22][10] = 98
lvl[23] = {}
lvl[23][8] = 32
lvl[23][9] = 5
lvl[23][10] = 98
lvl[24] = {}
lvl[24][8] = 2
lvl[24][9] = 5
lvl[24][10] = 98
lvl[25] = {}
lvl[25][8] = 2
lvl[25][9] = 5
lvl[25][10] = 8
lvl[26] = {}
lvl[26][7] = 1
lvl[26][8] = 24
lvl[26][9] = 5
lvl[26][10] = 8
lvl[27] = {}
lvl[27][7] = 2
lvl[27][8] = 5
lvl[27][9] = 5
lvl[27][10] = 8
lvl[28] = {}
lvl[28][7] = 3
lvl[28][8] = 36
lvl[28][9] = 6
lvl[28][10] = 9
lvl[29] = {}
lvl[30] = {}
lvl[31] = {}
lvl[32] = {}
lvl[33] = {}
lvl[34] = {}
lvl[35] = {}
lvl[36] = {}
lvl[37] = {}
lvl[38] = {}
lvl[39] = {}
lvl[40] = {}
lvl[41] = {}
lvl[42] = {}
lvl[43] = {}
lvl[44] = {}
lvl[45] = {}
lvl[46] = {}
lvl[47] = {}
lvl[48] = {}
lvl[49] = {}
lvl[50] = {}
lvl[51] = {}
lvl[52] = {}
lvl[53] = {}
lvl[54] = {}
lvl[55] = {}
lvl[56] = {}
lvl[57] = {}
lvl[58] = {}
lvl[59] = {}
lvl[60] = {}
lvl[61] = {}
lvl[62] = {}
lvl[63] = {}
lvl[64] = {}
lvl[65] = {}
lvl[66] = {}
lvl[67] = {}
lvl[68] = {}
lvl[69] = {}
lvl[70] = {}
lvl[71] = {}
lvl[72] = {}
lvl[73] = {}
lvl[74] = {}
lvl[75] = {}
lvl[76] = {}
lvl[77] = {}
lvl[78] = {}
lvl[79] = {}
lvl[80] = {}
lvl[81] = {}
lvl[82] = {}
lvl[83] = {}
lvl[84] = {}
lvl[85] = {}
lvl[86] = {}
lvl[87] = {}
lvl[88] = {}
lvl[89] = {}
lvl[90] = {}
lvl[91] = {}
lvl[92] = {}
lvl[93] = {}
lvl[94] = {}
lvl[95] = {}
lvl[96] = {}
lvl[97] = {}
lvl[98] = {}
lvl[99] = {}
lvl[100] = {}
return lvl,items,decs,nmys
end
return lol