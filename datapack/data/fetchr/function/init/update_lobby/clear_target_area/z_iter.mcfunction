#> fetchr:init/update_lobby/clear_target_area/z_iter
#
# Compares old with reference along the z slice. Simply returns if equal, and
# searches for more changes in a binary tree along all y and z coordiantes.
#
# @within
# 	function fetchr:init/update_lobby/update_structure/clear_target/x_iter
# 	function fetchr:init/update_lobby/update_structure/clear_target/z_iter
# @context dimension fetchr:lobby
# @params
# 	y: int @ 0..64,
# 	z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,
# 	new_x: int @ -30000000..29999999,
# 	offset_x: int @ 0..60000000,
# 	offset_y: int @ 0..64,
# 	offset_z: int @ 0..60000000

$execute \
	positioned $(new_x) $(y) $(z) \
	if blocks ~ ~ ~ ~$(offset_x) ~$(offset_y) ~$(offset_z) $(reference_x) ~ ~ all \
	run return 0

execute \
	store result score $init/lobby/update/clear_target.size_z fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1].offset_z
scoreboard players add $init/lobby/update/clear_target.size_z fetchr.tmp 1
execute \
	store result score $init/lobby/update/clear_target.z fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1].z


# low
data \
	modify storage tmp.fetchr:init/update_lobby clear_target_area_coordinates \
	append from storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1]

scoreboard players operation $init/lobby/update/clear_target.size_low_z fetchr.tmp = $init/lobby/update/clear_target.size_z fetchr.tmp
scoreboard players operation $init/lobby/update/clear_target.size_low_z fetchr.tmp /= 2 fetchr.const

scoreboard players operation $init/lobby/update/clear_target.offset_low_z fetchr.tmp = $init/lobby/update/clear_target.size_low_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1].offset_z int 1 \
	run scoreboard players remove $init/lobby/update/clear_target.offset_low_z fetchr.tmp 1

# high
data \
	modify storage tmp.fetchr:init/update_lobby clear_target_area_coordinates \
	append from storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-2]

scoreboard players operation $init/lobby/update/clear_target.size_high_z fetchr.tmp = $init/lobby/update/clear_target.size_z fetchr.tmp
scoreboard players operation $init/lobby/update/clear_target.size_high_z fetchr.tmp -= $init/lobby/update/clear_target.size_low_z fetchr.tmp

scoreboard players operation $init/lobby/update/clear_target.offset_high_z fetchr.tmp = $init/lobby/update/clear_target.size_high_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1].offset_z int 1 \
	run scoreboard players remove $init/lobby/update/clear_target.offset_high_z fetchr.tmp 1
execute \
	store result storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1].z int 1 \
	run scoreboard players operation $init/lobby/update/clear_target.z fetchr.tmp += $init/lobby/update/clear_target.size_low_z fetchr.tmp


# recurse high
execute \
	if score $init/lobby/update/clear_target.size_high_z fetchr.tmp matches 1 \
	run function fetchr:init/update_lobby/clear_target_area/y_iter \
		with storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1]
execute \
	if score $init/lobby/update/clear_target.size_high_z fetchr.tmp matches 2.. \
	run function fetchr:init/update_lobby/clear_target_area/z_iter \
		with storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1]
data remove storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1]

# recurse low
execute \
	store result score $init/lobby/update/clear_target.offset_low_z fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1].offset_z

execute \
	if score $init/lobby/update/clear_target.offset_low_z fetchr.tmp matches 0 \
	run function fetchr:init/update_lobby/clear_target_area/y_iter \
		with storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1]
execute \
	if score $init/lobby/update/clear_target.offset_low_z fetchr.tmp matches 1.. \
	run function fetchr:init/update_lobby/clear_target_area/z_iter \
		with storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1]
data remove storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1]