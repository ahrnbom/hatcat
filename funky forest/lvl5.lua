local function lol(gfx)
local items = newItemList()
items:add(newEItem('button',8,17,gfx))
items:add(newEItem('buttblock',19,16,gfx))
items:add(newEItem('buttblock',20,16,gfx))
items:add(newEItem('buttblock',21,16,gfx))
items:add(newEItem('buttblock',22,16,gfx))
items:add(newEItem('goal',21,18,gfx))
items:add(newEItem('buttblock',23,16,gfx))
items:add(newEItem('score',25,15,gfx))
items:add(newEItem('spawn',4,8,gfx))
local decs = {}
decs[1] = {2, 10, 9}
decs[2] = {2, 4, 9}
decs[3] = {2, 11, 12}
decs[4] = {2, 14, 12}
decs[5] = {2, 24, 15}
decs[6] = {2, 26, 15}
decs[7] = {2, 22, 18}
decs[8] = {2, 19, 18}
decs[9] = {2, 7, 15}
decs[10] = {2, 4, 15}
decs[11] = {2, 18, 15}
decs[12] = {2, 11, 15}
local nmys = {}
nmys[1] = {2, 7, 8}
local lvl = {}
lvl[1] = {}
lvl[2] = {}
lvl[2][9] = 1
lvl[2][10] = 4
lvl[2][11] = 7
lvl[2][15] = 1
lvl[2][16] = 4
lvl[2][17] = 74
lvl[2][18] = 74
lvl[2][19] = 74
lvl[2][20] = 7
lvl[3] = {}
lvl[3][9] = 12
lvl[3][10] = 5
lvl[3][11] = 78
lvl[3][15] = 12
lvl[3][16] = 5
lvl[3][17] = 5
lvl[3][18] = 5
lvl[3][19] = 5
lvl[3][20] = 78
lvl[4] = {}
lvl[4][9] = 2
lvl[4][10] = 5
lvl[4][11] = 8
lvl[4][15] = 2
lvl[4][16] = 5
lvl[4][17] = 5
lvl[4][18] = 5
lvl[4][19] = 5
lvl[4][20] = 8
lvl[5] = {}
lvl[5][9] = 2
lvl[5][10] = 5
lvl[5][11] = 8
lvl[5][15] = 2
lvl[5][16] = 5
lvl[5][17] = 5
lvl[5][18] = 5
lvl[5][19] = 5
lvl[5][20] = 8
lvl[6] = {}
lvl[6][9] = 2
lvl[6][10] = 5
lvl[6][11] = 8
lvl[6][15] = 2
lvl[6][16] = 5
lvl[6][17] = 5
lvl[6][18] = 5
lvl[6][19] = 5
lvl[6][20] = 8
lvl[7] = {}
lvl[7][9] = 2
lvl[7][10] = 5
lvl[7][11] = 8
lvl[7][15] = 2
lvl[7][16] = 5
lvl[7][17] = 5
lvl[7][18] = 5
lvl[7][19] = 5
lvl[7][20] = 8
lvl[8] = {}
lvl[8][9] = 2
lvl[8][10] = 5
lvl[8][11] = 8
lvl[8][15] = 3
lvl[8][16] = 6
lvl[8][17] = 62
lvl[8][18] = 5
lvl[8][19] = 5
lvl[8][20] = 8
lvl[9] = {}
lvl[9][9] = 2
lvl[9][10] = 5
lvl[9][11] = 8
lvl[9][17] = 2
lvl[9][18] = 5
lvl[9][19] = 5
lvl[9][20] = 8
lvl[10] = {}
lvl[10][9] = 2
lvl[10][10] = 5
lvl[10][11] = 8
lvl[10][12] = 1
lvl[10][13] = 4
lvl[10][14] = 7
lvl[10][15] = 1
lvl[10][16] = 4
lvl[10][17] = 42
lvl[10][18] = 5
lvl[10][19] = 5
lvl[10][20] = 8
lvl[11] = {}
lvl[11][9] = 3
lvl[11][10] = 6
lvl[11][11] = 9
lvl[11][12] = 2
lvl[11][13] = 5
lvl[11][14] = 8
lvl[11][15] = 2
lvl[11][16] = 5
lvl[11][17] = 5
lvl[11][18] = 5
lvl[11][19] = 5
lvl[11][20] = 8
lvl[12] = {}
lvl[12][12] = 2
lvl[12][13] = 5
lvl[12][14] = 8
lvl[12][15] = 21
lvl[12][16] = 5
lvl[12][17] = 5
lvl[12][18] = 5
lvl[12][19] = 5
lvl[12][20] = 8
lvl[13] = {}
lvl[13][12] = 2
lvl[13][13] = 5
lvl[13][14] = 8
lvl[13][15] = 2
lvl[13][16] = 5
lvl[13][17] = 5
lvl[13][18] = 5
lvl[13][19] = 5
lvl[13][20] = 8
lvl[14] = {}
lvl[14][12] = 2
lvl[14][13] = 5
lvl[14][14] = 8
lvl[14][15] = 2
lvl[14][16] = 5
lvl[14][17] = 5
lvl[14][18] = 5
lvl[14][19] = 5
lvl[14][20] = 8
lvl[15] = {}
lvl[15][12] = 3
lvl[15][13] = 6
lvl[15][14] = 9
lvl[15][15] = 2
lvl[15][16] = 5
lvl[15][17] = 5
lvl[15][18] = 5
lvl[15][19] = 5
lvl[15][20] = 8
lvl[16] = {}
lvl[16][15] = 2
lvl[16][16] = 5
lvl[16][17] = 5
lvl[16][18] = 5
lvl[16][19] = 5
lvl[16][20] = 8
lvl[17] = {}
lvl[17][15] = 2
lvl[17][16] = 5
lvl[17][17] = 5
lvl[17][18] = 5
lvl[17][19] = 5
lvl[17][20] = 8
lvl[18] = {}
lvl[18][15] = 2
lvl[18][16] = 5
lvl[18][17] = 5
lvl[18][18] = 5
lvl[18][19] = 5
lvl[18][20] = 8
lvl[19] = {}
lvl[19][15] = 3
lvl[19][16] = 6
lvl[19][17] = 6
lvl[19][18] = 62
lvl[19][19] = 5
lvl[19][20] = 98
lvl[20] = {}
lvl[20][18] = 32
lvl[20][19] = 5
lvl[20][20] = 98
lvl[21] = {}
lvl[21][18] = 32
lvl[21][19] = 5
lvl[21][20] = 98
lvl[22] = {}
lvl[22][18] = 2
lvl[22][19] = 5
lvl[22][20] = 8
lvl[23] = {}
lvl[23][15] = 1
lvl[23][16] = 4
lvl[23][17] = 4
lvl[23][18] = 42
lvl[23][19] = 5
lvl[23][20] = 8
lvl[24] = {}
lvl[24][15] = 2
lvl[24][16] = 5
lvl[24][17] = 5
lvl[24][18] = 5
lvl[24][19] = 5
lvl[24][20] = 8
lvl[25] = {}
lvl[25][15] = 2
lvl[25][16] = 5
lvl[25][17] = 5
lvl[25][18] = 5
lvl[25][19] = 5
lvl[25][20] = 8
lvl[26] = {}
lvl[26][15] = 32
lvl[26][16] = 5
lvl[26][17] = 5
lvl[26][18] = 5
lvl[26][19] = 5
lvl[26][20] = 98
lvl[27] = {}
lvl[27][15] = 3
lvl[27][16] = 6
lvl[27][17] = 96
lvl[27][18] = 96
lvl[27][19] = 96
lvl[27][20] = 9
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