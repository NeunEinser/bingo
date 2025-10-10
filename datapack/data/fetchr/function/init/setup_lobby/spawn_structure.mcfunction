#> fetchr:init/setup_lobby/spawn_structure
#
# Spawns the next structure
#
# @within
# 	function fetchr:init/setup_lobby/spawn_structure_schedule
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

execute \
	at @e[type=minecraft:marker, x=0, tag=fetchr.structure_test, limit=1] \
	run function fetchr:init/setup_lobby/get_structure_dimensions

execute \
	if score $init/lobby.is_reference fetchr.tmp matches 0 \
	run data \
		modify storage fetchr:structure structures \
		append from storage tmp.fetchr:init/structures structures[0]

scoreboard players remove $init/lobby.offsetx fetchr.tmp 1
scoreboard players operation $init/lobby.offsetx fetchr.tmp *= -1 fetchr.const

execute \
	store result score $init/lobby.offsety fetchr.tmp \
	run data get storage tmp.fetchr:init/structures structures[0].entrance_position[0]
scoreboard players operation $init/lobby.offsety fetchr.tmp *= -1 fetchr.const

execute \
	store result score $init/lobby.offsetz fetchr.tmp \
	run data get storage tmp.fetchr:init/structures structures[0].entrance_position[1]
scoreboard players operation $init/lobby.offsetz fetchr.tmp *= -1 fetchr.const

setblock ~-1 ~ ~ minecraft:structure_block[mode=load]{\
	mode: "LOAD",\
	ignoreEntities: false,\
	strict: true\
}
data \
	modify block ~-1 ~ ~ name \
	set from storage tmp.fetchr:init/structures structures[0].id

execute \
	store result block ~-1 ~ ~ posX int 1 \
	run scoreboard players get $init/lobby.offsetx fetchr.tmp
execute \
	store result block ~-1 ~ ~ posY int 1 \
	run scoreboard players get $init/lobby.offsety fetchr.tmp
execute \
	store result block ~-1 ~ ~ posZ int 1 \
	run scoreboard players get $init/lobby.offsetz fetchr.tmp

setblock ~-1 ~1 ~ minecraft:redstone_block
execute \
	if block ~-1 ~ ~ minecraft:structure_block \
	run setblock ~-1 ~ ~ minecraft:air
execute \
	if block ~-1 ~1 ~ minecraft:redstone_block \
	run setblock ~-1 ~1 ~ minecraft:air

execute \
	if score $init/lobby.is_reference fetchr.tmp matches 1 \
	positioned ~-256 0 ~-256 \
	run kill @e[type=minecraft:marker, dx=512, dy=512, dz=512, tag=!fetchr.structure_spawner, tag=!fetchr.structure_test]

execute \
	store result score $init/lobby.posx fetchr.tmp \
	run data get entity @s Pos[0]
scoreboard players operation $init/lobby.posx fetchr.tmp += $init/lobby.offsetx fetchr.tmp
scoreboard players remove $init/lobby.posx fetchr.tmp 1

execute \
	store result entity @s Pos[0] double 1 \
	run scoreboard players get $init/lobby.posx fetchr.tmp

data remove storage tmp.fetchr:init/structures structures[0]

execute \
	unless data storage tmp.fetchr:init/structures structures[0] \
	at @s \
	run function fetchr:init/setup_lobby/end
execute \
	if data storage tmp.fetchr:init/structures structures[0] \
	at @s \
	run forceload add ~-48 ~-24 ~-1 ~23
execute \
	if data storage tmp.fetchr:init/structures structures[0] \
	run function fetchr:init/setup_lobby/spawn_structure_schedule