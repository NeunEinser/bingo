#> bingo:init/spawn_structures
#
# This function spawns all registered structures
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:init/spawn_structures
# @context
# 	entity Marker entity which is at the end of the structure spawned in the
# 		last step
# 	position @s

#>
# @private
#declare score_holder $init/lobby.offsetx
#>
# @private
#declare score_holder $init/lobby.offsetz
#>
# @private
#declare score_holder $init/lobby.posx

data modify block -1 1 -17 name set from storage bingo:registries structures[0]

setblock -1 2 -17 minecraft:redstone_block
setblock -1 2 -17 minecraft:air
execute store result score $init/lobby.offsetx bingo.tmp run data get block -1 1 -17 sizeX
scoreboard players operation $init/lobby.offsetx bingo.tmp *= -1 bingo.const
scoreboard players add $init/lobby.offsetx bingo.tmp 1
execute store result score $init/lobby.offsetz bingo.tmp run data get block -1 1 -17 sizeZ
scoreboard players operation $init/lobby.offsetz bingo.tmp /= -2 bingo.const
scoreboard players add $init/lobby.offsetz bingo.tmp 1

forceload add ~-1 ~-24 ~-48 ~23
setblock ~-1 ~ ~ minecraft:structure_block[mode=load]{mode:"LOAD"}
data modify block ~-1 ~ ~ name set from storage bingo:registries structures[0]
execute store result block ~-1 ~ ~ posX int 1 run scoreboard players get $init/lobby.offsetx bingo.tmp
execute store result block ~-1 ~ ~ posZ int 1 run scoreboard players get $init/lobby.offsetz bingo.tmp
setblock ~-1 ~1 ~ minecraft:redstone_block
execute if block ~-1 ~ ~ minecraft:structure_block run setblock ~-1 ~ ~ minecraft:barrier
execute if block ~-1 ~1 ~ minecraft:redstone_block run setblock ~-1 ~1 ~ minecraft:air

execute store result score $init/lobby.posx bingo.tmp run data get entity @s Pos[0]
scoreboard players operation $init/lobby.posx bingo.tmp += $init/lobby.offsetx bingo.tmp
scoreboard players remove $init/lobby.posx bingo.tmp 1

execute store result entity @s Pos[0] double 1 run scoreboard players get $init/lobby.posx bingo.tmp

data remove storage bingo:registries structures[0]
execute if data storage bingo:registries structures[0] at @s run function bingo:init/spawn_structures