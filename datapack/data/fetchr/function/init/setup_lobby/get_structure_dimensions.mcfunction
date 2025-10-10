#> fetchr:init/setup_lobby/get_structure_dimensions
#
# This function spawns all registered structures
#
# @within
# 	function fetchr:init/setup_lobby/spawn_structure
# @context
# 	pos The reference structure block

data modify block ~ ~ ~ name set from storage fetchr:structure structures[-1].id

setblock ~ ~1 ~ minecraft:redstone_block
setblock ~ ~1 ~ minecraft:barrier
execute \
	store result storage fetchr:structure structures[-1].size[0] int 1 \
	store result score $init/lobby.offsetx fetchr.tmp \
	run data get block ~ ~ ~ sizeX

execute \
	store result storage fetchr:structure structures[-1].size[1] int 1 \
	run data get block ~ ~ ~ sizeY

execute \
	store result storage fetchr:structure structures[-1].size[2] int 1 \
	run data get block ~ ~ ~ sizeZ