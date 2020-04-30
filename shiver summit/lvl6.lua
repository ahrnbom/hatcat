local function lol(gfx)
local items = newItemList()
items:add(newEItem('iceblock',6,11,gfx))
items:add(newEItem('iceblock',7,11,gfx))
items:add(newEItem('iceblock',8,11,gfx))
items:add(newEItem('spawn',7,9,gfx))
items:add(newEItem('iceblock',9,11,gfx))
items:add(newEItem('goal',12,10,gfx))
items:add(newEItem('score',4,14,gfx))
items:add(newEItem('iceblock',14,16,gfx))
items:add(newEItem('iceblock',15,16,gfx))
items:add(newEItem('iceblock',16,16,gfx))
items:add(newEItem('iceblock',17,16,gfx))
items:add(newEItem('iceblock',18,16,gfx))
items:add(newEItem('iceblock',14,17,gfx))
items:add(newEItem('iceblock',15,17,gfx))
items:add(newEItem('iceblock',16,17,gfx))
items:add(newEItem('iceblock',17,17,gfx))
items:add(newEItem('iceblock',18,17,gfx))
items:add(newEItem('score',27,13,gfx))
local decs = {}
decs[1] = {1, 10, 10}
local nmys = {}
nmys[1] = {1, 6, 10}
local lvl = {}
lvl[1] = {}
lvl[1][14] = 1
lvl[1][15] = 4
lvl[1][16] = 74
lvl[1][17] = 74
lvl[1][18] = 74
lvl[1][19] = 7
lvl[2] = {}
lvl[2][14] = 2
lvl[2][15] = 5
lvl[2][16] = 5
lvl[2][17] = 5
lvl[2][18] = 5
lvl[2][19] = 78
lvl[3] = {}
lvl[3][14] = 2
lvl[3][15] = 5
lvl[3][16] = 5
lvl[3][17] = 5
lvl[3][18] = 5
lvl[3][19] = 78
lvl[4] = {}
lvl[4][14] = 2
lvl[4][15] = 5
lvl[4][16] = 5
lvl[4][17] = 5
lvl[4][18] = 5
lvl[4][19] = 78
lvl[5] = {}
lvl[5][14] = 2
lvl[5][15] = 5
lvl[5][16] = 5
lvl[5][17] = 5
lvl[5][18] = 5
lvl[5][19] = 78
lvl[6] = {}
lvl[6][14] = 2
lvl[6][15] = 5
lvl[6][16] = 5
lvl[6][17] = 5
lvl[6][18] = 5
lvl[6][19] = 8
lvl[7] = {}
lvl[7][14] = 3
lvl[7][15] = 6
lvl[7][16] = 96
lvl[7][17] = 96
lvl[7][18] = 96
lvl[7][19] = 9
lvl[8] = {}
lvl[9] = {}
lvl[9][10] = 1
lvl[9][11] = 4
lvl[9][12] = 7
lvl[10] = {}
lvl[10][10] = 2
lvl[10][11] = 5
lvl[10][12] = 8
lvl[11] = {}
lvl[11][10] = 2
lvl[11][11] = 5
lvl[11][12] = 8
lvl[12] = {}
lvl[12][10] = 2
lvl[12][11] = 5
lvl[12][12] = 8
lvl[13] = {}
lvl[13][10] = 2
lvl[13][11] = 5
lvl[13][12] = 8
lvl[14] = {}
lvl[14][10] = 2
lvl[14][11] = 5
lvl[14][12] = 8
lvl[15] = {}
lvl[15][10] = 3
lvl[15][11] = 6
lvl[15][12] = 9
lvl[16] = {}
lvl[17] = {}
lvl[18] = {}
lvl[19] = {}
lvl[20] = {}
lvl[21] = {}
lvl[22] = {}
lvl[23] = {}
lvl[23][12] = 1
lvl[23][13] = 4
lvl[23][14] = 74
lvl[23][15] = 7
lvl[24] = {}
lvl[24][12] = 2
lvl[24][13] = 5
lvl[24][14] = 5
lvl[24][15] = 78
lvl[25] = {}
lvl[25][12] = 3
lvl[25][13] = 62
lvl[25][14] = 5
lvl[25][15] = 8
lvl[26] = {}
lvl[26][13] = 2
lvl[26][14] = 5
lvl[26][15] = 8
lvl[27] = {}
lvl[27][13] = 2
lvl[27][14] = 5
lvl[27][15] = 8
lvl[28] = {}
lvl[28][13] = 2
lvl[28][14] = 5
lvl[28][15] = 8
lvl[29] = {}
lvl[29][12] = 1
lvl[29][13] = 42
lvl[29][14] = 5
lvl[29][15] = 8
lvl[30] = {}
lvl[30][12] = 2
lvl[30][13] = 5
lvl[30][14] = 5
lvl[30][15] = 98
lvl[31] = {}
lvl[31][12] = 3
lvl[31][13] = 6
lvl[31][14] = 96
lvl[31][15] = 9
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