#> fetchr:init/update_lobby/remove_structure_callback
#
# Callback to remove an old structure that doesn't exist anymore after all the
# chunks in the old and reference lobby are forceloaded.
#
# @within fetchr:init/update_lobby/run
# @context dimension fetchr:lobby

execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.y int 1 \
	run scoreboard players get $init/lobby/update.old_y fetchr.tmp
scoreboard players set $init/lobby/update.y_above_barriers fetchr.tmp 3
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.y_above_barriers int 1 \
	run scoreboard players operation $init/lobby/update.y_above_barriers fetchr.tmp > $init/lobby/update.y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.z int 1 \
	run scoreboard players get $init/lobby/update.old_z fetchr.tmp

scoreboard players operation $init/lobby/update.offset_x fetchr.tmp = $init/lobby/update.old_size_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.offset_x int 1 \
	run scoreboard players remove $init/lobby/update.offset_x fetchr.tmp 1
scoreboard players operation $init/lobby/update.offset_old_x_including_overlap fetchr.tmp = $init/lobby/update.old_size_x_including_overlap fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.offset_old_x_including_overlap int 1 \
	run scoreboard players remove $init/lobby/update.offset_old_x_including_overlap fetchr.tmp 1
scoreboard players operation $init/lobby/update.offset_y fetchr.tmp = $init/lobby/update.old_size_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.offset_y int 1 \
	run scoreboard players remove $init/lobby/update.offset_y fetchr.tmp 1
scoreboard players operation $init/lobby/update.offset_y_above_barriers fetchr.tmp = $init/lobby/update.offset_y fetchr.tmp
scoreboard players operation $init/lobby/update.offset_y_above_barriers fetchr.tmp -= $init/lobby/update.y_above_barriers fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.offset_y_above_barriers int 1 \
	run scoreboard players operation $init/lobby/update.offset_y_above_barriers fetchr.tmp += $init/lobby/update.old_y fetchr.tmp
scoreboard players operation $init/lobby/update.offset_z fetchr.tmp = $init/lobby/update.old_size_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.offset_z int 1 \
	run scoreboard players remove $init/lobby/update.offset_z fetchr.tmp 1

execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.size_x int 1 \
	run scoreboard players get $init/lobby/update.old_size_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.size_y int 1 \
	run scoreboard players get $init/lobby/update.old_size_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.size_z int 1 \
	run scoreboard players get $init/lobby/update.old_size_z fetchr.tmp

execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.old_x int 1 \
	run scoreboard players get $init/lobby/update.old_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.reference_x int 1 \
	run scoreboard players get $init/lobby/update.reference_x fetchr.tmp

scoreboard players operation \
	$init/lobby/update.reference_to_old_x_offset fetchr.tmp \
	= $init/lobby/update.old_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.reference_to_old_x_offset int 1 \
	run scoreboard players operation \
		$init/lobby/update.reference_to_old_x_offset fetchr.tmp \
		-= $init/lobby/update.reference_x fetchr.tmp

execute in fetchr:lobby \
	run function fetchr:init/update_lobby/remove_structure \
		with storage tmp.fetchr:init/update_lobby update_coordinates