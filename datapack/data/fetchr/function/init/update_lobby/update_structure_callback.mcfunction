#> fetchr:init/update_lobby/update_structure_callback
#
# Callback to run after all the chunks are forceloaded.
#
# @within fetchr:init/update_lobby/setup_structure

scoreboard players set $init/lobby/update.compare_z_position fetchr.tmp -30000000
scoreboard players operation $init/lobby/update.compare_z_position fetchr.tmp -= $init/lobby/update.old_z fetchr.tmp
scoreboard players operation $init/lobby/update.compare_z_position fetchr.tmp += $init/lobby/update.new_z fetchr.tmp
execute \
	if score $init/lobby/update.compare_z_position fetchr.tmp matches ..-30000001 \
	run scoreboard players set $init/lobby/update.compare_z_position fetchr.tmp -30000000

scoreboard players operation $init/lobby/update.x_diff fetchr.tmp = $init/lobby/update.old_size_x fetchr.tmp
scoreboard players operation $init/lobby/update.x_diff fetchr.tmp -= $init/lobby/update.new_size_x fetchr.tmp
execute \
	if score $init/lobby/update.x_diff fetchr.tmp matches 1.. \
	run scoreboard players operation $init/lobby/update.old_x fetchr.tmp += $init/lobby/update.x_diff fetchr.tmp
execute \
	if score $init/lobby/update.x_diff fetchr.tmp matches 1.. \
	run scoreboard players operation $init/lobby/update.old_high_x fetchr.tmp -= $init/lobby/update.x_diff fetchr.tmp
execute \
	if score $init/lobby/update.x_diff fetchr.tmp matches ..-1 \
	run scoreboard players operation $init/lobby/update.clone_x fetchr.tmp -= $init/lobby/update.x_diff fetchr.tmp
execute \
	if score $init/lobby/update.x_diff fetchr.tmp matches ..-1 \
	run scoreboard players operation $init/lobby/update.clone_high_x fetchr.tmp += $init/lobby/update.x_diff fetchr.tmp

data modify storage tmp.fetchr:init/structures update_coordinates set value {}
data \
	modify storage tmp.fetchr:init/structures update_coordinates.structure_id \
	set from storage tmp.fetchr:init/structures structures[-1].id
execute \
	store result storage tmp.fetchr:init/structures update_coordinates.compare_z int 1 \
	run scoreboard players get $init/lobby/update.compare_z_position fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures update_coordinates.compare_y int 1 \
	run scoreboard players get $init/lobby/update.new_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures update_coordinates.old_x int 1 \
	run scoreboard players get $init/lobby/update.old_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures update_coordinates.old_y int 1 \
	run scoreboard players get $init/lobby/update.old_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures update_coordinates.old_z int 1 \
	run scoreboard players get $init/lobby/update.old_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures update_coordinates.old_high_x int 1 \
	run scoreboard players get $init/lobby/update.old_high_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures update_coordinates.old_high_y int 1 \
	run scoreboard players get $init/lobby/update.old_high_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures update_coordinates.old_high_z int 1 \
	run scoreboard players get $init/lobby/update.old_high_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures update_coordinates.clone_x int 1 \
	run scoreboard players get $init/lobby/update.clone_x fetchr.tmp

execute \
	in fetchr:lobby \
	run function fetchr:init/update_lobby/update_structure \
		with storage tmp.fetchr:init/structures update_coordinates