local function lol(gfx)
local items = newItemList()
items:add(newEItem('spawn',9,7,gfx))
items:add(newEItem('goal',12,13,gfx))
items:add(newEItem('iceblock',17,9,gfx))
items:add(newEItem('iceblock',18,9,gfx))
items:add(newEItem('iceblock',19,9,gfx))
items:add(newEItem('iceblock',19,12,gfx))
items:add(newEItem('iceblock',20,12,gfx))
items:add(newEItem('iceblock',21,12,gfx))
items:add(newEItem('iceblock',21,6,gfx))
items:add(newEItem('iceblock',22,6,gfx))
items:add(newEItem('iceblock',23,6,gfx))
items:add(newEItem('iceblock',22,15,gfx))
items:add(newEItem('iceblock',23,15,gfx))
items:add(newEItem('iceblock',24,15,gfx))
items:add(newEItem('iceblock',17,16,gfx))
items:add(newEItem('iceblock',18,16,gfx))
items:add(newEItem('iceblock',19,16,gfx))
items:add(newEItem('score',22,5,gfx))
items:add(newEItem('score',20,11,gfx))
items:add(newEItem('score',23,14,gfx))
items:add(newEItem('score',18,15,gfx))
local decs = {}
local nmys = {}
nmys[1] = {1, 16, 9}
nmys[2] = {1, 19, 12}
nmys[3] = {1, 21, 6}
nmys[4] = {1, 22, 15}
nmys[5] = {1, 17, 16}
local lvl = {}
lvl[1] = {}
lvl[2] = {}
lvl[3] = {}
lvl[4] = {}
lvl[5] = {}
lvl[6] = {}
lvl[7] = {}
lvl[7][8] = 1
lvl[7][9] = 4
lvl[7][10] = 7
lvl[8] = {}
lvl[8][8] = 2
lvl[8][9] = 5
lvl[8][10] = 8
lvl[9] = {}
lvl[9][8] = 2
lvl[9][9] = 5
lvl[9][10] = 8
lvl[9][13] = 1
lvl[9][14] = 4
lvl[9][15] = 74
lvl[9][16] = 74
lvl[9][17] = 7
lvl[10] = {}
lvl[10][8] = 2
lvl[10][9] = 5
lvl[10][10] = 8
lvl[10][13] = 2
lvl[10][14] = 5
lvl[10][15] = 5
lvl[10][16] = 5
lvl[10][17] = 8
lvl[11] = {}
lvl[11][8] = 2
lvl[11][9] = 5
lvl[11][10] = 8
lvl[11][13] = 2
lvl[11][14] = 5
lvl[11][15] = 5
lvl[11][16] = 5
lvl[11][17] = 98
lvl[12] = {}
lvl[12][8] = 2
lvl[12][9] = 5
lvl[12][10] = 8
lvl[12][13] = 2
lvl[12][14] = 5
lvl[12][15] = 5
lvl[12][16] = 5
lvl[12][17] = 98
lvl[13] = {}
lvl[13][8] = 2
lvl[13][9] = 5
lvl[13][10] = 8
lvl[13][13] = 2
lvl[13][14] = 5
lvl[13][15] = 5
lvl[13][16] = 5
lvl[13][17] = 98
lvl[14] = {}
lvl[14][8] = 2
lvl[14][9] = 5
lvl[14][10] = 8
lvl[14][13] = 2
lvl[14][14] = 5
lvl[14][15] = 5
lvl[14][16] = 5
lvl[14][17] = 98
lvl[15] = {}
lvl[15][8] = 2
lvl[15][9] = 5
lvl[15][10] = 8
lvl[15][13] = 3
lvl[15][14] = 6
lvl[15][15] = 6
lvl[15][16] = 6
lvl[15][17] = 9
lvl[16] = {}
lvl[16][8] = 2
lvl[16][9] = 5
lvl[16][10] = 8
lvl[17] = {}
lvl[17][8] = 3
lvl[17][9] = 6
lvl[17][10] = 9
lvl[18] = {}
lvl[19] = {}
lvl[20] = {}
lvl[21] = {}
lvl[22] = {}
lvl[23] = {}
lvl[24] = {}
lvl[25] = {}
lvl[26] = {}
lvl[27] = {}
lvl[28] = {}
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