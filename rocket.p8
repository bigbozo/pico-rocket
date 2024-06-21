pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include helpers.lua
#include objects.lua
-- #include player.lua
-- #include game.lua
-- #include planet.lua
#include scene.lua
#include scenes/start.lua
#include scenes/planets.lua
#include scenes/planet.lua
#include main.lua

_init = function()
 cls()
 print(❎)
end

__gfx__
00000000cccccccc0777777777777777776777d007777767777777d000000000c00000000000000c777777777777776700000000cccccccc7777776700000000
00000000cccccccc0767777777677777777777d007777767777777d0777777670777777777777770777777777700007700000000c0ccc0cc7777776700000000
00700700cccccccc0767777777677777776777d007777777777777d0777777770777776777777770777777777077660700000000cc0c10cc7777777700000000
00077000cccccccc0777777777777777777777d007777767777777d0777777770777776777777760777777777076660700000000ccc000cc7777776700000000
00077000cccccccc0767777777677777776777d007777777777777d0777777670777776777777770777777777066650700000000cc100ccc7777776700000000
00700700cccccccc0767777777777777776777d007777767777777d0777777670777777777777760777777777066550700000000c000c0c07777777700000000
00000000cccccccc0666666666666666666d6dd007777777777777d0777777770777776777777760777777777700006700000000ccccc0077700007700000000
00000000ccccccccc0000000000000000000000cc6666666666666dc666666660666666666666660777777776666666600000000ccccccc07077660700000000
0000000000000000000000000000000000000000cc08882888888828888880cc88888828ccccccc0000000000ccccccccccccccc000000006066660606677760
0000000000000000000000000000000000000000cc08888888000828888880cc88000088cccccc000000000000cccccccccccccc000000007066660706777760
0000000000000000000000000000000000000000cc08882880776028888880cc80776608ccccc00000000000000ccccccccccccc000000007066660706777760
0000000000000000000000000000000000000000cc08888880766028888880cc80766608cccc0000000000000000cccccccccccc000000007066660707777760
0000000000000000000000000000000000000000cc08882880665028888880cc80666508ccc000000000000000000cccccc00ccc000000007066660707777760
0000000000000000000000000000000000000000cc08882888000828888880cc80665508cc00000000000000000000cccc0000cc000000007066660707777760
0000000000000000000000000000000000000000cc08882888888828888880cc88000088c0000000000000000000000cc000000c000000007066660707777760
0000000000000000000000000000000000000000ccc222222222222222222ccc8888888800000000000000000000000000000000000000000000000007777760
0000000000000000000000000000000000000000cc08888888888888888880cc00000000000000000000000000000000ccc00ccc000000000000000006667760
0000000000000000000000000000000000000000cc08888888288888882880cc000000000000000cc000000000000000cc0670cc000880000000000007000760
0000000000000000000000000000000000000000cc08888888888888882880cc00000000000000cccc00000000000000cc0650cc000880000000000007777760
0000000000000000000000000000000000000000cc08888888288888888880cc0000000000000cccccc0000000000000c067770c008888000000000007000760
0000000000000000000000000000000000000000cc08888888288888882880cc000000000000cccccccc000000000000c065550c088998800000000007777760
0000000000000000000000000000000000000000cc08888888288888888880cc00000000000cccccccccc00000000000c065550c089009800000000007000760
0000000000000000000000000000000000000000c0022222222222222222200c0000000000cccccccccccc0000000000c065550c080000800000000007777760
0000000000000000000000000000000000000000000000000000000000000000000000000cccccccccccccc000000000c065550c000000000000000000000000
77777777cc7777cccccccccc000000000000000000000000000000000000000000000000ccccccc00ccccccc00000000cc9a189c000000000000000000000000
ccc7ccc7ccccc7cccccccccc000000000000000000000000000000000000000000000000cccccc0000cccccc00000000ca98889c000000000000000000000000
cc7ccc7ccccc77ccccccc7cc000000000000000000000000000000000000000000000000ccccc000000ccccc00000000caa9899c000000000000000000000000
c7ccc7ccccccc7ccccccc7cc000000000000000000000000000000000000000000000000cccc00000000cccc00000000caa9a9ac000000000000000000000000
7ccc7cccccc777cccccc7c7c000000000000000000000000000000000000000000000000cccc00000000cccc00000000caca9acc000000000000000000000000
ccc7ccc7ccccc7cccccc777c000000000000000000000000000000000000000000000000cccc00000000cccc00000000cccaaacc000000000000000000000000
cc7ccc7ccccc77ccccccc7cc000000000000000000000000000000000000000000000000cccc000cc000cccc00000000cccaaccc000000000000000000000000
c7ccc7ccccccc7ccccccc7cc000000000000000000000000000000000000000000000000cccc00cccc00cccc00000000ccccaccc000000000000000000000000
__map__
0101320101011c01010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101310101191a1b010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010131010d050b06010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01013101390203043a0101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101310101151617010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101310101252627010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101311c19050e061b1c01010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101311f2d021e042d1f01010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101392f292c2c2c2a2f3a010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101302c303c3c3c302c01010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101013c01010101013c01010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
01040000180500c15000000000001f0500e1500000000000180501015000000000001f0500e1500000000000210501015000000000001f0500e1500000000000180500c150000000000000000000000000000000
