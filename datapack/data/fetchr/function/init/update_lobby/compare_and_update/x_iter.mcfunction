#> fetchr:init/update_lobby/compare_and_update/x_iter
#
# Compares along the x slice. Simply returns if equal, and searches for more
# changes in a binary tree along all x y and z coordiantes.
#
# @within fetchr:init/update_lobby/update_structure
# @context dimension fetchr:lobby
# @params
# 	y: int @ 0..64,
# 	z: int @ -30000000..29999999,
# 	compare_x: int @ -30000000..29999999,
# 	compare_z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,
# 	offset_x: int @ 0..60000000,
# 	offset_y: int @ 0..64,
# 	offset_z: int @ 0..60000000,

scoreboard players set $init/lobby/update/compare_and_update.needs_update fetchr.tmp 1
#NEUN_SCRIPT until 62
#$execute \
	positioned $(compare_x) $(y) $(compare_z) \
	if blocks ~ ~ ~ ~$(offset_x) ~$(offset_y) ~$(offset_z) $(reference_x) ~ $(z) all \
	store success score $init/lobby/update/compare_and_update.needs_update fetchr.tmp \
	run clone ~ ~ ~ ~$(offset_x) ~$(offset_y) ~$(offset_z) ~ ~ ~ filtered #fetchr:forces_lobby_update move
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	positioned $(compare_x) $(y) $(compare_z) \
	if blocks ~ ~ ~ ~$(offset_x) ~$(offset_y) ~$(offset_z) $(reference_x) ~ $(z) all \
	store success score $init/lobby/update/compare_and_update.needs_update fetchr.tmp \
	run clone ~ ~ ~ ~$(offset_x) ~$(offset_y) ~$(offset_z) ~ ~ ~ strict filtered #fetchr:forces_lobby_update move
#NEUN_SCRIPT end

execute \
	if score $init/lobby/update/compare_and_update.needs_update fetchr.tmp matches 0 \
	run return 0

execute \
	store result score $init/lobby/update/compare_and_update.size_x fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby compare_coordinates[-1].offset_x
scoreboard players add $init/lobby/update/compare_and_update.size_x fetchr.tmp 1
execute \
	store result score $init/lobby/update/compare_and_update.compare_x fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby compare_coordinates[-1].compare_x
execute \
	store result score $init/lobby/update/compare_and_update.reference_x fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby compare_coordinates[-1].reference_x
execute \
	store result score $init/lobby/update/compare_and_update.clone_x fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby compare_coordinates[-1].clone_x
#NEUN_SCRIPT until 62
#execute \
	store result score $init/lobby/update/compare_and_update.old_x fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby compare_coordinates[-1].old_x
#NEUN_SCRIPT end

# low
data \
	modify storage tmp.fetchr:init/update_lobby compare_coordinates \
	append from storage tmp.fetchr:init/update_lobby compare_coordinates[-1]

scoreboard players operation $init/lobby/update/compare_and_update.size_low_x fetchr.tmp = $init/lobby/update/compare_and_update.size_x fetchr.tmp
scoreboard players operation $init/lobby/update/compare_and_update.size_low_x fetchr.tmp /= 2 fetchr.const

scoreboard players operation $init/lobby/update/compare_and_update.offset_low_x fetchr.tmp = $init/lobby/update/compare_and_update.size_low_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[-1].offset_x int 1 \
	run scoreboard players remove $init/lobby/update/compare_and_update.offset_low_x fetchr.tmp 1

# high
data \
	modify storage tmp.fetchr:init/update_lobby compare_coordinates \
	append from storage tmp.fetchr:init/update_lobby compare_coordinates[-2]

scoreboard players operation $init/lobby/update/compare_and_update.size_high_x fetchr.tmp = $init/lobby/update/compare_and_update.size_x fetchr.tmp
scoreboard players operation $init/lobby/update/compare_and_update.size_high_x fetchr.tmp -= $init/lobby/update/compare_and_update.size_low_x fetchr.tmp

scoreboard players operation $init/lobby/update/compare_and_update.offset_high_x fetchr.tmp = $init/lobby/update/compare_and_update.size_high_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[-1].offset_x int 1 \
	run scoreboard players remove $init/lobby/update/compare_and_update.offset_high_x fetchr.tmp 1
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[-1].compare_x int 1 \
	run scoreboard players operation $init/lobby/update/compare_and_update.compare_x fetchr.tmp += $init/lobby/update/compare_and_update.size_low_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[-1].reference_x int 1 \
	run scoreboard players operation $init/lobby/update/compare_and_update.reference_x fetchr.tmp += $init/lobby/update/compare_and_update.size_low_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[-1].clone_x int 1 \
	run scoreboard players operation $init/lobby/update/compare_and_update.clone_x fetchr.tmp += $init/lobby/update/compare_and_update.size_low_x fetchr.tmp
#NEUN_SCRIPT until 62
#execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[-1].old_x int 1 \
	run scoreboard players operation $init/lobby/update/compare_and_update.old_x fetchr.tmp += $init/lobby/update/compare_and_update.size_low_x fetchr.tmp
#NEUN_SCRIPT end

# recurse high
execute \
	if score $init/lobby/update/compare_and_update.size_high_x fetchr.tmp matches 1 \
	run function fetchr:init/update_lobby/compare_and_update/z_iter \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
execute \
	if score $init/lobby/update/compare_and_update.size_high_x fetchr.tmp matches 2.. \
	run function fetchr:init/update_lobby/compare_and_update/x_iter \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
data remove storage tmp.fetchr:init/update_lobby compare_coordinates[-1]

# recurse low
execute \
	store result score $init/lobby/update/compare_and_update.offset_low_x fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby compare_coordinates[-1].offset_x

execute \
	if score $init/lobby/update/compare_and_update.offset_low_x fetchr.tmp matches 0 \
	run function fetchr:init/update_lobby/compare_and_update/z_iter \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
execute \
	if score $init/lobby/update/compare_and_update.offset_low_x fetchr.tmp matches 1.. \
	run function fetchr:init/update_lobby/compare_and_update/x_iter \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
data remove storage tmp.fetchr:init/update_lobby compare_coordinates[-1]