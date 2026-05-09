#> fetchr:init/update_lobby/setup_structure_update
#
# Setups a single structure and forceloads the required areas
#
# @within
#	fetchr:init/update_lobby/run
#	fetchr:init/update_lobby/update_structure
# @context dimension fetchr:lobby

#region get new dimensions
	data \
		modify block -30000000 3 -30000000 name \
		set from storage tmp.fetchr:init/update_lobby structures[-1].id
	setblock -30000000 4 -30000000 minecraft:redstone_block
	setblock -30000000 4 -30000000 minecraft:air

	#>
	# The x overlap with the previous structure for the new structure
	#
	# @private
	#declare score_holder $init/lobby/update.new_x_overlap
	execute \
		store result score $init/lobby/update.new_x_overlap fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby structures[-1].entrance_position[0]
	#>
	# The lower y coordinate of the new structure
	#
	# @private
	#declare score_holder $init/lobby/update.new_y
	execute \
		store result score $init/lobby/update.new_y fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby structures[-1].entrance_position[1]
	scoreboard players operation $init/lobby/update.new_y fetchr.tmp *= -1 fetchr.const
	scoreboard players add $init/lobby/update.new_y fetchr.tmp 3
	#>
	# The lower z coordinate of the new structure
	#
	# @private
	#declare score_holder $init/lobby/update.new_z
	execute \
		store result score $init/lobby/update.new_z fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby structures[-1].entrance_position[2]
	scoreboard players operation $init/lobby/update.new_z fetchr.tmp *= -1 fetchr.const
	scoreboard players add $init/lobby/update.new_z fetchr.tmp 7

	#>
	# The x-size of the new structure.
	#
	# @private
	#declare score_holder $init/lobby/update.new_size_x
	execute \
		store result score $init/lobby/update.new_size_x_including_overlap fetchr.tmp \
		run data get block -30000000 3 -30000000 sizeX
	#>
	# The y-size of the new structure.
	#
	# @private
	#declare score_holder $init/lobby/update.new_size_y
	execute \
		store result score $init/lobby/update.new_size_y fetchr.tmp \
		run data get block -30000000 3 -30000000 sizeY
	#>
	# The z-size of the new structure.
	#
	# @private
	#declare score_holder $init/lobby/update.new_size_z
	execute \
		store result score $init/lobby/update.new_size_z fetchr.tmp \
		run data get block -30000000 3 -30000000 sizeZ

	# Do not compare overlap with the previous structure.
	# Overlapping structure parts must be empty of blocks right now.
	scoreboard players operation $init/lobby/update.new_size_x fetchr.tmp = $init/lobby/update.new_size_x_including_overlap fetchr.tmp
	execute \
		if data storage tmp.fetchr:init/update_lobby structures[1] \
		run scoreboard players operation $init/lobby/update.new_size_x fetchr.tmp -= $init/lobby/update.new_x_overlap fetchr.tmp
	execute \
		if score $init/lobby/update.new_size_x fetchr.tmp matches ..-1 \
		run scoreboard players set $init/lobby/update.new_size_x fetchr.tmp 0
#endregion

#region get old structure and dimensions
	data \
		modify storage tmp.fetchr:init/update_lobby old_structures \
		set from storage fetchr:structure structures

	#>
	# The start x position of the old structure which is currently spawned.
	#
	# @within
	# 	function fetchr:init/update_lobby/update_structure
	# 	function fetchr:init/update_lobby/find_old_structure
	#declare score_holder $init/lobby/update.old_x
	scoreboard players set $init/lobby/update.old_x fetchr.tmp 8

	function fetchr:init/update_lobby/find_old_structure

	#>
	# The x overlap with the previous structure for the old structure
	#
	# @private
	#declare score_holder $init/lobby/update.old_x_overlap
	execute \
		store result score $init/lobby/update.old_x_overlap fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby structures[-1].entrance_position[0]
	#>
	# The lower y coordinate of the old structure
	#
	# @private
	#declare score_holder $init/lobby/update.old_y
	execute \
		store result score $init/lobby/update.old_y fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby old_structures[0].entrance_position[1]
	scoreboard players operation $init/lobby/update.old_y fetchr.tmp *= -1 fetchr.const
	scoreboard players add $init/lobby/update.old_y fetchr.tmp 3
	#>
	# The lower z coordinate of the old structure
	#
	# @private
	#declare score_holder $init/lobby/update.old_z
	execute \
		store result score $init/lobby/update.old_z fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby old_structures[0].entrance_position[2]
	scoreboard players operation $init/lobby/update.old_z fetchr.tmp *= -1 fetchr.const
	scoreboard players add $init/lobby/update.old_z fetchr.tmp 7
	#>
	# The x-size of the old structure.
	#
	# @private
	#declare score_holder $init/lobby/update.old_size_x
	execute \
		store result score $init/lobby/update.old_size_x_including_overlap fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby old_structures[0].size[0]
	# Do not compare overlap with the previous structure.
	# Overlapping structure parts must be empty of blocks right now.
	scoreboard players operation $init/lobby/update.old_size_x fetchr.tmp = $init/lobby/update.old_size_x_including_overlap fetchr.tmp
	execute \
		if data storage tmp.fetchr:init/update_lobby structures[1] \
		run scoreboard players operation $init/lobby/update.old_size_x fetchr.tmp -= $init/lobby/update.old_x_overlap fetchr.tmp
	execute \
		if score $init/lobby/update.old_size_x fetchr.tmp matches ..-1 \
		run scoreboard players set $init/lobby/update.old_size_x fetchr.tmp 0
	#>
	# The y-size of the old structure.
	#
	# @private
	#declare score_holder $init/lobby/update.old_size_y
	execute \
		store result score $init/lobby/update.old_size_y fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby old_structures[0].size[1]
	#>
	# The z-size of the old structure.
	#
	# @private
	#declare score_holder $init/lobby/update.old_size_z
	execute \
		store result score $init/lobby/update.old_size_z fetchr.tmp \
		run data get storage tmp.fetchr:init/update_lobby old_structures[0].size[2]
#endregion

#region calculate new and old coordinate offsets
	#>
	# The high y coordinate of the new structure
	#
	# @private
	#declare score_holder $init/lobby/update.new_high_y
	scoreboard players operation $init/lobby/update.new_high_y fetchr.tmp = $init/lobby/update.new_y fetchr.tmp
	scoreboard players operation $init/lobby/update.new_high_y fetchr.tmp += $init/lobby/update.new_size_y fetchr.tmp
	scoreboard players remove $init/lobby/update.new_high_y fetchr.tmp 1
	#>
	# The high z coordinate of the new structure
	#
	# @private
	#declare score_holder $init/lobby/update.new_high_z
	scoreboard players operation $init/lobby/update.new_high_z fetchr.tmp = $init/lobby/update.new_z fetchr.tmp
	scoreboard players operation $init/lobby/update.new_high_z fetchr.tmp += $init/lobby/update.new_size_z fetchr.tmp
	scoreboard players remove $init/lobby/update.new_high_z fetchr.tmp 1

	#>
	# The high x coordinate of the old structure
	#
	# @private
	#declare score_holder $init/lobby/update.old_high_x
	scoreboard players operation $init/lobby/update.old_high_x fetchr.tmp = $init/lobby/update.old_x fetchr.tmp
	scoreboard players operation $init/lobby/update.old_high_x fetchr.tmp += $init/lobby/update.old_size_x_including_overlap fetchr.tmp
	scoreboard players remove $init/lobby/update.old_high_x fetchr.tmp 1
	#>
	# The high y coordinate of the old structure
	#
	# @private
	#declare score_holder $init/lobby/update.old_high_y
	scoreboard players operation $init/lobby/update.old_high_y fetchr.tmp = $init/lobby/update.old_y fetchr.tmp
	scoreboard players operation $init/lobby/update.old_high_y fetchr.tmp += $init/lobby/update.old_size_y fetchr.tmp
	scoreboard players remove $init/lobby/update.old_high_y fetchr.tmp 1
	#>
	# The high z coordinate of the old structure
	#
	# @private
	#declare score_holder $init/lobby/update.old_high_z
	scoreboard players operation $init/lobby/update.old_high_z fetchr.tmp = $init/lobby/update.old_z fetchr.tmp
	scoreboard players operation $init/lobby/update.old_high_z fetchr.tmp += $init/lobby/update.old_size_z fetchr.tmp
	scoreboard players remove $init/lobby/update.old_high_z fetchr.tmp 1
#endregion

#region calculate combined maximum offsets
	#>
	# The lower y coordinate, picking the lower one from either old or new
	#
	# @private
	#declare score_holder $init/lobby/update.y
	scoreboard players operation $init/lobby/update.y fetchr.tmp = $init/lobby/update.old_y fetchr.tmp
	scoreboard players operation $init/lobby/update.y fetchr.tmp < $init/lobby/update.new_y fetchr.tmp
	#>
	# The higher y coordinate, picking the higher one from either old or new
	#
	# @private
	#declare score_holder $init/lobby/update.high_y
	scoreboard players operation $init/lobby/update.high_y fetchr.tmp = $init/lobby/update.old_high_y fetchr.tmp
	scoreboard players operation $init/lobby/update.high_y fetchr.tmp > $init/lobby/update.new_high_y fetchr.tmp
	#>
	# The higher y size
	#
	# @private
	#declare score_holder $init/lobby/update.size_y
	scoreboard players operation $init/lobby/update.size_y fetchr.tmp = $init/lobby/update.high_y fetchr.tmp
	scoreboard players operation $init/lobby/update.size_y fetchr.tmp -= $init/lobby/update.y fetchr.tmp
	scoreboard players add $init/lobby/update.size_y fetchr.tmp 1

	#>
	# The lower z coordinate, picking the lower one from either old or new
	#
	# @private
	#declare score_holder $init/lobby/update.z
	scoreboard players operation $init/lobby/update.z fetchr.tmp = $init/lobby/update.old_z fetchr.tmp
	scoreboard players operation $init/lobby/update.z fetchr.tmp < $init/lobby/update.new_z fetchr.tmp
	#>
	# The higher z coordinate, picking the higher one from either old or new
	#
	# @private
	#declare score_holder $init/lobby/update.high_z
	scoreboard players operation $init/lobby/update.high_z fetchr.tmp = $init/lobby/update.old_high_z fetchr.tmp
	scoreboard players operation $init/lobby/update.high_z fetchr.tmp > $init/lobby/update.new_high_z fetchr.tmp
	#>
	# The higher z size
	#
	# @private
	#declare score_holder $init/lobby/update.size_z
	scoreboard players operation $init/lobby/update.size_z fetchr.tmp = $init/lobby/update.old_high_z fetchr.tmp
	scoreboard players operation $init/lobby/update.size_z fetchr.tmp > $init/lobby/update.new_high_z fetchr.tmp
	scoreboard players operation $init/lobby/update.size_z fetchr.tmp -= $init/lobby/update.z fetchr.tmp
	scoreboard players add $init/lobby/update.size_z fetchr.tmp 1

	#>
	# The reference low x coordinate
	#
	# @private
	#declare score_holder $init/lobby/update.reference_x
	scoreboard players operation $init/lobby/update.reference_x fetchr.tmp = $init/lobby/update.old_x fetchr.tmp
	scoreboard players add $init/lobby/update.reference_x fetchr.tmp 29999999
	scoreboard players operation $init/lobby/update.reference_x fetchr.tmp -= $init/lobby/update.old_lobby_start fetchr.tmp
	#>
	# The reference high x coordinate
	#
	# @private
	#declare score_holder $init/lobby/update.reference_high_x
	scoreboard players operation $init/lobby/update.reference_high_x fetchr.tmp = $init/lobby/update.reference_x fetchr.tmp
	scoreboard players operation $init/lobby/update.reference_high_x fetchr.tmp += $init/lobby/update.old_size_x_including_overlap fetchr.tmp
	scoreboard players remove $init/lobby/update.reference_high_x fetchr.tmp 1

	#>
	# The clone high x coordinate
	#
	# @private
	#declare score_holder $init/lobby/update.clone_high_x
	scoreboard players operation $init/lobby/update.clone_high_x fetchr.tmp = $init/lobby/update.clone_x fetchr.tmp
	scoreboard players operation $init/lobby/update.clone_high_x fetchr.tmp += $init/lobby/update.new_size_x_including_overlap fetchr.tmp
	scoreboard players remove $init/lobby/update.clone_high_x fetchr.tmp 1

	#>
	# The compare high x coordinate
	#
	# @private
	#declare score_holder $init/lobby/update.compare_high_x
	scoreboard players set $init/lobby/update.compare_high_x fetchr.tmp -30000000
	scoreboard players operation $init/lobby/update.compare_high_x fetchr.tmp += $init/lobby/update.new_size_x_including_overlap fetchr.tmp
	#>
	# The compare high z coordinate
	#
	# @private
	#declare score_holder $init/lobby/update.compare_high_z
	scoreboard players set $init/lobby/update.compare_high_z fetchr.tmp -30000001
	scoreboard players operation $init/lobby/update.compare_high_z fetchr.tmp += $init/lobby/update.size_z fetchr.tmp
#endregion

#region Set new structure
	data \
		modify storage tmp.fetchr:init/update_lobby new_structures \
		prepend from storage tmp.fetchr:init/update_lobby structures[-1]
	
	data modify storage tmp.fetchr:init/update_lobby new_structures[0].size set value [I;0,0,0]
	execute \
		store result storage tmp.fetchr:init/update_lobby new_structures[0].size[0] int 1 \
		run scoreboard players get $init/lobby/update.new_size_x_including_overlap fetchr.tmp
	execute \
		store result storage tmp.fetchr:init/update_lobby new_structures[0].size[1] int 1 \
		run scoreboard players get $init/lobby/update.new_size_y fetchr.tmp
	execute \
		store result storage tmp.fetchr:init/update_lobby new_structures[0].size[2] int 1 \
		run scoreboard players get $init/lobby/update.new_size_z fetchr.tmp
#endregion

#region forceload
	data modify storage io.fetchr:util forceload_coordinates set value [\
		{ dimension: "fetchr:lobby" },\
		{ dimension: "fetchr:lobby" },\
		{ dimension: "fetchr:lobby" },\
		{ dimension: "fetchr:lobby", start_x: -29999999, start_z: -30000000 }\
	]

	execute \
		store result storage io.fetchr:util forceload_coordinates[0].start_x int 1 \
		run scoreboard players get $init/lobby/update.old_x fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[0].end_x int 1 \
		run scoreboard players get $init/lobby/update.old_high_x fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[0].start_z int 1 \
		run scoreboard players get $init/lobby/update.z fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[0].end_z int 1 \
		run scoreboard players get $init/lobby/update.high_z fetchr.tmp

	data \
		modify storage io.fetchr:util forceload_coordinates[1] \
		set from storage io.fetchr:util forceload_coordinates[0]
	execute \
		store result storage io.fetchr:util forceload_coordinates[1].start_x int 1 \
		run scoreboard players get $init/lobby/update.reference_x fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[1].end_x int 1 \
		run scoreboard players get $init/lobby/update.reference_high_x fetchr.tmp

	data \
		modify storage io.fetchr:util forceload_coordinates[2] \
		set from storage io.fetchr:util forceload_coordinates[0]
	execute \
		store result storage io.fetchr:util forceload_coordinates[2].start_x int 1 \
		run scoreboard players get $init/lobby/update.clone_x fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[2].end_x int 1 \
		run scoreboard players get $init/lobby/update.clone_high_x fetchr.tmp

	data \
		modify storage io.fetchr:util forceload_coordinates[3] \
		set from storage io.fetchr:util forceload_coordinates[0]
	execute \
		store result storage io.fetchr:util forceload_coordinates[3].end_x int 1 \
		run scoreboard players get $init/lobby/update.compare_high_x fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[3].end_z int 1 \
		run scoreboard players get $init/lobby/update.compare_high_z fetchr.tmp

	data modify storage io.fetchr:util callback set value "fetchr:init/update_lobby/update_structure_callback"
	function fetchr:util/forceload_and_wait
#endregion