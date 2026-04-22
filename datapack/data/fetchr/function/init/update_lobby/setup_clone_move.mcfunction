#> fetchr:init/update_lobby/setup_clone_move
#
# Setups a single structure and forceloads the required areas
#
# @within
#	fetchr:init/update_lobby/move_clones_back
# @context dimension fetchr:lobby

#region get new dimensions
	execute \
		store result score $init/lobby/update.new_x_overlap fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby structures[0].entrance_position[0]

	execute \
		store result score $init/lobby/update.new_y fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby structures[0].entrance_position[1]
	scoreboard players operation $init/lobby/update.new_y fetchr.tmp *= -1 fetchr.const
	scoreboard players add $init/lobby/update.new_y fetchr.tmp 3

	execute \
		store result score $init/lobby/update.new_z fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby structures[0].entrance_position[2]
	scoreboard players operation $init/lobby/update.new_z fetchr.tmp *= -1 fetchr.const
	scoreboard players add $init/lobby/update.new_z fetchr.tmp 7

	execute \
		store result score $init/lobby/update.new_size_x fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby structures[0].size[0]

	execute \
		store result score $init/lobby/update.new_size_y fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby structures[0].size[1]

	execute \
		store result score $init/lobby/update.new_size_z fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby structures[0].size[2]

	scoreboard players operation $init/lobby/update.new_x fetchr.tmp += $init/lobby/update.new_x_overlap fetchr.tmp
	scoreboard players operation $init/lobby/update.new_x fetchr.tmp -= $init/lobby/update.new_size_x fetchr.tmp
	scoreboard players operation $init/lobby/update.clone_x fetchr.tmp += $init/lobby/update.new_x_overlap fetchr.tmp
	scoreboard players operation $init/lobby/update.clone_x fetchr.tmp -= $init/lobby/update.new_size_x fetchr.tmp
#endregion

#region get old structure and dimensions
	data \
		modify storage tmp.fetchr:init/update_lobby old_structures \
		set from storage fetchr:structure structures

	function fetchr:init/update_lobby/find_old_structure

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

	execute \
		store result score $init/lobby/update.old_size_y fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby old_structures[0].size[1]
	execute \
		store result score $init/lobby/update.old_size_z fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby old_structures[0].size[2]
#endregion

#region calculate new and old coordinate offsets
	scoreboard players operation $init/lobby/update.new_high_y fetchr.tmp = $init/lobby/update.new_y fetchr.tmp
	scoreboard players operation $init/lobby/update.new_high_y fetchr.tmp += $init/lobby/update.new_size_y fetchr.tmp
	scoreboard players remove $init/lobby/update.new_high_y fetchr.tmp 1

	scoreboard players operation $init/lobby/update.new_high_z fetchr.tmp = $init/lobby/update.new_z fetchr.tmp
	scoreboard players operation $init/lobby/update.new_high_z fetchr.tmp += $init/lobby/update.new_size_z fetchr.tmp
	scoreboard players remove $init/lobby/update.new_high_z fetchr.tmp 1

	scoreboard players operation $init/lobby/update.new_high_x fetchr.tmp = $init/lobby/update.new_x fetchr.tmp
	scoreboard players operation $init/lobby/update.new_high_x fetchr.tmp += $init/lobby/update.new_size_x fetchr.tmp
	scoreboard players remove $init/lobby/update.new_high_x fetchr.tmp 1

	scoreboard players operation $init/lobby/update.old_high_y fetchr.tmp = $init/lobby/update.old_y fetchr.tmp
	scoreboard players operation $init/lobby/update.old_high_y fetchr.tmp += $init/lobby/update.old_size_y fetchr.tmp
	scoreboard players remove $init/lobby/update.old_high_y fetchr.tmp 1

	scoreboard players operation $init/lobby/update.old_high_z fetchr.tmp = $init/lobby/update.old_z fetchr.tmp
	scoreboard players operation $init/lobby/update.old_high_z fetchr.tmp += $init/lobby/update.old_size_z fetchr.tmp
	scoreboard players remove $init/lobby/update.old_high_z fetchr.tmp 1
#endregion

#region calculate combined maximum offsets
	scoreboard players operation $init/lobby/update.y fetchr.tmp = $init/lobby/update.old_y fetchr.tmp
	scoreboard players operation $init/lobby/update.y fetchr.tmp < $init/lobby/update.new_y fetchr.tmp

	scoreboard players operation $init/lobby/update.high_y fetchr.tmp = $init/lobby/update.old_high_y fetchr.tmp
	scoreboard players operation $init/lobby/update.high_y fetchr.tmp > $init/lobby/update.new_high_y fetchr.tmp

	scoreboard players operation $init/lobby/update.size_y fetchr.tmp = $init/lobby/update.high_y fetchr.tmp
	scoreboard players operation $init/lobby/update.size_y fetchr.tmp -= $init/lobby/update.y fetchr.tmp
	scoreboard players add $init/lobby/update.size_y fetchr.tmp 1

	scoreboard players operation $init/lobby/update.z fetchr.tmp = $init/lobby/update.old_z fetchr.tmp
	scoreboard players operation $init/lobby/update.z fetchr.tmp < $init/lobby/update.new_z fetchr.tmp

	scoreboard players operation $init/lobby/update.high_z fetchr.tmp = $init/lobby/update.old_high_z fetchr.tmp
	scoreboard players operation $init/lobby/update.high_z fetchr.tmp > $init/lobby/update.new_high_z fetchr.tmp

	scoreboard players operation $init/lobby/update.size_z fetchr.tmp = $init/lobby/update.old_high_z fetchr.tmp
	scoreboard players operation $init/lobby/update.size_z fetchr.tmp > $init/lobby/update.new_high_z fetchr.tmp
	scoreboard players operation $init/lobby/update.size_z fetchr.tmp -= $init/lobby/update.z fetchr.tmp
	scoreboard players add $init/lobby/update.size_z fetchr.tmp 1

	scoreboard players set $init/lobby/update.reference_x fetchr.tmp 29999999
	scoreboard players operation $init/lobby/update.reference_x fetchr.tmp -= $init/lobby/update.new_size_x fetchr.tmp
#endregion

#region forceload
	data modify storage io.fetchr:util forceload_coordinates set value [{ dimension: "fetchr:lobby" }]

	execute \
		store result storage io.fetchr:util forceload_coordinates[0].start_x int 1 \
		run scoreboard players get $init/lobby/update.new_x fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[0].end_x int 1 \
		run scoreboard players get $init/lobby/update.new_high_x fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[0].start_z int 1 \
		run scoreboard players get $init/lobby/update.z fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[0].end_z int 1 \
		run scoreboard players get $init/lobby/update.high_z fetchr.tmp

	data \
		modify storage io.fetchr:util forceload_coordinates \
		append from storage io.fetchr:util forceload_coordinates[0]
	execute \
		store result storage io.fetchr:util forceload_coordinates[1].start_x int 1 \
		run scoreboard players get $init/lobby/update.reference_x fetchr.tmp
	data modify storage io.fetchr:util forceload_coordinates[1].end_x set value 29999999

	data modify storage io.fetchr:util callback set value "fetchr:init/update_lobby/move_clone_callback"
	function fetchr:util/forceload_and_wait
#endregion