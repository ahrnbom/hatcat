local function lol(gfx)
local items = newItemList()
items:add(newEItem('spawn',16,14,gfx))
items:add(newEItem('goal',47,9,gfx))
items:add(newEItem('spikes',27,16,gfx))
items:add(newEItem('spikes',25,16,gfx))
items:add(newEItem('spikes',24,16,gfx))
items:add(newEItem('spikes',28,16,gfx))
items:add(newEItem('button',18,15,gfx))
items:add(newEItem('buttblock',23,15,gfx))
items:add(newEItem('score',33,15,gfx))
items:add(newEItem('buttblock',31,15,gfx))
items:add(newEItem('score',35,13,gfx))
local decs = {}
decs[1] = {1, 26, 16}
decs[2] = {1, 27, 16}
decs[3] = {1, 28, 16}
decs[4] = {1, 29, 16}
decs[5] = {1, 25, 16}
decs[6] = {1, 24, 16}
local nmys = {}
nmys[1] = {6, 16, 18}
nmys[2] = {6, 17, 18}
nmys[3] = {6, 18, 18}
nmys[4] = {6, 19, 18}
nmys[5] = {6, 20, 18}
nmys[6] = {6, 21, 18}
nmys[7] = {6, 22, 18}
nmys[8] = {1, 31, 15}
nmys[9] = {1, 32, 15}
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
lvl[12][21] = 1
lvl[12][22] = 4
lvl[12][23] = 7
lvl[13] = {}
lvl[13][21] = 2
lvl[13][22] = 5
lvl[13][23] = 8
lvl[14] = {}
lvl[14][15] = 1
lvl[14][16] = 4
lvl[14][17] = 7
lvl[14][21] = 2
lvl[14][22] = 5
lvl[14][23] = 8
lvl[15] = {}
lvl[15][15] = 2
lvl[15][16] = 5
lvl[15][17] = 8
lvl[15][21] = 2
lvl[15][22] = 5
lvl[15][23] = 8
lvl[16] = {}
lvl[16][15] = 2
lvl[16][16] = 5
lvl[16][17] = 8
lvl[16][21] = 2
lvl[16][22] = 5
lvl[16][23] = 8
lvl[17] = {}
lvl[17][15] = 2
lvl[17][16] = 5
lvl[17][17] = 8
lvl[17][21] = 2
lvl[17][22] = 5
lvl[17][23] = 8
lvl[18] = {}
lvl[18][15] = 2
lvl[18][16] = 5
lvl[18][17] = 8
lvl[18][21] = 3
lvl[18][22] = 6
lvl[18][23] = 9
lvl[19] = {}
lvl[19][15] = 2
lvl[19][16] = 5
lvl[19][17] = 8
lvl[20] = {}
lvl[20][15] = 2
lvl[20][16] = 5
lvl[20][17] = 8
lvl[21] = {}
lvl[21][15] = 2
lvl[21][16] = 5
lvl[21][17] = 8
lvl[22] = {}
lvl[22][15] = 2
lvl[22][16] = 5
lvl[22][17] = 48
lvl[22][18] = 7
lvl[23] = {}
lvl[23][15] = 2
lvl[23][16] = 5
lvl[23][17] = 5
lvl[23][18] = 8
lvl[24] = {}
lvl[24][15] = 3
lvl[24][16] = 62
lvl[24][17] = 5
lvl[24][18] = 8
lvl[25] = {}
lvl[25][16] = 2
lvl[25][17] = 5
lvl[25][18] = 8
lvl[26] = {}
lvl[26][16] = 2
lvl[26][17] = 5
lvl[26][18] = 8
lvl[27] = {}
lvl[27][16] = 2
lvl[27][17] = 5
lvl[27][18] = 8
lvl[28] = {}
lvl[28][16] = 2
lvl[28][17] = 5
lvl[28][18] = 8
lvl[29] = {}
lvl[29][15] = 1
lvl[29][16] = 42
lvl[29][17] = 5
lvl[29][18] = 8
lvl[30] = {}
lvl[30][15] = 2
lvl[30][16] = 5
lvl[30][17] = 5
lvl[30][18] = 8
lvl[31] = {}
lvl[31][15] = 2
lvl[31][16] = 5
lvl[31][17] = 5
lvl[31][18] = 8
lvl[32] = {}
lvl[32][15] = 2
lvl[32][16] = 5
lvl[32][17] = 68
lvl[32][18] = 9
lvl[33] = {}
lvl[33][15] = 2
lvl[33][16] = 5
lvl[33][17] = 8
lvl[34] = {}
lvl[34][13] = 1
lvl[34][14] = 4
lvl[34][15] = 42
lvl[34][16] = 5
lvl[34][17] = 8
lvl[35] = {}
lvl[35][13] = 2
lvl[35][14] = 5
lvl[35][15] = 5
lvl[35][16] = 5
lvl[35][17] = 8
lvl[36] = {}
lvl[36][13] = 3
lvl[36][14] = 6
lvl[36][15] = 6
lvl[36][16] = 6
lvl[36][17] = 9
lvl[37] = {}
lvl[38] = {}
lvl[39] = {}
lvl[40] = {}
lvl[41] = {}
lvl[42] = {}
lvl[43] = {}
lvl[44] = {}
lvl[44][6] = 1
lvl[44][7] = 14
lvl[44][8] = 4
lvl[44][9] = 4
lvl[44][10] = 4
lvl[44][11] = 7
lvl[45] = {}
lvl[45][6] = 2
lvl[45][7] = 5
lvl[45][8] = 5
lvl[45][9] = 5
lvl[45][10] = 5
lvl[45][11] = 8
lvl[46] = {}
lvl[46][6] = 32
lvl[46][7] = 5
lvl[46][8] = 68
lvl[46][9] = 26
lvl[46][10] = 5
lvl[46][11] = 98
lvl[47] = {}
lvl[47][6] = 32
lvl[47][7] = 5
lvl[47][8] = 98
lvl[47][9] = 32
lvl[47][10] = 5
lvl[47][11] = 98
lvl[48] = {}
lvl[48][6] = 32
lvl[48][7] = 5
lvl[48][8] = 98
lvl[48][9] = 32
lvl[48][10] = 5
lvl[48][11] = 98
lvl[49] = {}
lvl[49][6] = 32
lvl[49][7] = 5
lvl[49][8] = 48
lvl[49][9] = 24
lvl[49][10] = 5
lvl[49][11] = 98
lvl[50] = {}
lvl[50][6] = 32
lvl[50][7] = 5
lvl[50][8] = 5
lvl[50][9] = 5
lvl[50][10] = 5
lvl[50][11] = 98
lvl[51] = {}
lvl[51][6] = 3
lvl[51][7] = 6
lvl[51][8] = 6
lvl[51][9] = 6
lvl[51][10] = 6
lvl[51][11] = 9
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