local function lol(gfx)
local items = newItemList()
items:add(newEItem('break',13,9,gfx))
items:add(newEItem('break',14,9,gfx))
items:add(newEItem('break',15,9,gfx))
items:add(newEItem('break',16,9,gfx))
items:add(newEItem('break',17,9,gfx))
items:add(newEItem('break',18,9,gfx))
items:add(newEItem('goal',16,7,gfx))
items:add(newEItem('break',19,9,gfx))
items:add(newEItem('shroom',16,15,gfx))
items:add(newEItem('spawn',13,15,gfx))
items:add(newEItem('score',14,5,gfx))
items:add(newEItem('score',18,5,gfx))
items:add(newEItem('score',17,12,gfx))
items:add(newEItem('score',15,12,gfx))
local decs = {}
local nmys = {}
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
lvl[12][1] = 1
lvl[12][2] = 4
lvl[12][3] = 17
lvl[12][4] = 4
lvl[12][5] = 7
lvl[12][7] = 1
lvl[12][8] = 4
lvl[12][9] = 7
lvl[12][15] = 1
lvl[12][16] = 4
lvl[12][17] = 7
lvl[13] = {}
lvl[13][1] = 24
lvl[13][2] = 5
lvl[13][3] = 28
lvl[13][4] = 5
lvl[13][5] = 8
lvl[13][6] = 4
lvl[13][7] = 2
lvl[13][8] = 5
lvl[13][9] = 8
lvl[13][15] = 2
lvl[13][16] = 5
lvl[13][17] = 8
lvl[14] = {}
lvl[14][1] = 5
lvl[14][2] = 5
lvl[14][3] = 8
lvl[14][4] = 6
lvl[14][5] = 2
lvl[14][6] = 5
lvl[14][7] = 32
lvl[14][8] = 5
lvl[14][9] = 98
lvl[14][15] = 32
lvl[14][16] = 5
lvl[14][17] = 98
lvl[15] = {}
lvl[15][1] = 36
lvl[15][2] = 6
lvl[15][3] = 9
lvl[15][5] = 3
lvl[15][6] = 6
lvl[15][7] = 2
lvl[15][8] = 5
lvl[15][9] = 98
lvl[15][15] = 32
lvl[15][16] = 5
lvl[15][17] = 98
lvl[16] = {}
lvl[16][7] = 2
lvl[16][8] = 5
lvl[16][9] = 98
lvl[16][15] = 32
lvl[16][16] = 5
lvl[16][17] = 98
lvl[17] = {}
lvl[17][1] = 14
lvl[17][2] = 4
lvl[17][3] = 7
lvl[17][5] = 1
lvl[17][6] = 4
lvl[17][7] = 2
lvl[17][8] = 5
lvl[17][9] = 98
lvl[17][15] = 32
lvl[17][16] = 5
lvl[17][17] = 98
lvl[18] = {}
lvl[18][1] = 5
lvl[18][2] = 5
lvl[18][3] = 8
lvl[18][4] = 4
lvl[18][5] = 2
lvl[18][6] = 5
lvl[18][7] = 28
lvl[18][8] = 5
lvl[18][9] = 8
lvl[18][15] = 2
lvl[18][16] = 5
lvl[18][17] = 8
lvl[19] = {}
lvl[19][1] = 6
lvl[19][2] = 6
lvl[19][3] = 2
lvl[19][4] = 5
lvl[19][5] = 8
lvl[19][6] = 6
lvl[19][7] = 32
lvl[19][8] = 5
lvl[19][9] = 98
lvl[19][15] = 32
lvl[19][16] = 5
lvl[19][17] = 98
lvl[20] = {}
lvl[20][3] = 3
lvl[20][4] = 6
lvl[20][5] = 9
lvl[20][7] = 3
lvl[20][8] = 6
lvl[20][9] = 9
lvl[20][15] = 3
lvl[20][16] = 6
lvl[20][17] = 9
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