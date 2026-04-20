#> fetchr:init/update_lobby/update_structures
#
# Updates all structures that exist in old and new
#
# @within
#	fetchr:init/update_lobby/remove_structure_callback

data \
	modify storage tmp.fetchr:init/update_lobby structures \
	set from storage fetchr:registries structures

data modify storage tmp.fetchr:init/update_lobby structures append value {\
	id: "fetchr:lobby_end",\
	entrance_position: [I; 1, 0, 1],\
	version: 1\
}

scoreboard players set $init/lobby/update.clone_x fetchr.tmp -30000000
execute \
	store result score $init/lobby/update.old_lobby_start fetchr.tmp \
	run data get storage fetchr:structure structures[0].entrance_position[0]
scoreboard players add $init/lobby/update.old_lobby_start fetchr.tmp 7

execute in fetchr:lobby run function fetchr:init/update_lobby/place_structure_block