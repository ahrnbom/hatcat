local function lol(gfx)
local items = newItemList()
items:add(newEItem('spawn',13,9,gfx))
items:add(newEItem('goal',16,10,gfx))
items:add(newEItem('iceblock',19,11,gfx))
items:add(newEItem('iceblock',20,11,gfx))
items:add(newEItem('iceblock',21,11,gfx))
items:add(newEItem('iceblock',22,11,gfx))
items:add(newEItem('iceblock',19,12,gfx))
items:add(newEItem('iceblock',20,12,gfx))
items:add(newEItem('iceblock',21,12,gfx))
items:add(newEItem('iceblock',22,12,gfx))
items:add(newEItem('iceblock',19,13,gfx))
items:add(newEItem('iceblock',20,13,gfx))
items:add(newEItem('iceblock',21,13,gfx))
items:add(newEItem('iceblock',22,13,gfx))
items:add(newEItem('iceblock',19,14,gfx))
items:add(newEItem('iceblock',20,14,gfx))
items:add(newEItem('iceblock',21,14,gfx))
items:add(newEItem('iceblock',22,14,gfx))
items:add(newEItem('button',20,16,gfx))
items:add(newEItem('iceblock',23,14,gfx))
items:add(newEItem('iceblock',23,13,gfx))
items:add(newEItem('iceblock',23,12,gfx))
items:add(newEItem('iceblock',23,11,gfx))
items:add(newEItem('buttblock',29,13,gfx))
items:add(newEItem('buttblock',30,13,gfx))
items:add(newEItem('buttblock',31,13,gfx))
items:add(newEItem('buttblock',32,13,gfx))
items:add(newEItem('buttblock',33,13,gfx))
items:add(newEItem('score',31,12,gfx))
items:add(newEItem('buttblock',29,12,gfx))
items:add(newEItem('buttblock',29,11,gfx))
items:add(newEItem('break',28,12,gfx))
items:add(newEItem('buttblock',29,20,gfx))
items:add(newEItem('buttblock',29,21,gfx))
items:add(newEItem('buttblock',30,21,gfx))
items:add(newEItem('buttblock',31,21,gfx))
items:add(newEItem('buttblock',32,21,gfx))
items:add(newEItem('buttblock',33,21,gfx))
items:add(newEItem('buttblock',29,19,gfx))
items:add(newEItem('break',22,18,gfx))
items:add(newEItem('break',18,16,gfx))
items:add(newEItem('break',18,5,gfx))
local decs = {}
local nmys = {}
nmys[1] = {6, 20, 8}
nmys[2] = {6, 21, 8}
nmys[3] = {6, 22, 8}
nmys[4] = {6, 23, 8}
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
lvl[11][10] = 1
lvl[11][11] = 4
lvl[11][12] = 7
lvl[12] = {}
lvl[12][10] = 2
lvl[12][11] = 5
lvl[12][12] = 8
lvl[13] = {}
lvl[13][10] = 32
lvl[13][11] = 5
lvl[13][12] = 98
lvl[14] = {}
lvl[14][10] = 32
lvl[14][11] = 5
lvl[14][12] = 98
lvl[15] = {}
lvl[15][10] = 32
lvl[15][11] = 5
lvl[15][12] = 98
lvl[16] = {}
lvl[16][10] = 32
lvl[16][11] = 5
lvl[16][12] = 98
lvl[17] = {}
lvl[17][10] = 32
lvl[17][11] = 5
lvl[17][12] = 98
lvl[18] = {}
lvl[18][5] = 1
lvl[18][6] = 4
lvl[18][7] = 7
lvl[18][10] = 32
lvl[18][11] = 5
lvl[18][12] = 98
lvl[18][16] = 1
lvl[18][17] = 4
lvl[18][18] = 7
lvl[19] = {}
lvl[19][5] = 2
lvl[19][6] = 5
lvl[19][7] = 8
lvl[19][10] = 3
lvl[19][11] = 6
lvl[19][12] = 9
lvl[19][16] = 2
lvl[19][17] = 5
lvl[19][18] = 8
lvl[20] = {}
lvl[20][5] = 32
lvl[20][6] = 5
lvl[20][7] = 98
lvl[20][16] = 32
lvl[20][17] = 5
lvl[20][18] = 98
lvl[21] = {}
lvl[21][5] = 32
lvl[21][6] = 5
lvl[21][7] = 98
lvl[21][16] = 32
lvl[21][17] = 5
lvl[21][18] = 98
lvl[22] = {}
lvl[22][5] = 32
lvl[22][6] = 5
lvl[22][7] = 98
lvl[22][16] = 32
lvl[22][17] = 5
lvl[22][18] = 98
lvl[23] = {}
lvl[23][5] = 32
lvl[23][6] = 5
lvl[23][7] = 98
lvl[23][16] = 32
lvl[23][17] = 5
lvl[23][18] = 98
lvl[24] = {}
lvl[24][5] = 3
lvl[24][6] = 6
lvl[24][7] = 9
lvl[24][16] = 3
lvl[24][17] = 6
lvl[24][18] = 9
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