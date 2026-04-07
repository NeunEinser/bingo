#> fetchr:init/update_lobby/compare_and_update/x_iter
#
# Compares along the x slice. Simply returns if equal, and searches for more
# changes in a binary tree along all x y and z coordiantes.
#
# @within fetchr:init/update_lobby/update_structure
# @context dimension fetchr:lobby
# @params
# 	y: int @ 0..64,
# 	compare_x: int @ -30000000..29999999,
# 	compare_z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,
# 	reference_z: int @ -30000000..29999999,
# 	size_x: int @ 0..60000000,
# 	size_y: int @ 0..64,
# 	size_z: int @ 0..60000000,

$execute \
	positioned $(compare_x) $(y) $(compare_z) \
	if blocks ~ ~ ~ ~$(size_x) ~$(size_y) ~$(size_z) $(reference_x) $(y) $(reference_z) all \
	run return 0

execute \
	store result score $init/lobby/update/compare_and_update.size_x fetchr.tmp \
	run data get storage tmp.fetchr:init/structures compare_coordinates[-1].size_x
execute \
	store result score $init/lobby/update/compare_and_update.compare_x fetchr.tmp \
	run data get storage tmp.fetchr:init/structures compare_coordinates[-1].compare_x
execute \
	store result score $init/lobby/update/compare_and_update.reference_x fetchr.tmp \
	run data get storage tmp.fetchr:init/structures compare_coordinates[-1].reference_x
execute \
	store result score $init/lobby/update/compare_and_update.clone_x fetchr.tmp \
	run data get storage tmp.fetchr:init/structures compare_coordinates[-1].clone_x


# low
scoreboard players operation $init/lobby/update/compare_and_update.size_low_x fetchr.tmp = $init/lobby/update/compare_and_update.size_x fetchr.tmp
scoreboard players operation $init/lobby/update/compare_and_update.size_low_x fetchr.tmp /= 2 fetchr.const
data \
	modify storage tmp.fetchr:init/structures compare_coordinates \
	append from storage tmp.fetchr:init/structures compare_coordinates[-1]
execute \
	store result storage tmp.fetchr:init/structures compare_coordinates[-1].size_x int 1 \
	run scoreboard players get $init/lobby/update/compare_and_update.size_low_x fetchr.tmp

# high
scoreboard players operation $init/lobby/update/compare_and_update.size_high_x fetchr.tmp = $init/lobby/update/compare_and_update.size_x fetchr.tmp
scoreboard players operation $init/lobby/update/compare_and_update.size_high_x fetchr.tmp -= $init/lobby/update/compare_and_update.size_low_x fetchr.tmp

scoreboard players operation $init/lobby/update/compare_and_update.compare_x fetchr.tmp += $init/lobby/update/compare_and_update.size_low_x fetchr.tmp
scoreboard players operation $init/lobby/update/compare_and_update.reference_x fetchr.tmp += $init/lobby/update/compare_and_update.size_low_x fetchr.tmp
scoreboard players operation $init/lobby/update/compare_and_update.clone_x fetchr.tmp += $init/lobby/update/compare_and_update.size_low_x fetchr.tmp

data \
	modify storage tmp.fetchr:init/structures compare_coordinates \
	append from storage tmp.fetchr:init/structures compare_coordinates[-2]
execute \
	store result storage tmp.fetchr:init/structures compare_coordinates[-1].size_x int 1 \
	run scoreboard players get $init/lobby/update/compare_and_update.size_high_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures compare_coordinates[-1].compare_x int 1 \
	run scoreboard players get $init/lobby/update/compare_and_update.compare_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures compare_coordinates[-1].reference_x int 1 \
	run scoreboard players get $init/lobby/update/compare_and_update.reference_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures compare_coordinates[-1].clone_x int 1 \
	run scoreboard players get $init/lobby/update/compare_and_update.clone_x fetchr.tmp


# recurse high
execute \
	if score $init/lobby/update/compare_and_update.size_high_x fetchr.tmp matches 1 \
	run return run function fetchr:init/update_lobby/compare_and_update/z_iter \
		with storage tmp.fetchr:init/structures compare_coordinates[-1]
execute \
	if score $init/lobby/update/compare_and_update.size_high_x fetchr.tmp matches 2.. \
	run return run function fetchr:init/update_lobby/compare_and_update/x_iter \
		with storage tmp.fetchr:init/structures compare_coordinates[-1]
data remove storage tmp.fetchr:init/structures compare_coordinates[-1]

# recurse low
execute \
	store result score $init/lobby/update/compare_and_update.size_low_x fetchr.tmp \
	run data get storage tmp.fetchr:init/structures compare_coordinates[-1].size_x

execute \
	if score $init/lobby/update/compare_and_update.size_low_x fetchr.tmp matches 1 \
	run return run function fetchr:init/update_lobby/compare_and_update/z_iter \
		with storage tmp.fetchr:init/structures compare_coordinates[-1]
execute \
	if score $init/lobby/update/compare_and_update.size_low_x fetchr.tmp matches 2.. \
	run return run function fetchr:init/update_lobby/compare_and_update/x_iter \
		with storage tmp.fetchr:init/structures compare_coordinates[-1]
data remove storage tmp.fetchr:init/structures compare_coordinates[-1]