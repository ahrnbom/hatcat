local function lol(gfx)
local items = newItemList()
items:add(newEItem('spikes',9,17,gfx))
items:add(newEItem('spikes',8,17,gfx))
items:add(newEItem('spikes',11,17,gfx))
items:add(newEItem('spikes',12,17,gfx))
items:add(newEItem('spikes',14,17,gfx))
items:add(newEItem('spawn',11,15,gfx))
items:add(newEItem('score',16,15,gfx))
items:add(newEItem('score',8,15,gfx))
items:add(newEItem('score',12,8,gfx))
items:add(newEItem('goal',12,23,gfx))
items:add(newEItem('spikes',13,24,gfx))
items:add(newEItem('spikes',14,24,gfx))
items:add(newEItem('spikes',16,24,gfx))
items:add(newEItem('spikes',17,24,gfx))
items:add(newEItem('spikes',5,24,gfx))
items:add(newEItem('spikes',6,24,gfx))
items:add(newEItem('spikes',8,24,gfx))
items:add(newEItem('spikes',9,24,gfx))
items:add(newEItem('button',11,8,gfx))
items:add(newEItem('buttblock',11,28,gfx))
items:add(newEItem('buttblock',12,28,gfx))
items:add(newEItem('buttblock',13,28,gfx))
items:add(newEItem('buttblock',12,5,gfx))
items:add(newEItem('buttblock',11,5,gfx))
items:add(newEItem('buttblock',13,5,gfx))
local decs = {}
decs[1] = {1, 9, 17}
decs[2] = {1, 10, 17}
decs[3] = {1, 11, 17}
decs[4] = {1, 12, 17}
decs[5] = {1, 13, 17}
decs[6] = {1, 14, 17}
decs[7] = {1, 15, 17}
decs[8] = {1, 6, 24}
decs[9] = {1, 7, 24}
decs[10] = {1, 8, 24}
decs[11] = {1, 9, 24}
decs[12] = {1, 10, 24}
decs[13] = {1, 14, 24}
decs[14] = {1, 15, 24}
decs[15] = {1, 16, 24}
decs[16] = {1, 17, 24}
decs[17] = {1, 18, 24}
local nmys = {}
nmys[1] = {6, 10, 11}
nmys[2] = {6, 11, 11}
nmys[3] = {6, 12, 11}
nmys[4] = {6, 13, 11}
nmys[5] = {6, 14, 11}
nmys[6] = {6, 15, 11}
nmys[7] = {6, 12, 7}
nmys[8] = {6, 13, 7}
local lvl = {}
lvl[1] = {}
lvl[1][27] = 1
lvl[1][28] = 4
lvl[1][29] = 7
lvl[2] = {}
lvl[2][27] = 2
lvl[2][28] = 5
lvl[2][29] = 8
lvl[3] = {}
lvl[3][27] = 2
lvl[3][28] = 5
lvl[3][29] = 8
lvl[4] = {}
lvl[4][22] = 1
lvl[4][23] = 4
lvl[4][24] = 4
lvl[4][25] = 4
lvl[4][26] = 7
lvl[4][27] = 2
lvl[4][28] = 5
lvl[4][29] = 8
lvl[5] = {}
lvl[5][22] = 2
lvl[5][23] = 5
lvl[5][24] = 5
lvl[5][25] = 5
lvl[5][26] = 8
lvl[5][27] = 2
lvl[5][28] = 5
lvl[5][29] = 8
lvl[6] = {}
lvl[6][22] = 3
lvl[6][23] = 6
lvl[6][24] = 62
lvl[6][25] = 5
lvl[6][26] = 8
lvl[6][27] = 2
lvl[6][28] = 5
lvl[6][29] = 8
lvl[7] = {}
lvl[7][15] = 1
lvl[7][16] = 4
lvl[7][17] = 4
lvl[7][18] = 4
lvl[7][19] = 7
lvl[7][24] = 2
lvl[7][25] = 5
lvl[7][26] = 8
lvl[7][27] = 2
lvl[7][28] = 5
lvl[7][29] = 8
lvl[8] = {}
lvl[8][8] = 1
lvl[8][9] = 4
lvl[8][10] = 7
lvl[8][15] = 2
lvl[8][16] = 5
lvl[8][17] = 5
lvl[8][18] = 5
lvl[8][19] = 8
lvl[8][24] = 2
lvl[8][25] = 5
lvl[8][26] = 8
lvl[8][27] = 2
lvl[8][28] = 5
lvl[8][29] = 8
lvl[9] = {}
lvl[9][8] = 2
lvl[9][9] = 5
lvl[9][10] = 8
lvl[9][15] = 3
lvl[9][16] = 6
lvl[9][17] = 62
lvl[9][18] = 5
lvl[9][19] = 8
lvl[9][24] = 2
lvl[9][25] = 5
lvl[9][26] = 8
lvl[9][27] = 2
lvl[9][28] = 5
lvl[9][29] = 8
lvl[10] = {}
lvl[10][8] = 2
lvl[10][9] = 5
lvl[10][10] = 8
lvl[10][17] = 2
lvl[10][18] = 5
lvl[10][19] = 8
lvl[10][23] = 1
lvl[10][24] = 42
lvl[10][25] = 5
lvl[10][26] = 8
lvl[10][27] = 2
lvl[10][28] = 5
lvl[10][29] = 8
lvl[11] = {}
lvl[11][8] = 2
lvl[11][9] = 5
lvl[11][10] = 8
lvl[11][17] = 2
lvl[11][18] = 5
lvl[11][19] = 8
lvl[11][23] = 2
lvl[11][24] = 5
lvl[11][25] = 5
lvl[11][26] = 8
lvl[11][27] = 3
lvl[11][28] = 6
lvl[11][29] = 9
lvl[12] = {}
lvl[12][8] = 2
lvl[12][9] = 5
lvl[12][10] = 8
lvl[12][17] = 2
lvl[12][18] = 5
lvl[12][19] = 8
lvl[12][23] = 2
lvl[12][24] = 5
lvl[12][25] = 5
lvl[12][26] = 8
lvl[13] = {}
lvl[13][8] = 2
lvl[13][9] = 5
lvl[13][10] = 8
lvl[13][17] = 2
lvl[13][18] = 5
lvl[13][19] = 8
lvl[13][23] = 2
lvl[13][24] = 5
lvl[13][25] = 5
lvl[13][26] = 8
lvl[13][27] = 1
lvl[13][28] = 4
lvl[13][29] = 7
lvl[14] = {}
lvl[14][8] = 2
lvl[14][9] = 5
lvl[14][10] = 8
lvl[14][17] = 2
lvl[14][18] = 5
lvl[14][19] = 8
lvl[14][23] = 3
lvl[14][24] = 62
lvl[14][25] = 5
lvl[14][26] = 8
lvl[14][27] = 2
lvl[14][28] = 5
lvl[14][29] = 8
lvl[15] = {}
lvl[15][8] = 2
lvl[15][9] = 5
lvl[15][10] = 8
lvl[15][15] = 1
lvl[15][16] = 4
lvl[15][17] = 42
lvl[15][18] = 5
lvl[15][19] = 8
lvl[15][24] = 2
lvl[15][25] = 5
lvl[15][26] = 8
lvl[15][27] = 2
lvl[15][28] = 5
lvl[15][29] = 8
lvl[16] = {}
lvl[16][8] = 3
lvl[16][9] = 6
lvl[16][10] = 9
lvl[16][15] = 2
lvl[16][16] = 5
lvl[16][17] = 5
lvl[16][18] = 5
lvl[16][19] = 8
lvl[16][24] = 2
lvl[16][25] = 5
lvl[16][26] = 8
lvl[16][27] = 2
lvl[16][28] = 5
lvl[16][29] = 8
lvl[17] = {}
lvl[17][15] = 3
lvl[17][16] = 6
lvl[17][17] = 6
lvl[17][18] = 6
lvl[17][19] = 9
lvl[17][24] = 2
lvl[17][25] = 5
lvl[17][26] = 8
lvl[17][27] = 2
lvl[17][28] = 5
lvl[17][29] = 8
lvl[18] = {}
lvl[18][22] = 1
lvl[18][23] = 14
lvl[18][24] = 42
lvl[18][25] = 5
lvl[18][26] = 8
lvl[18][27] = 2
lvl[18][28] = 5
lvl[18][29] = 8
lvl[19] = {}
lvl[19][22] = 2
lvl[19][23] = 5
lvl[19][24] = 5
lvl[19][25] = 5
lvl[19][26] = 8
lvl[19][27] = 2
lvl[19][28] = 5
lvl[19][29] = 8
lvl[20] = {}
lvl[20][22] = 3
lvl[20][23] = 36
lvl[20][24] = 6
lvl[20][25] = 6
lvl[20][26] = 9
lvl[20][27] = 2
lvl[20][28] = 5
lvl[20][29] = 8
lvl[21] = {}
lvl[21][27] = 2
lvl[21][28] = 5
lvl[21][29] = 8
lvl[22] = {}
lvl[22][27] = 2
lvl[22][28] = 5
lvl[22][29] = 8
lvl[23] = {}
lvl[23][27] = 3
lvl[23][28] = 6
lvl[23][29] = 9
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