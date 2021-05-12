#> bingo:init/setup_lobby
#
# This function places relevant structures in the lobby.
#
# @within function bingo:init/init
# @context
# 	dimension bingo:lobby

#>
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:init/spawn_structures
#declare tag bingo.structure_spawner

#Temporary forceload to make sure all needed chunks are actually loaded.
#This forceload is undone at the end of the function
forceload add -16 -17 47 31
setblock -1 3 -17 minecraft:structure_block[mode=load]{mode: "LOAD", ignoreEntities: true, integrity: 0f, posX: 1, posZ: 1}
summon minecraft:area_effect_cloud -2 1 7 {Tags: ["bingo.structure_spawner"]}

kill @e[type=minecraft:area_effect_cloud, tag= bingo.lobby_sign]
execute as @e[type=minecraft:area_effect_cloud, tag=bingo.structure_spawner, limit=1] at @s run function bingo:init/spawn_structures
setblock -1 3 -17 minecraft:air

# Spawn machinery at hardcoded position
setblock -4 1 -3 minecraft:structure_block[mode=load]{mode: "LOAD", name: "bingo:machinery", posX: 1, posZ: 1}
setblock -4 2 -3 minecraft:redstone_block
data modify block -4 1 -3 ignoreEntities set value true

## Workaround for https://bugs.mojang.com/browse/MC-224771
setblock -4 2 -3 minecraft:barrier
setblock -4 2 -3 minecraft:redstone_block
setblock -4 2 -3 minecraft:barrier
setblock -4 2 -3 minecraft:redstone_block
setblock -4 2 -3 minecraft:barrier
setblock -4 2 -3 minecraft:redstone_block
setblock -4 2 -3 minecraft:barrier
setblock -4 2 -3 minecraft:redstone_block
setblock -4 2 -3 minecraft:barrier
setblock -4 2 -3 minecraft:redstone_block
setblock -4 2 -3 minecraft:barrier
setblock -4 2 -3 minecraft:redstone_block
setblock -4 2 -3 minecraft:barrier

setblock -4 1 -3 minecraft:barrier

forceload remove all
forceload add 0 0