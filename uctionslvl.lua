--[[

This software is released under the MIT License. See LICENSE.txt for details.

Also, on a non-legal note: I do not recommend reading my code, especially not for educative
purposes. It was written over like three years, and I often forgot how I implemented several
things over time. Also, I was mostly drunk and listening to the Katamari Damacy soundtrack. 
So yeah.

]]

local function lol(gfx)
local items = newItemList()
items:add(newEItem('spawn',9,9,gfx))
items:add(newEItem('goal',15,29,gfx))
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
lvl[8][10] = 1
lvl[8][11] = 4
lvl[8][12] = 7
lvl[9] = {}
lvl[9][10] = 2
lvl[9][11] = 5
lvl[9][12] = 8
lvl[10] = {}
lvl[10][10] = 32
lvl[10][11] = 5
lvl[10][12] = 98
lvl[11] = {}
lvl[11][4] = 1
lvl[11][5] = 4
lvl[11][6] = 4
lvl[11][7] = 4
lvl[11][8] = 14
lvl[11][9] = 4
lvl[11][10] = 24
lvl[11][11] = 5
lvl[11][12] = 98
lvl[12] = {}
lvl[12][4] = 2
lvl[12][5] = 5
lvl[12][6] = 5
lvl[12][7] = 5
lvl[12][8] = 5
lvl[12][9] = 5
lvl[12][10] = 5
lvl[12][11] = 5
lvl[12][12] = 98
lvl[13] = {}
lvl[13][4] = 3
lvl[13][5] = 6
lvl[13][6] = 26
lvl[13][7] = 5
lvl[13][8] = 68
lvl[13][9] = 6
lvl[13][10] = 6
lvl[13][11] = 6
lvl[13][12] = 9
lvl[13][29] = 1
lvl[13][30] = 4
lvl[13][31] = 7
lvl[14] = {}
lvl[14][6] = 2
lvl[14][7] = 5
lvl[14][8] = 8
lvl[14][10] = 1
lvl[14][11] = 4
lvl[14][12] = 7
lvl[14][29] = 2
lvl[14][30] = 5
lvl[14][31] = 8
lvl[15] = {}
lvl[15][6] = 32
lvl[15][7] = 5
lvl[15][8] = 98
lvl[15][10] = 2
lvl[15][11] = 5
lvl[15][12] = 8
lvl[15][29] = 32
lvl[15][30] = 5
lvl[15][31] = 98
lvl[16] = {}
lvl[16][6] = 32
lvl[16][7] = 5
lvl[16][8] = 98
lvl[16][10] = 32
lvl[16][11] = 5
lvl[16][12] = 98
lvl[16][29] = 32
lvl[16][30] = 5
lvl[16][31] = 98
lvl[17] = {}
lvl[17][6] = 3
lvl[17][7] = 6
lvl[17][8] = 9
lvl[17][10] = 3
lvl[17][11] = 6
lvl[17][12] = 9
lvl[17][29] = 3
lvl[17][30] = 6
lvl[17][31] = 9
lvl[18] = {}
lvl[19] = {}
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