local function lol(gfx)
local items = newItemList()
items:add(newEItem('break',13,9,gfx))
items:add(newEItem('spawn',8,8,gfx))
items:add(newEItem('goal',16,15,gfx))
items:add(newEItem('buttblock',2,9,gfx))
items:add(newEItem('buttblock',3,9,gfx))
items:add(newEItem('buttblock',4,9,gfx))
items:add(newEItem('buttblock',4,8,gfx))
items:add(newEItem('break',13,8,gfx))
items:add(newEItem('button',12,15,gfx))
items:add(newEItem('score',11,15,gfx))
items:add(newEItem('break',10,15,gfx))
items:add(newEItem('break',19,15,gfx))
items:add(newEItem('score',18,15,gfx))
local decs = {}
local nmys = {}
nmys[1] = {1, 10, 9}
local lvl = {}
lvl[1] = {}
lvl[2] = {}
lvl[3] = {}
lvl[4] = {}
lvl[5] = {}
lvl[6] = {}
lvl[6][5] = 1
lvl[6][6] = 4
lvl[6][7] = 4
lvl[6][8] = 4
lvl[6][9] = 4
lvl[6][10] = 4
lvl[6][11] = 7
lvl[7] = {}
lvl[7][5] = 2
lvl[7][6] = 5
lvl[7][7] = 5
lvl[7][8] = 5
lvl[7][9] = 5
lvl[7][10] = 5
lvl[7][11] = 8
lvl[8] = {}
lvl[8][5] = 32
lvl[8][6] = 5
lvl[8][7] = 86
lvl[8][8] = 6
lvl[8][9] = 26
lvl[8][10] = 5
lvl[8][11] = 98
lvl[9] = {}
lvl[9][5] = 32
lvl[9][6] = 5
lvl[9][7] = 8
lvl[9][9] = 32
lvl[9][10] = 5
lvl[9][11] = 98
lvl[10] = {}
lvl[10][5] = 2
lvl[10][6] = 5
lvl[10][7] = 8
lvl[10][9] = 32
lvl[10][10] = 5
lvl[10][11] = 98
lvl[10][15] = 1
lvl[10][16] = 4
lvl[10][17] = 7
lvl[11] = {}
lvl[11][5] = 2
lvl[11][6] = 5
lvl[11][7] = 48
lvl[11][8] = 4
lvl[11][9] = 24
lvl[11][10] = 5
lvl[11][11] = 98
lvl[11][15] = 12
lvl[11][16] = 5
lvl[11][17] = 78
lvl[12] = {}
lvl[12][5] = 2
lvl[12][6] = 5
lvl[12][7] = 5
lvl[12][8] = 5
lvl[12][9] = 5
lvl[12][10] = 5
lvl[12][11] = 98
lvl[12][15] = 2
lvl[12][16] = 5
lvl[12][17] = 8
lvl[13] = {}
lvl[13][5] = 3
lvl[13][6] = 36
lvl[13][7] = 6
lvl[13][8] = 6
lvl[13][9] = 6
lvl[13][10] = 6
lvl[13][11] = 9
lvl[13][15] = 32
lvl[13][16] = 5
lvl[13][17] = 98
lvl[14] = {}
lvl[14][15] = 32
lvl[14][16] = 5
lvl[14][17] = 98
lvl[15] = {}
lvl[15][15] = 32
lvl[15][16] = 5
lvl[15][17] = 98
lvl[16] = {}
lvl[16][15] = 32
lvl[16][16] = 5
lvl[16][17] = 98
lvl[17] = {}
lvl[17][15] = 32
lvl[17][16] = 5
lvl[17][17] = 98
lvl[18] = {}
lvl[18][15] = 32
lvl[18][16] = 5
lvl[18][17] = 98
lvl[19] = {}
lvl[19][15] = 3
lvl[19][16] = 6
lvl[19][17] = 9
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