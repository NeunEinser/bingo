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
setblock -1 1 -17 minecraft:structure_block[mode=load]{mode: "LOAD", ignoreEntities: true, integrity: 0f, posX: 1, posZ: 1}
summon minecraft:area_effect_cloud -2 0 7 {Tags: ["bingo.structure_spawner"]}

kill @e[type=minecraft:area_effect_cloud, tag= bingo.lobby_sign]
execute as @e[type=minecraft:area_effect_cloud, tag=bingo.structure_spawner, limit=1] at @s run function bingo:init/spawn_structures

setblock -1 1 -17 minecraft:air

setblock -2 0 -2 minecraft:structure_block[mode=load]{mode: "LOAD", name: "bingo:machinery"}
setblock -2 1 -2 minecraft:redstone_block
execute if block -2 0 -2 minecraft:structure_block run setblock -2 0 -2 minecraft:barrier
execute if block -2 1 -2 minecraft:redstone_block run setblock -2 1 -2 minecraft:air

forceload remove all
forceload add 0 0