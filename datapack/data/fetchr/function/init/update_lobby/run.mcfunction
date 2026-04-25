#> fetchr:init/update_lobby/run
#
# This will update the lobby if necessary.
#
# @within function fetchr:init/init

data \
	modify storage tmp.fetchr:init/update_lobby structures \
	set from storage fetchr:registries structures
data modify storage tmp.fetchr:init/update_lobby structures append value {\
	id: "fetchr:lobby_end",\
	entrance_position: [I; 1, 0, 1],\
	version: 1\
}

data \
	modify storage tmp.fetchr:init/update_lobby old_structures \
	set from storage fetchr:structure structures

execute \
	store result score $init/lobby/update.structure_count fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby structures

execute \
	store result score $init/lobby/update.compare_structure_count fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby old_structures

scoreboard players set $init/lobby/update.should_update fetchr.tmp 0
execute \
	unless score $init/lobby/update.structure_count fetchr.tmp = $init/lobby/update.compare_structure_count fetchr.tmp \
	run scoreboard players set $init/lobby/update.should_update fetchr.tmp 1

execute \
	if score $init/lobby/update.should_update fetchr.tmp matches 0 \
	run function fetchr:init/update_lobby/check

execute \
	if score $init/lobby/update.should_update fetchr.tmp matches 0 \
	run return 0

scoreboard players set $lobby_generated fetchr.state 5

function fetchr:game/end
scoreboard players reset $seed fetchr.state
data modify storage fetchr:card slots set value []

schedule clear fetchr:lobby/place_indestructible_blocks

data modify storage tmp.fetchr:init/update_lobby new_structures set value []

data \
	modify storage tmp.fetchr:init/update_lobby old_structures \
	set from storage fetchr:structure structures

scoreboard players set $init/lobby/update.old_x fetchr.tmp 8
scoreboard players set $init/lobby/update.reference_x fetchr.tmp 30000000
scoreboard players set $init/lobby/update.reference_offset fetchr.tmp 0
execute \
	store result score $init/lobby/update.reference_offset fetchr.tmp \
	run data get storage fetchr:structure structures[0].entrance_position[0]
scoreboard players operation $init/lobby/update.reference_x fetchr.tmp -= $init/lobby/update.reference_offset fetchr.tmp

execute \
	in fetchr:lobby \
	run function fetchr:init/update_lobby/remove_non_exiting_old
