#> fetchr:init/setup_lobby/get_structure_dimensions
#
# This function spawns all registered structures
#
# @within
# 	function fetchr:init/setup_lobby/spawn_structure
# @context
# 	pos The reference structure block

data modify block ~ ~ ~ name set from storage fetchr:registries structures[0]

setblock ~ ~ ~ minecraft:redstone_block
setblock ~ ~ ~ minecraft:air
execute \
	store result storage fetchr:structure structures[-1].size.x int 1 \
	store result score $init/lobby.offsetx fetchr.tmp \
	run data get block ~ ~ ~ sizeX

execute \
	store result storage fetchr:structure structures[-1].size.y int 1 \
	run data get block ~ ~ ~ sizeY

execute \
	store result storage fetchr:structure structures[-1].size.z int 1 \
	store result score $init/lobby.offsetz fetchr.tmp \
	run data get block ~ ~ ~ sizeZ