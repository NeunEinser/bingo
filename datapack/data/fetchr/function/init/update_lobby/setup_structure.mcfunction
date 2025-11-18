#> fetchr:init/update_lobby/setup_structure
#
# Setups a single structure and forceloads the required areas
#
# @within
#	fetchr:init/update_lobby/run
#	fetchr:init/update_lobby/update_structure
# @context dimension fetchr:lobby

#region get new dimensions 
	#>
	# The x overlap with the previous structure for the new structure
	#
	# @private
	#declare score_holder $init/lobby/update.new_x_overlap
	execute \
		store result score $init/lobby/update.new_x_overlap fetchr.tmp \
		run data get storage tmp.fetchr:init/structures structures[-1].entrance_position[0]
	#>
	# The negative y offset releative from the structure block from the new
	# strucuture
	#
	# @private
	#declare score_holder $init/lobby/update.new_negative_y
	execute \
		store result score $init/lobby/update.new_negative_y fetchr.tmp \
		run data get storage tmp.fetchr:init/structures structures[-1].entrance_position[1]
	scoreboard players operation $init/lobby/update.new_negative_y fetchr.tmp *= -1 fetchr.const
	#>
	# The negative z offset releative from the structure block from the new
	# strucuture
	#
	# @private
	#declare score_holder $init/lobby/update.new_negative_z
	execute \
		store result score $init/lobby/update.new_negative_z fetchr.tmp \
		run data get storage tmp.fetchr:init/structures structures[-1].entrance_position[2]
	scoreboard players operation $init/lobby/update.new_negative_z fetchr.tmp *= -1 fetchr.const

	execute \
		store result block -30000000 3 -30000000 posY int 1 \
		run scoreboard players get $init/lobby/update.new_negative_y fetchr.tmp

	data \
		modify block -30000000 3 -30000000 name \
		set from storage tmp.fetchr:init/structures structures[-1].id
	setblock -30000000 4 -30000000 minecraft:redstone_block
	setblock -30000000 4 -30000000 minecraft:air

	#>
	# The x-size of the new structure.
	#
	# @private
	#declare score_holder $init/lobby/update.new_size_x
	execute \
		store result score $init/lobby/update.new_size_x fetchr.tmp \
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

	data modify storage tmp.fetchr:init/structures structures[-1].size set value [I; 0, 0, 0]
	execute \
		store result storage tmp.fetchr:init/structures structures[-1].size[0] int 1 \
		run scoreboard players get $init/lobby/update.new_size_x fetchr.tmp
	execute \
		store result storage tmp.fetchr:init/structures structures[-1].size[1] int 1 \
		run scoreboard players get $init/lobby/update.new_size_y fetchr.tmp
	execute \
		store result storage tmp.fetchr:init/structures structures[-1].size[2] int 1 \
		run scoreboard players get $init/lobby/update.new_size_z fetchr.tmp
#endregion

#region get old structure and dimensions
	data \
		modify storage tmp.fetchr:init/structures old_structures \
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
		run data get storage tmp.fetchr:init/structures structures[-1].entrance_position[0]
	#>
	# The negative y offset releative from the structure block from the old
	# strucuture
	#
	# @private
	#declare score_holder $init/lobby/update.old_negative_y
	execute \
		store result score $init/lobby/update.old_negative_y fetchr.tmp \
		run data get storage tmp.fetchr:init/structures structures[-1].entrance_position[1]
	scoreboard players operation $init/lobby/update.old_negative_y fetchr.tmp *= -1 fetchr.const
	#>
	# The negative z offset releative from the structure block from the old
	# strucuture
	#
	# @private
	#declare score_holder $init/lobby/update.old_negative_z
	execute \
		store result score $init/lobby/update.old_negative_z fetchr.tmp \
		run data get storage tmp.fetchr:init/structures structures[-1].entrance_position[2]
	scoreboard players operation $init/lobby/update.old_negative_z fetchr.tmp *= -1 fetchr.const
	#>
	# The x-size of the old structure.
	#
	# @private
	#declare score_holder $init/lobby/update.old_size_x
	execute \
		store result score $init/lobby/update.old_size_x fetchr.tmp \
		run data get storage tmp.fetchr:init/structures old_structures[0].size[0]
	#>
	# The y-size of the old structure.
	#
	# @private
	#declare score_holder $init/lobby/update.old_size_y
	execute \
		store result score $init/lobby/update.old_size_y fetchr.tmp \
		run data get storage tmp.fetchr:init/structures old_structures[0].size[1]
	#>
	# The z-size of the old structure.
	#
	# @private
	#declare score_holder $init/lobby/update.old_size_z
	execute \
		store result score $init/lobby/update.old_size_x fetchr.tmp \
		run data get storage tmp.fetchr:init/structures old_structures[0].size[2]
#endregion

#region calculate new and old coordinate offsets (new/old positive and old negative)
	#>
	# The positive x offset releative from the structure block from the new
	# strucuture
	#
	# @private
	#declare score_holder $init/lobby/update.new_positive_x
	scoreboard players operation $init/lobby/update.new_positive_x fetchr.tmp = $init/lobby/update.new_size_x fetchr.tmp
	scoreboard players remove $init/lobby/update.new_positive_x fetchr.tmp 1
	# Do not compare overlap with the previous structure.
	# Overlapping structure parts must be empty of blocks right now.
	execute \
		if data storage tmp.fetchr:init/structures structures[2] \
		run scoreboard players operation $init/lobby/update.new_positive_x fetchr.tmp -= $init/lobby/update.new_x_overlap fetchr.tmp
	#>
	# The positive y offset releative from the structure block from the new
	# strucuture
	#
	# @private
	#declare score_holder $init/lobby/update.new_positive_y
	scoreboard players operation $init/lobby/update.new_positive_y fetchr.tmp = $init/lobby/update.new_negative_y fetchr.tmp
	scoreboard players remove $init/lobby/update.new_positive_y fetchr.tmp 1
	scoreboard players operation $init/lobby/update.new_positive_y fetchr.tmp += $init/lobby/update.new_size_y fetchr.tmp
	#>
	# The positive z offset releative from the structure block from the new
	# strucuture
	#
	# @private
	#declare score_holder $init/lobby/update.new_positive_z
	scoreboard players operation $init/lobby/update.new_positive_z fetchr.tmp = $init/lobby/update.new_negative_z fetchr.tmp
	scoreboard players remove $init/lobby/update.new_positive_z fetchr.tmp 1
	scoreboard players operation $init/lobby/update.new_positive_z fetchr.tmp += $init/lobby/update.new_size_z fetchr.tmp

	#>
	# The positive x offset releative from the structure block from the old
	# strucuture
	#
	# @private
	#declare score_holder $init/lobby/update.old_positive_x
	scoreboard players operation $init/lobby/update.old_positive_x fetchr.tmp = $init/lobby/update.old_size_x fetchr.tmp
	scoreboard players remove $init/lobby/update.old_positive_x fetchr.tmp 1
	# Do not compare overlap with the previous structure.
	# Overlapping structure parts must be empty. The exception is the fist structure
	# in the list which may be offset around the origin.
	execute \
		if data storage tmp.fetchr:init/structures structures[2] \
		run scoreboard players operation $init/lobby/update.old_positive_x fetchr.tmp -= $init/lobby/update.old_x_overlap fetchr.tmp
	#>
	# The positive y offset releative from the structure block from the old
	# strucuture
	#
	# @private
	#declare score_holder $init/lobby/update.old_positive_y
	scoreboard players operation $init/lobby/update.old_positive_y fetchr.tmp = $init/lobby/update.old_negative_y fetchr.tmp
	scoreboard players operation $init/lobby/update.old_positive_y fetchr.tmp += $init/lobby/update.old_size_y fetchr.tmp
	scoreboard players remove $init/lobby/update.old_positive_y fetchr.tmp 1
	#>
	# The positive z offset releative from the structure block from the old
	# strucuture
	#
	# @private
	#declare score_holder $init/lobby/update.old_positive_z
	scoreboard players operation $init/lobby/update.old_positive_z fetchr.tmp = $init/lobby/update.old_negative_z fetchr.tmp
	scoreboard players operation $init/lobby/update.old_positive_z fetchr.tmp += $init/lobby/update.old_size_z fetchr.tmp
	scoreboard players remove $init/lobby/update.old_positive_z fetchr.tmp 1

	#>
	# The positive z offset releative from the structure block from the old
	# strucuture
	#
	# @private
	#declare score_holder $init/lobby/update.old_positive_z
	scoreboard players operation $init/lobby/update.old_positive_z fetchr.tmp = $init/lobby/update.old_negative_z fetchr.tmp
	scoreboard players operation $init/lobby/update.old_positive_z fetchr.tmp += $init/lobby/update.old_size_z fetchr.tmp
	scoreboard players remove $init/lobby/update.old_positive_z fetchr.tmp 1
#endregion

#region calculate combined maximum offsets
	#>
	# The higher positive x offset between new and old
	#
	# @private
	#declare score_holder $init/lobby/update.positive_x
	scoreboard players operation $init/lobby/update.positive_x fetchr.tmp = $init/lobby/update.positive_x fetchr.tmp
	scoreboard players operation $init/lobby/update.positive_x fetchr.tmp > $init/lobby/update.positive_x fetchr.tmp

	#>
	# The higher negative y offset between new and old
	#
	# @private
	#declare score_holder $init/lobby/update.negative_y
	scoreboard players operation $init/lobby/update.negative_y fetchr.tmp = $init/lobby/update.old_negative_y fetchr.tmp
	scoreboard players operation $init/lobby/update.negative_y fetchr.tmp < $init/lobby/update.new_negative_y fetchr.tmp
	#>
	# The higher positive y offset between new and old
	#
	# @private
	#declare score_holder $init/lobby/update.positive_y
	scoreboard players operation $init/lobby/update.positive_y fetchr.tmp = $init/lobby/update.old_positive_y fetchr.tmp
	scoreboard players operation $init/lobby/update.positive_y fetchr.tmp > $init/lobby/update.new_positive_y fetchr.tmp
	#>
	# The combined y size
	#
	# @private
	#declare score_holder $init/lobby/update.size_y
	scoreboard players operation $init/lobby/update.size_y fetchr.tmp = $init/lobby/update.positive_y fetchr.tmp
	scoreboard players operation $init/lobby/update.size_y fetchr.tmp -= $init/lobby/update.negative_y fetchr.tmp

	#>
	# The higher negative z offset between new and old
	#
	# @private
	#declare score_holder $init/lobby/update.negative_z
	scoreboard players operation $init/lobby/update.negative_z fetchr.tmp = $init/lobby/update.old_negative_z fetchr.tmp
	scoreboard players operation $init/lobby/update.negative_z fetchr.tmp < $init/lobby/update.new_negative_z fetchr.tmp
	#>
	# The higher positive z offset between new and old
	#
	# @private
	#declare score_holder $init/lobby/update.positive_z
	scoreboard players operation $init/lobby/update.positive_z fetchr.tmp = $init/lobby/update.old_positive_z fetchr.tmp
	scoreboard players operation $init/lobby/update.positive_z fetchr.tmp > $init/lobby/update.new_positive_z fetchr.tmp
	#>
	# The combined z size
	#
	# @private
	#declare score_holder $init/lobby/update.size_z
	scoreboard players operation $init/lobby/update.size_z fetchr.tmp = $init/lobby/update.positive_z fetchr.tmp
	scoreboard players operation $init/lobby/update.size_z fetchr.tmp -= $init/lobby/update.negative_z fetchr.tmp
#endregion

#region forceload
	data modify storage io.fetchr:util forceload_coordinates set value [\
		{ dimension: "fetchr:lobby", start_z: 7, negative_x: 0 },\
		{ dimension: "fetchr:lobby", start_z: 7, negative_x: 0 },\
		{ dimension: "fetchr:lobby", start_z: 7, negative_x: 0 },\
		{ dimension: "fetchr:lobby", start_x: -30000000, start_z: -30000000, negative_x: 0, negative_z: 0 }\
	]

	execute \
		store result storage io.fetchr:util forceload_coordinates[0].start_x int 1 \
		run scoreboard players get $init/lobby/update.old_x fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[0].positive_x int 1 \
		run scoreboard players get $init/lobby/update.old_positive_x fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[0].negative_z int 1 \
		run scoreboard players get $init/lobby/update.old_negative_z fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[0].positive_z int 1 \
		run scoreboard players get $init/lobby/update.old_positive_z fetchr.tmp

	data \
		modify storage io.fetchr:util forceload_coordinates[1] \
		set from storage io.fetchr:util forceload_coordinates[0]
	scoreboard players operation $init/lobby/update.reference_x fetchr.tmp = $init/lobby/update.old_x fetchr.tmp
	scoreboard players add $init/lobby/update.reference_x fetchr.tmp 29999999
	execute \
		store result storage io.fetchr:util forceload_coordinates[1].start_x int 1 \
		run scoreboard players get $init/lobby/update.reference_x fetchr.tmp

	execute \
		store result storage io.fetchr:util forceload_coordinates[2].start_x int 1 \
		run scoreboard players get $init/lobby/update.clone_x fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[2].positive_x int 1 \
		run scoreboard players get $init/lobby/update.positive_x fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[2].negative_z int 1 \
		run scoreboard players get $init/lobby/update.negative_z fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[2].positive_z int 1 \
		run scoreboard players get $init/lobby/update.positive_z fetchr.tmp

	execute \
		store result storage io.fetchr:util forceload_coordinates[3].positive_x int 1 \
		run scoreboard players get $init/lobby/update.size_z fetchr.tmp
	execute \
		store result storage io.fetchr:util forceload_coordinates[3].positive_z int 1 \
		run scoreboard players get $init/lobby/update.size_z fetchr.tmp

	data modify storage io.fetchr:util callback set value "fetchr:init/update_lobby/update_structure"
	function fetchr:util/forceload_and_wait
#endregion