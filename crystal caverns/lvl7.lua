local function lol(gfx)
local items = newItemList()
items:add(newEItem('spikes',12,15,gfx))
items:add(newEItem('spikes',14,15,gfx))
items:add(newEItem('spikes',15,15,gfx))
items:add(newEItem('spikes',17,15,gfx))
items:add(newEItem('spikes',19,15,gfx))
items:add(newEItem('spikes',21,15,gfx))
items:add(newEItem('spikes',23,15,gfx))
items:add(newEItem('spikes',25,15,gfx))
items:add(newEItem('buttblock',26,14,gfx))
items:add(newEItem('spawn',14,10,gfx))
items:add(newEItem('buttblock',18,7,gfx))
items:add(newEItem('buttblock',19,7,gfx))
items:add(newEItem('buttblock',20,7,gfx))
items:add(newEItem('buttblock',21,7,gfx))
items:add(newEItem('score',20,8,gfx))
items:add(newEItem('button',14,6,gfx))
items:add(newEItem('buttblock',23,9,gfx))
items:add(newEItem('buttblock',24,9,gfx))
items:add(newEItem('buttblock',25,9,gfx))
items:add(newEItem('score',20,6,gfx))
items:add(newEItem('buttblock',22,9,gfx))
items:add(newEItem('score',24,8,gfx))
items:add(newEItem('score',24,6,gfx))
items:add(newEItem('score',29,21,gfx))
items:add(newEItem('goal',32,15,gfx))
items:add(newEItem('spikes',23,22,gfx))
items:add(newEItem('spikes',25,22,gfx))
items:add(newEItem('spikes',32,22,gfx))
items:add(newEItem('spikes',31,22,gfx))
items:add(newEItem('spikes',33,22,gfx))
items:add(newEItem('buttblock',13,14,gfx))
local decs = {}
decs[1] = {1, 13, 15}
decs[2] = {1, 14, 15}
decs[3] = {1, 15, 15}
decs[4] = {1, 16, 15}
decs[5] = {1, 17, 15}
decs[6] = {1, 18, 15}
decs[7] = {1, 19, 15}
decs[8] = {1, 20, 15}
decs[9] = {1, 21, 15}
decs[10] = {1, 22, 15}
decs[11] = {1, 23, 15}
decs[12] = {1, 24, 15}
decs[13] = {1, 25, 15}
decs[14] = {1, 26, 15}
decs[15] = {1, 32, 22}
decs[16] = {1, 33, 22}
decs[17] = {1, 34, 22}
decs[18] = {1, 24, 22}
decs[19] = {1, 25, 22}
decs[20] = {1, 26, 22}
local nmys = {}
nmys[1] = {6, 13, 9}
nmys[2] = {6, 14, 9}
nmys[3] = {6, 15, 9}
nmys[4] = {6, 16, 9}
nmys[5] = {6, 17, 9}
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
lvl[11][6] = 1
lvl[11][7] = 4
lvl[11][8] = 7
lvl[11][13] = 1
lvl[11][14] = 4
lvl[11][15] = 74
lvl[11][16] = 74
lvl[11][17] = 7
lvl[12] = {}
lvl[12][6] = 2
lvl[12][7] = 5
lvl[12][8] = 8
lvl[12][13] = 2
lvl[12][14] = 5
lvl[12][15] = 5
lvl[12][16] = 5
lvl[12][17] = 8
lvl[13] = {}
lvl[13][6] = 2
lvl[13][7] = 5
lvl[13][8] = 8
lvl[13][13] = 3
lvl[13][14] = 6
lvl[13][15] = 62
lvl[13][16] = 5
lvl[13][17] = 8
lvl[14] = {}
lvl[14][6] = 2
lvl[14][7] = 5
lvl[14][8] = 8
lvl[14][15] = 2
lvl[14][16] = 5
lvl[14][17] = 8
lvl[14][22] = 1
lvl[14][23] = 4
lvl[14][24] = 7
lvl[15] = {}
lvl[15][6] = 2
lvl[15][7] = 5
lvl[15][8] = 8
lvl[15][15] = 2
lvl[15][16] = 5
lvl[15][17] = 8
lvl[15][22] = 2
lvl[15][23] = 5
lvl[15][24] = 8
lvl[16] = {}
lvl[16][6] = 2
lvl[16][7] = 5
lvl[16][8] = 8
lvl[16][15] = 2
lvl[16][16] = 5
lvl[16][17] = 8
lvl[16][20] = 1
lvl[16][21] = 4
lvl[16][22] = 42
lvl[16][23] = 5
lvl[16][24] = 8
lvl[17] = {}
lvl[17][6] = 2
lvl[17][7] = 5
lvl[17][8] = 8
lvl[17][9] = 4
lvl[17][10] = 7
lvl[17][15] = 2
lvl[17][16] = 5
lvl[17][17] = 8
lvl[17][20] = 2
lvl[17][21] = 5
lvl[17][22] = 5
lvl[17][23] = 5
lvl[17][24] = 8
lvl[18] = {}
lvl[18][6] = 3
lvl[18][7] = 6
lvl[18][8] = 2
lvl[18][9] = 5
lvl[18][10] = 8
lvl[18][15] = 2
lvl[18][16] = 5
lvl[18][17] = 8
lvl[18][20] = 3
lvl[18][21] = 6
lvl[18][22] = 6
lvl[18][23] = 6
lvl[18][24] = 9
lvl[19] = {}
lvl[19][8] = 2
lvl[19][9] = 5
lvl[19][10] = 8
lvl[19][15] = 2
lvl[19][16] = 5
lvl[19][17] = 8
lvl[20] = {}
lvl[20][8] = 2
lvl[20][9] = 5
lvl[20][10] = 8
lvl[20][15] = 2
lvl[20][16] = 5
lvl[20][17] = 8
lvl[21] = {}
lvl[21][6] = 1
lvl[21][7] = 4
lvl[21][8] = 2
lvl[21][9] = 5
lvl[21][10] = 8
lvl[21][15] = 2
lvl[21][16] = 5
lvl[21][17] = 8
lvl[22] = {}
lvl[22][6] = 2
lvl[22][7] = 5
lvl[22][8] = 8
lvl[22][9] = 6
lvl[22][10] = 9
lvl[22][15] = 2
lvl[22][16] = 5
lvl[22][17] = 8
lvl[22][21] = 1
lvl[22][22] = 4
lvl[22][23] = 4
lvl[22][24] = 7
lvl[23] = {}
lvl[23][6] = 2
lvl[23][7] = 5
lvl[23][8] = 8
lvl[23][15] = 2
lvl[23][16] = 5
lvl[23][17] = 8
lvl[23][21] = 2
lvl[23][22] = 5
lvl[23][23] = 5
lvl[23][24] = 8
lvl[24] = {}
lvl[24][6] = 2
lvl[24][7] = 5
lvl[24][8] = 8
lvl[24][15] = 2
lvl[24][16] = 5
lvl[24][17] = 8
lvl[24][21] = 3
lvl[24][22] = 62
lvl[24][23] = 5
lvl[24][24] = 8
lvl[25] = {}
lvl[25][6] = 2
lvl[25][7] = 5
lvl[25][8] = 8
lvl[25][15] = 2
lvl[25][16] = 5
lvl[25][17] = 8
lvl[25][22] = 2
lvl[25][23] = 5
lvl[25][24] = 8
lvl[26] = {}
lvl[26][6] = 3
lvl[26][7] = 6
lvl[26][8] = 9
lvl[26][13] = 1
lvl[26][14] = 4
lvl[26][15] = 42
lvl[26][16] = 5
lvl[26][17] = 8
lvl[26][21] = 1
lvl[26][22] = 42
lvl[26][23] = 5
lvl[26][24] = 8
lvl[27] = {}
lvl[27][13] = 2
lvl[27][14] = 5
lvl[27][15] = 5
lvl[27][16] = 5
lvl[27][17] = 98
lvl[27][21] = 2
lvl[27][22] = 5
lvl[27][23] = 5
lvl[27][24] = 8
lvl[28] = {}
lvl[28][13] = 3
lvl[28][14] = 6
lvl[28][15] = 6
lvl[28][16] = 96
lvl[28][17] = 9
lvl[28][21] = 2
lvl[28][22] = 5
lvl[28][23] = 5
lvl[28][24] = 8
lvl[29] = {}
lvl[29][21] = 2
lvl[29][22] = 5
lvl[29][23] = 5
lvl[29][24] = 8
lvl[30] = {}
lvl[30][15] = 1
lvl[30][16] = 4
lvl[30][17] = 7
lvl[30][21] = 2
lvl[30][22] = 5
lvl[30][23] = 5
lvl[30][24] = 8
lvl[31] = {}
lvl[31][15] = 2
lvl[31][16] = 5
lvl[31][17] = 8
lvl[31][21] = 2
lvl[31][22] = 5
lvl[31][23] = 5
lvl[31][24] = 8
lvl[32] = {}
lvl[32][15] = 2
lvl[32][16] = 5
lvl[32][17] = 8
lvl[32][21] = 3
lvl[32][22] = 62
lvl[32][23] = 5
lvl[32][24] = 8
lvl[33] = {}
lvl[33][15] = 2
lvl[33][16] = 5
lvl[33][17] = 8
lvl[33][22] = 2
lvl[33][23] = 5
lvl[33][24] = 8
lvl[34] = {}
lvl[34][15] = 3
lvl[34][16] = 6
lvl[34][17] = 9
lvl[34][21] = 1
lvl[34][22] = 42
lvl[34][23] = 5
lvl[34][24] = 8
lvl[35] = {}
lvl[35][21] = 2
lvl[35][22] = 5
lvl[35][23] = 5
lvl[35][24] = 8
lvl[36] = {}
lvl[36][21] = 3
lvl[36][22] = 6
lvl[36][23] = 6
lvl[36][24] = 9
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