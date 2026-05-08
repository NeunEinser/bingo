#> fetchr:init/update_lobby/move_clone_callback
#
#  Callback to run after all the chunks are forceloaded.
#
# @within
#	function fetchr:init/update_lobby/setup_clone_move

execute \
	store result storage tmp.fetchr:init/update_lobby move_back_coordinates.y int 1 \
	run scoreboard players get $init/lobby/update.y fetchr.tmp
scoreboard players set $init/lobby/update.y_above_barriers fetchr.tmp 3
execute \
	store result storage tmp.fetchr:init/update_lobby move_back_coordinates.y_above_barriers int 1 \
	run scoreboard players operation $init/lobby/update.y_above_barriers fetchr.tmp > $init/lobby/update.y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby move_back_coordinates.z int 1 \
	run scoreboard players get $init/lobby/update.z fetchr.tmp

scoreboard players operation $init/lobby/update.offset_x fetchr.tmp = $init/lobby/update.new_size_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby move_back_coordinates.offset_x int 1 \
	run scoreboard players remove $init/lobby/update.offset_x fetchr.tmp 1

scoreboard players operation $init/lobby/update.offset_y fetchr.tmp = $init/lobby/update.size_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby move_back_coordinates.offset_y int 1 \
	run scoreboard players remove $init/lobby/update.offset_y fetchr.tmp 1

scoreboard players operation $init/lobby/update.offset_y_above_barriers fetchr.tmp = $init/lobby/update.offset_y fetchr.tmp
scoreboard players operation $init/lobby/update.offset_y_above_barriers fetchr.tmp -= $init/lobby/update.y_above_barriers fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby move_back_coordinates.offset_y_above_barriers int 1 \
	run scoreboard players operation $init/lobby/update.offset_y_above_barriers fetchr.tmp += $init/lobby/update.y fetchr.tmp

scoreboard players operation $init/lobby/update.offset_z fetchr.tmp = $init/lobby/update.size_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby move_back_coordinates.offset_z int 1 \
	run scoreboard players remove $init/lobby/update.offset_z fetchr.tmp 1

execute \
	store result storage tmp.fetchr:init/update_lobby move_back_coordinates.new_x int 1 \
	run scoreboard players get $init/lobby/update.new_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby move_back_coordinates.clone_x int 1 \
	run scoreboard players get $init/lobby/update.clone_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby move_back_coordinates.reference_x int 1 \
	run scoreboard players get $init/lobby/update.reference_x fetchr.tmp

scoreboard players operation $init/lobby/update.clone_to_new_x_offset fetchr.tmp = $init/lobby/update.new_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby move_back_coordinates.clone_to_new_x_offset int 1 \
	run scoreboard players operation $init/lobby/update.clone_to_new_x_offset fetchr.tmp -= $init/lobby/update.clone_x fetchr.tmp

function fetchr:init/update_lobby/move_clone \
	with storage tmp.fetchr:init/update_lobby move_back_coordinates