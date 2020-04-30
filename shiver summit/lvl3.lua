local function lol(gfx)
local items = newItemList()
items:add(newEItem('spawn',10,8,gfx))
items:add(newEItem('iceblock',17,10,gfx))
items:add(newEItem('iceblock',18,10,gfx))
items:add(newEItem('iceblock',19,10,gfx))
items:add(newEItem('iceblock',17,13,gfx))
items:add(newEItem('iceblock',18,13,gfx))
items:add(newEItem('iceblock',19,13,gfx))
items:add(newEItem('iceblock',17,16,gfx))
items:add(newEItem('iceblock',18,16,gfx))
items:add(newEItem('button',17,18,gfx))
items:add(newEItem('iceblock',19,16,gfx))
items:add(newEItem('buttblock',20,19,gfx))
items:add(newEItem('buttblock',21,19,gfx))
items:add(newEItem('buttblock',22,19,gfx))
items:add(newEItem('buttblock',22,18,gfx))
items:add(newEItem('buttblock',22,17,gfx))
items:add(newEItem('goal',27,9,gfx))
local decs = {}
local nmys = {}
nmys[1] = {6, 18, 7}
nmys[2] = {6, 19, 7}
local lvl = {}
lvl[1] = {}
lvl[2] = {}
lvl[3] = {}
lvl[4] = {}
lvl[5] = {}
lvl[6] = {}
lvl[7] = {}
lvl[8] = {}
lvl[8][9] = 1
lvl[8][10] = 4
lvl[8][11] = 7
lvl[9] = {}
lvl[9][9] = 2
lvl[9][10] = 5
lvl[9][11] = 8
lvl[10] = {}
lvl[10][9] = 2
lvl[10][10] = 5
lvl[10][11] = 8
lvl[11] = {}
lvl[11][9] = 2
lvl[11][10] = 5
lvl[11][11] = 8
lvl[12] = {}
lvl[12][9] = 2
lvl[12][10] = 5
lvl[12][11] = 8
lvl[13] = {}
lvl[13][9] = 2
lvl[13][10] = 5
lvl[13][11] = 8
lvl[14] = {}
lvl[14][9] = 2
lvl[14][10] = 5
lvl[14][11] = 8
lvl[15] = {}
lvl[15][9] = 2
lvl[15][10] = 5
lvl[15][11] = 8
lvl[16] = {}
lvl[16][4] = 1
lvl[16][5] = 4
lvl[16][6] = 7
lvl[16][9] = 2
lvl[16][10] = 5
lvl[16][11] = 8
lvl[16][18] = 1
lvl[16][19] = 4
lvl[16][20] = 7
lvl[17] = {}
lvl[17][4] = 2
lvl[17][5] = 5
lvl[17][6] = 8
lvl[17][9] = 3
lvl[17][10] = 6
lvl[17][11] = 9
lvl[17][18] = 2
lvl[17][19] = 5
lvl[17][20] = 8
lvl[18] = {}
lvl[18][4] = 2
lvl[18][5] = 5
lvl[18][6] = 8
lvl[18][18] = 2
lvl[18][19] = 5
lvl[18][20] = 8
lvl[19] = {}
lvl[19][4] = 2
lvl[19][5] = 5
lvl[19][6] = 8
lvl[19][18] = 2
lvl[19][19] = 5
lvl[19][20] = 8
lvl[20] = {}
lvl[20][4] = 3
lvl[20][5] = 6
lvl[20][6] = 9
lvl[20][18] = 3
lvl[20][19] = 6
lvl[20][20] = 9
lvl[21] = {}
lvl[22] = {}
lvl[23] = {}
lvl[24] = {}
lvl[24][9] = 1
lvl[24][10] = 4
lvl[24][11] = 7
lvl[25] = {}
lvl[25][9] = 2
lvl[25][10] = 5
lvl[25][11] = 8
lvl[26] = {}
lvl[26][9] = 2
lvl[26][10] = 5
lvl[26][11] = 8
lvl[27] = {}
lvl[27][9] = 2
lvl[27][10] = 5
lvl[27][11] = 8
lvl[28] = {}
lvl[28][9] = 2
lvl[28][10] = 5
lvl[28][11] = 8
lvl[29] = {}
lvl[29][9] = 2
lvl[29][10] = 5
lvl[29][11] = 8
lvl[30] = {}
lvl[30][9] = 3
lvl[30][10] = 6
lvl[30][11] = 9
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