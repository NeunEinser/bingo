#> fetchr:init/setup_lobby/spawn_structures
#
# This function spawns all registered structures
#
# @within
# 	function fetchr:init/setup_lobby/spawn_structures_schedule
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

data modify block -1 3 -17 name set from storage fetchr:registries structures[0]

setblock -1 4 -17 minecraft:redstone_block
setblock -1 4 -17 minecraft:air
execute store result score $init/lobby.offsetx fetchr.tmp run data get block -1 3 -17 sizeX
scoreboard players operation $init/lobby.offsetx fetchr.tmp *= -1 fetchr.const
scoreboard players add $init/lobby.offsetx fetchr.tmp 1
execute store result score $init/lobby.offsetz fetchr.tmp run data get block -1 3 -17 sizeZ
scoreboard players operation $init/lobby.offsetz fetchr.tmp /= -2 fetchr.const
scoreboard players add $init/lobby.offsetz fetchr.tmp 1

setblock ~-1 ~ ~ minecraft:structure_block[mode=load]{mode:"LOAD"}
data modify block ~-1 ~ ~ name set from storage fetchr:registries structures[0]
execute store result block ~-1 ~ ~ posX int 1 run scoreboard players get $init/lobby.offsetx fetchr.tmp
execute store result block ~-1 ~ ~ posZ int 1 run scoreboard players get $init/lobby.offsetz fetchr.tmp
setblock ~-1 ~1 ~ minecraft:redstone_block
execute if block ~-1 ~ ~ minecraft:structure_block run setblock ~-1 ~ ~ minecraft:barrier
execute if block ~-1 ~1 ~ minecraft:redstone_block run setblock ~-1 ~1 ~ minecraft:barrier

execute store result score $init/lobby.posx fetchr.tmp run data get entity @s Pos[0]
scoreboard players operation $init/lobby.posx fetchr.tmp += $init/lobby.offsetx fetchr.tmp
scoreboard players remove $init/lobby.posx fetchr.tmp 1

execute store result entity @s Pos[0] double 1 run scoreboard players get $init/lobby.posx fetchr.tmp

data remove storage fetchr:registries structures[0]

execute unless data storage fetchr:registries structures[0] at @s run function fetchr:init/setup_lobby/end
execute if data storage fetchr:registries structures[0] at @s run forceload add ~-1 ~-24 ~-48 ~23
execute if data storage fetchr:registries structures[0] run schedule function fetchr:init/setup_lobby/spawn_structures_schedule 1t