local function lol(gfx)
local items = newItemList()
items:add(newEItem('spawn',14,15,gfx))
items:add(newEItem('goal',15,11,gfx))
items:add(newEItem('score',6,8,gfx))
items:add(newEItem('score',24,8,gfx))
items:add(newEItem('break',12,8,gfx))
items:add(newEItem('break',18,8,gfx))
items:add(newEItem('break',10,11,gfx))
items:add(newEItem('break',19,10,gfx))
items:add(newEItem('break',7,4,gfx))
items:add(newEItem('break',8,5,gfx))
items:add(newEItem('break',23,4,gfx))
local decs = {}
local nmys = {}
local lvl = {}
lvl[1] = {}
lvl[2] = {}
lvl[2][5] = 1
lvl[2][6] = 4
lvl[2][7] = 74
lvl[2][8] = 74
lvl[2][9] = 74
lvl[2][10] = 7
lvl[3] = {}
lvl[3][5] = 12
lvl[3][6] = 5
lvl[3][7] = 5
lvl[3][8] = 5
lvl[3][9] = 5
lvl[3][10] = 78
lvl[4] = {}
lvl[4][5] = 2
lvl[4][6] = 5
lvl[4][7] = 68
lvl[4][8] = 62
lvl[4][9] = 5
lvl[4][10] = 8
lvl[5] = {}
lvl[5][5] = 12
lvl[5][6] = 5
lvl[5][7] = 8
lvl[5][8] = 2
lvl[5][9] = 5
lvl[5][10] = 98
lvl[6] = {}
lvl[6][5] = 2
lvl[6][6] = 5
lvl[6][7] = 8
lvl[6][8] = 2
lvl[6][9] = 5
lvl[6][10] = 98
lvl[7] = {}
lvl[7][5] = 2
lvl[7][6] = 5
lvl[7][7] = 48
lvl[7][8] = 42
lvl[7][9] = 5
lvl[7][10] = 98
lvl[8] = {}
lvl[8][5] = 2
lvl[8][6] = 5
lvl[8][7] = 5
lvl[8][8] = 5
lvl[8][9] = 5
lvl[8][10] = 98
lvl[9] = {}
lvl[9][5] = 3
lvl[9][6] = 6
lvl[9][7] = 36
lvl[9][8] = 36
lvl[9][9] = 6
lvl[9][10] = 9
lvl[10] = {}
lvl[11] = {}
lvl[11][11] = 1
lvl[11][12] = 14
lvl[11][13] = 14
lvl[11][14] = 4
lvl[11][15] = 4
lvl[11][16] = 4
lvl[11][17] = 7
lvl[12] = {}
lvl[12][11] = 2
lvl[12][12] = 5
lvl[12][13] = 5
lvl[12][14] = 5
lvl[12][15] = 5
lvl[12][16] = 5
lvl[12][17] = 78
lvl[13] = {}
lvl[13][11] = 2
lvl[13][12] = 5
lvl[13][13] = 68
lvl[13][14] = 6
lvl[13][15] = 26
lvl[13][16] = 5
lvl[13][17] = 8
lvl[14] = {}
lvl[14][11] = 2
lvl[14][12] = 5
lvl[14][13] = 8
lvl[14][15] = 32
lvl[14][16] = 5
lvl[14][17] = 98
lvl[15] = {}
lvl[15][11] = 32
lvl[15][12] = 5
lvl[15][13] = 98
lvl[15][15] = 32
lvl[15][16] = 5
lvl[15][17] = 98
lvl[16] = {}
lvl[16][11] = 32
lvl[16][12] = 5
lvl[16][13] = 98
lvl[16][15] = 32
lvl[16][16] = 5
lvl[16][17] = 98
lvl[17] = {}
lvl[17][11] = 32
lvl[17][12] = 5
lvl[17][13] = 84
lvl[17][14] = 4
lvl[17][15] = 24
lvl[17][16] = 5
lvl[17][17] = 98
lvl[18] = {}
lvl[18][11] = 32
lvl[18][12] = 5
lvl[18][13] = 5
lvl[18][14] = 5
lvl[18][15] = 5
lvl[18][16] = 5
lvl[18][17] = 98
lvl[19] = {}
lvl[19][11] = 3
lvl[19][12] = 6
lvl[19][13] = 6
lvl[19][14] = 6
lvl[19][15] = 6
lvl[19][16] = 6
lvl[19][17] = 9
lvl[20] = {}
lvl[21] = {}
lvl[21][4] = 1
lvl[21][5] = 4
lvl[21][6] = 4
lvl[21][7] = 4
lvl[21][8] = 4
lvl[21][9] = 4
lvl[21][10] = 7
lvl[22] = {}
lvl[22][4] = 2
lvl[22][5] = 5
lvl[22][6] = 5
lvl[22][7] = 5
lvl[22][8] = 5
lvl[22][9] = 5
lvl[22][10] = 8
lvl[23] = {}
lvl[23][4] = 3
lvl[23][5] = 62
lvl[23][6] = 5
lvl[23][7] = 68
lvl[23][8] = 62
lvl[23][9] = 5
lvl[23][10] = 8
lvl[24] = {}
lvl[24][5] = 2
lvl[24][6] = 5
lvl[24][7] = 8
lvl[24][8] = 2
lvl[24][9] = 5
lvl[24][10] = 8
lvl[25] = {}
lvl[25][5] = 2
lvl[25][6] = 5
lvl[25][7] = 8
lvl[25][8] = 2
lvl[25][9] = 5
lvl[25][10] = 8
lvl[26] = {}
lvl[26][5] = 32
lvl[26][6] = 5
lvl[26][7] = 84
lvl[26][8] = 42
lvl[26][9] = 5
lvl[26][10] = 8
lvl[27] = {}
lvl[27][5] = 32
lvl[27][6] = 5
lvl[27][7] = 5
lvl[27][8] = 5
lvl[27][9] = 5
lvl[27][10] = 8
lvl[28] = {}
lvl[28][5] = 3
lvl[28][6] = 6
lvl[28][7] = 6
lvl[28][8] = 6
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