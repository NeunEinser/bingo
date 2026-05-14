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

setblock ~ ~ ~ minecraft:structure_block[mode=load]{\
	mode: "LOAD",\
	ignoreEntities: true,\
	integrity: 0f,\
	strict: true\
}

data modify block ~ ~ ~ name set from storage tmp.fetchr:init/structures structures[0].id
data modify block ~ ~ ~ name set from storage tmp.fetchr:init/structures structures[0].override_id
data modify block ~ ~ ~ name set from storage tmp.fetchr:init/structures structures[0].legacy_id

setblock ~ ~1 ~ minecraft:redstone_block
setblock ~ ~1 ~ minecraft:air
data modify storage tmp.fetchr:init/structures structures[0].size set value [I; 0, 0, 0]
execute \
	store result storage tmp.fetchr:init/structures structures[0].size[0] int 1 \
	store result score $init/lobby.offsetx fetchr.tmp \
	run data get block ~ ~ ~ sizeX

execute \
	store result storage tmp.fetchr:init/structures structures[0].size[1] int 1 \
	run data get block ~ ~ ~ sizeY

execute \
	store result storage tmp.fetchr:init/structures structures[0].size[2] int 1 \
	run data get block ~ ~ ~ sizeZ

execute \
	unless score $init/lobby.lobby_type fetchr.tmp matches 1 \
	run data \
		modify storage fetchr:structure structures \
		append from storage tmp.fetchr:init/structures structures[0]

scoreboard players remove $init/lobby.offsetx fetchr.tmp 1
scoreboard players operation $init/lobby.offsetx fetchr.tmp *= -1 fetchr.const

execute \
	store result score $init/lobby.entrance_offsetx fetchr.tmp \
	run data get storage tmp.fetchr:init/structures structures[0].entrance_position[0]
scoreboard players operation $init/lobby.offsetx fetchr.tmp += $init/lobby.entrance_offsetx fetchr.tmp

execute \
	store result score $init/lobby.offsety fetchr.tmp \
	run data get storage tmp.fetchr:init/structures structures[0].entrance_position[1]
scoreboard players operation $init/lobby.offsety fetchr.tmp *= -1 fetchr.const

execute \
	store result score $init/lobby.offsetz fetchr.tmp \
	run data get storage tmp.fetchr:init/structures structures[0].entrance_position[2]
scoreboard players operation $init/lobby.offsetz fetchr.tmp *= -1 fetchr.const

data merge block ~ ~ ~ { ignoreEntities: false, integrity: 1f }
execute \
	store result block ~ ~ ~ posX int 1 \
	run scoreboard players get $init/lobby.offsetx fetchr.tmp
execute \
	store result block ~ ~ ~ posY int 1 \
	run scoreboard players get $init/lobby.offsety fetchr.tmp
execute \
	store result block ~ ~ ~ posZ int 1 \
	run scoreboard players get $init/lobby.offsetz fetchr.tmp

setblock ~ ~1 ~ minecraft:redstone_block
execute \
	if block ~ ~ ~ minecraft:structure_block \
	run setblock ~ ~ ~ minecraft:air
execute \
	if block ~ ~1 ~ minecraft:redstone_block \
	run setblock ~ ~1 ~ minecraft:air

execute \
	if score $init/lobby.lobby_type fetchr.tmp matches 1..2 \
	positioned ~-256 0 ~-256 \
	as @e[type=minecraft:marker, dx=512, dy=512, dz=512, tag=!fetchr.structure_spawner, tag=!fetchr.structure_test] \
	unless data entity @s data.fetchr.display_entity_id \
	run kill @s

execute \
	store result score $init/lobby.posx fetchr.tmp \
	run data get storage tmp.fetchr:init/structures location.x
scoreboard players operation $init/lobby.posx fetchr.tmp += $init/lobby.offsetx fetchr.tmp
scoreboard players remove $init/lobby.posx fetchr.tmp 1

execute \
	store result storage tmp.fetchr:init/structures location.x int 1 \
	run scoreboard players get $init/lobby.posx fetchr.tmp

data remove storage tmp.fetchr:init/structures structures[0]

execute \
	if score $init/lobby.lobby_type fetchr.tmp matches 1..2 \
	run forceload remove ~ ~

execute \
	unless data storage tmp.fetchr:init/structures structures[0] \
	if score $init/lobby.lobby_type fetchr.tmp matches 0 \
	run function fetchr:init/setup_lobby/end
execute \
	unless data storage tmp.fetchr:init/structures structures[0] \
	if score $init/lobby.lobby_type fetchr.tmp matches 1..2 \
	run scoreboard players set $lobby_generated fetchr.state 4
execute \
	unless data storage tmp.fetchr:init/structures structures[0] \
	if score $init/lobby.lobby_type fetchr.tmp matches 2 \
	run function fetchr:init/update_lobby/run
execute \
	if data storage tmp.fetchr:init/structures structures[0] \
	run function fetchr:init/setup_lobby/spawn_structure_schedule