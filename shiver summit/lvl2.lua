local function lol(gfx)
local items = newItemList()
items:add(newEItem('spawn',9,9,gfx))
items:add(newEItem('goal',19,7,gfx))
items:add(newEItem('iceblock',17,11,gfx))
items:add(newEItem('iceblock',18,11,gfx))
items:add(newEItem('iceblock',19,11,gfx))
items:add(newEItem('iceblock',20,11,gfx))
items:add(newEItem('iceblock',21,11,gfx))
items:add(newEItem('iceblock',22,11,gfx))
items:add(newEItem('iceblock',23,11,gfx))
items:add(newEItem('iceblock',24,11,gfx))
items:add(newEItem('iceblock',25,11,gfx))
items:add(newEItem('iceblock',26,11,gfx))
items:add(newEItem('iceblock',27,11,gfx))
items:add(newEItem('iceblock',28,11,gfx))
items:add(newEItem('button',22,15,gfx))
items:add(newEItem('score',26,10,gfx))
items:add(newEItem('buttblock',30,5,gfx))
items:add(newEItem('buttblock',31,5,gfx))
items:add(newEItem('buttblock',32,5,gfx))
items:add(newEItem('score',31,4,gfx))
items:add(newEItem('buttblock',31,6,gfx))
items:add(newEItem('buttblock',30,6,gfx))
items:add(newEItem('buttblock',30,7,gfx))
local decs = {}
local nmys = {}
nmys[1] = {1, 23, 5}
local lvl = {}
lvl[1] = {}
lvl[2] = {}
lvl[3] = {}
lvl[4] = {}
lvl[5] = {}
lvl[6] = {}
lvl[7] = {}
lvl[7][10] = 1
lvl[7][11] = 4
lvl[7][12] = 7
lvl[8] = {}
lvl[8][10] = 2
lvl[8][11] = 5
lvl[8][12] = 8
lvl[9] = {}
lvl[9][10] = 2
lvl[9][11] = 5
lvl[9][12] = 8
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
lvl[15][7] = 1
lvl[15][8] = 4
lvl[15][9] = 4
lvl[15][10] = 42
lvl[15][11] = 5
lvl[15][12] = 8
lvl[16] = {}
lvl[16][7] = 2
lvl[16][8] = 5
lvl[16][9] = 5
lvl[16][10] = 5
lvl[16][11] = 5
lvl[16][12] = 8
lvl[17] = {}
lvl[17][7] = 2
lvl[17][8] = 5
lvl[17][9] = 68
lvl[17][10] = 6
lvl[17][11] = 6
lvl[17][12] = 9
lvl[18] = {}
lvl[18][7] = 2
lvl[18][8] = 5
lvl[18][9] = 8
lvl[19] = {}
lvl[19][7] = 2
lvl[19][8] = 5
lvl[19][9] = 8
lvl[20] = {}
lvl[20][7] = 2
lvl[20][8] = 5
lvl[20][9] = 8
lvl[20][14] = 1
lvl[20][15] = 4
lvl[20][16] = 74
lvl[20][17] = 7
lvl[21] = {}
lvl[21][7] = 2
lvl[21][8] = 5
lvl[21][9] = 8
lvl[21][14] = 2
lvl[21][15] = 5
lvl[21][16] = 5
lvl[21][17] = 78
lvl[22] = {}
lvl[22][4] = 1
lvl[22][5] = 4
lvl[22][6] = 4
lvl[22][7] = 42
lvl[22][8] = 5
lvl[22][9] = 8
lvl[22][14] = 3
lvl[22][15] = 62
lvl[22][16] = 5
lvl[22][17] = 8
lvl[23] = {}
lvl[23][4] = 2
lvl[23][5] = 5
lvl[23][6] = 5
lvl[23][7] = 5
lvl[23][8] = 5
lvl[23][9] = 8
lvl[23][15] = 2
lvl[23][16] = 5
lvl[23][17] = 8
lvl[24] = {}
lvl[24][4] = 2
lvl[24][5] = 5
lvl[24][6] = 68
lvl[24][7] = 6
lvl[24][8] = 6
lvl[24][9] = 9
lvl[24][14] = 1
lvl[24][15] = 42
lvl[24][16] = 5
lvl[24][17] = 8
lvl[25] = {}
lvl[25][4] = 2
lvl[25][5] = 5
lvl[25][6] = 8
lvl[25][14] = 2
lvl[25][15] = 5
lvl[25][16] = 5
lvl[25][17] = 98
lvl[26] = {}
lvl[26][4] = 2
lvl[26][5] = 5
lvl[26][6] = 8
lvl[26][14] = 3
lvl[26][15] = 6
lvl[26][16] = 96
lvl[26][17] = 9
lvl[27] = {}
lvl[27][4] = 2
lvl[27][5] = 5
lvl[27][6] = 8
lvl[28] = {}
lvl[28][4] = 2
lvl[28][5] = 5
lvl[28][6] = 48
lvl[28][7] = 4
lvl[28][8] = 74
lvl[28][9] = 74
lvl[28][10] = 74
lvl[28][11] = 74
lvl[28][12] = 7
lvl[29] = {}
lvl[29][4] = 2
lvl[29][5] = 5
lvl[29][6] = 5
lvl[29][7] = 5
lvl[29][8] = 5
lvl[29][9] = 5
lvl[29][10] = 5
lvl[29][11] = 5
lvl[29][12] = 8
lvl[30] = {}
lvl[30][4] = 3
lvl[30][5] = 6
lvl[30][6] = 6
lvl[30][7] = 6
lvl[30][8] = 96
lvl[30][9] = 96
lvl[30][10] = 6
lvl[30][11] = 6
lvl[30][12] = 9
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