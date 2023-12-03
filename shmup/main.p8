pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
#include utils/debug.lua
#include oop/oop.lua

#include starfield.lua
#include enemy.lua
#include bullet.lua
#include player.lua

#include shmup.lua

-- #include test.lua
__gfx__
00000000000220000002200000022000000000000077770000777700000770000077770000777700000000000880088008800880000000000000000000000000
00000000002882000028820000288200000000000077770000777700000770000077770000777700000000008008800888888888000000000000000000000000
007007000028820000288200002882000000000000c77c0000777700000770000077770000c77c00000000008000000888888888000000000000000000000000
0007700002e88e0002e88e2000e88e2000000000000cc00000c77c000007700000c77c00000cc000000000008000000888888888000000000000000000000000
0007700022178e002e8718e200e871220000000000000000000cc00000077000000cc00000000000000000000800008008888880000000000000000000000000
00700700221d8e002e8118e200e8d122000000000000000000000000000cc0000000000000000000000000000080080000888800000000000000000000000000
00000000028d8e00028dd82000e8d820000000000000000000000000000cc0000000000000000000000000000008800000088000000000000000000000000000
0000000000aa8200002aa2000028aa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaaa00000000000000000000000000333333339999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
0a9999a0000000000000000000000000333333339999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
a997799a000000000000000000000000833333389999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
a977779a000000000000000000000000883333889999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
a977779a000000000000000000000000888338889999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
a997799a000000000000000000000000333333339999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
0a9999a0000000000000000000000000333333339999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaaa00000000000000000000000000333883339999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2727002727272727272700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2727270000000000000027002727000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000270000000000000027270000270000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000002727272727272700002727000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0001000034310313102c310283102531022310203101d3101c3101a31019310173101631015310143101331011310103100e3100d3100c3100a31009310083100631006310043100331002310023100231002310
