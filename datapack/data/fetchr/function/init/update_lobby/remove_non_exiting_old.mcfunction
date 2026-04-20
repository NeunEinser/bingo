#> fetchr:init/update_lobby/remove_non_exiting_old
#
# Removes old structures that used to exist, but have been removed.
#
# @within fetchr:init/update_lobby/run
# @context dimension fetchr:lobby

execute \
	store result score $init/lobby/update.old_size_x fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby old_structures[0].size[0]
scoreboard players operation $init/lobby/update.old_x fetchr.tmp -= $init/lobby/update.old_size_x fetchr.tmp
scoreboard players operation $init/lobby/update.reference_x fetchr.tmp -= $init/lobby/update.old_size_x fetchr.tmp
execute \
	store result score $init/lobby/update.old_x_overlap fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby old_structures[0].entrance_position[0]
scoreboard players operation $init/lobby/update.old_x fetchr.tmp += $init/lobby/update.old_x_overlap fetchr.tmp
scoreboard players operation $init/lobby/update.reference_x fetchr.tmp += $init/lobby/update.old_x_overlap fetchr.tmp

scoreboard players set $init/lobby/update.should_remove fetchr.tmp 1

data \
	modify storage tmp.fetchr:init/update_lobby structures \
	set from storage fetchr:registries structures

data modify storage tmp.fetchr:init/update_lobby structures append value {\
	id: "fetchr:lobby_end",\
	entrance_position: [I; 1, 0, 1],\
	version: 1\
}
function fetchr:init/update_lobby/find_new_structure

execute \
	if score $init/lobby/update.should_remove fetchr.tmp matches 0 \
	run data remove storage tmp.fetchr:init/update_lobby old_structures[0]

execute \
	if score $init/lobby/update.should_remove fetchr.tmp matches 0 \
	unless data storage tmp.fetchr:init/update_lobby old_structures[0] \
	run return run function fetchr:init/update_lobby/update_structures
execute \
	if score $init/lobby/update.should_remove fetchr.tmp matches 0 \
	run return run function fetchr:init/update_lobby/remove_non_exiting_old

execute \
	store result score $init/lobby/update.old_y fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby old_structures[0].entrance_position[1]
scoreboard players operation $init/lobby/update.old_y fetchr.tmp *= -1 fetchr.const
scoreboard players add $init/lobby/update.old_y fetchr.tmp 3

execute \
	store result score $init/lobby/update.old_z fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby old_structures[0].entrance_position[2]
scoreboard players operation $init/lobby/update.old_z fetchr.tmp *= -1 fetchr.const
scoreboard players add $init/lobby/update.old_z fetchr.tmp 7

# scoreboard players operation $init/lobby/update.old_size_x fetchr.tmp -= $init/lobby/update.old_x_overlap fetchr.tmp
execute \
	store result score $init/lobby/update.old_size_y fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby old_structures[0].size[1]
execute \
	store result score $init/lobby/update.old_size_z fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby old_structures[0].size[2]

scoreboard players operation $init/lobby/update.old_high_x fetchr.tmp = $init/lobby/update.old_x fetchr.tmp
scoreboard players operation $init/lobby/update.old_high_x fetchr.tmp += $init/lobby/update.old_size_x fetchr.tmp
scoreboard players remove $init/lobby/update.old_high_x fetchr.tmp 1

scoreboard players operation $init/lobby/update.reference_high_x fetchr.tmp = $init/lobby/update.reference_x fetchr.tmp
scoreboard players operation $init/lobby/update.reference_high_x fetchr.tmp += $init/lobby/update.old_size_x fetchr.tmp
scoreboard players remove $init/lobby/update.reference_high_x fetchr.tmp 1

scoreboard players operation $init/lobby/update.old_high_y fetchr.tmp = $init/lobby/update.old_y fetchr.tmp
scoreboard players operation $init/lobby/update.old_high_y fetchr.tmp += $init/lobby/update.old_size_y fetchr.tmp
scoreboard players remove $init/lobby/update.old_high_y fetchr.tmp 1

scoreboard players operation $init/lobby/update.old_high_z fetchr.tmp = $init/lobby/update.old_z fetchr.tmp
scoreboard players operation $init/lobby/update.old_high_z fetchr.tmp += $init/lobby/update.old_size_z fetchr.tmp
scoreboard players remove $init/lobby/update.old_high_z fetchr.tmp 1

data modify storage io.fetchr:util forceload_coordinates set value [{ dimension: "fetchr:lobby" }]

execute \
	store result storage io.fetchr:util forceload_coordinates[0].start_x int 1 \
	run scoreboard players get $init/lobby/update.old_x fetchr.tmp
execute \
	store result storage io.fetchr:util forceload_coordinates[0].end_x int 1 \
	run scoreboard players get $init/lobby/update.old_high_x fetchr.tmp
execute \
	store result storage io.fetchr:util forceload_coordinates[0].start_z int 1 \
	run scoreboard players get $init/lobby/update.old_z fetchr.tmp
execute \
	store result storage io.fetchr:util forceload_coordinates[0].end_z int 1 \
	run scoreboard players get $init/lobby/update.old_high_z fetchr.tmp

data \
	modify storage io.fetchr:util forceload_coordinates \
	append from storage io.fetchr:util forceload_coordinates[0]
execute \
	store result storage io.fetchr:util forceload_coordinates[1].start_x int 1 \
	run scoreboard players get $init/lobby/update.reference_x fetchr.tmp
execute \
	store result storage io.fetchr:util forceload_coordinates[1].end_x int 1 \
	run scoreboard players get $init/lobby/update.reference_high_x fetchr.tmp

data modify storage io.fetchr:util callback set value "fetchr:init/update_lobby/remove_structure_callback"

function fetchr:util/forceload_and_wait