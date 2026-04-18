#> fetchr:init/update_lobby/update_structure
#
# Updates the structure
#
# @within fetchr:init/update_lobby/update_structure_callback
# @context dimension fetchr:lobby
# @params
# 	structure_id: #[id=structure] string
# 	compare_z: int @ -30000000..29999999
# 	compare_y: int @ -3..0
# 	old_x: int @ -30000000..29999999
# 	old_y: int @ 0..64
# 	old_z: int @ -30000000..29999999
# 	old_high_x: int @ -30000000..29999999
# 	old_high_y: int @ 0..64
# 	old_high_z: int @ -30000000..29999999
# 	clone_x: int @ -30000000..29999999

#NEUN_SCRIPT until 62
#$execute \
	positioned -29999999 $(compare_y_above_barriers) $(compare_z) \
	run fill ~ ~ ~ ~$(offset_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air
#$execute \
	positioned -29999999 0 $(compare_z) \
	run fill ~ 0 ~ ~$(offset_x) 2 ~$(offset_z) minecraft:barrier
#$place template $(structure_id) -29999999 $(compare_y) $(compare_z)
#$execute \
	positioned $(old_x) $(old_y) $(old_z) \
	run clone ~ ~ ~ \
		~$(offset_x) ~$(offset_y) ~$(offset_z) \
		$(clone_x) $(old_y) $(old_z) \
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	positioned -29999999 $(compare_y_above_barriers) $(compare_z) \
	run fill ~ ~ ~ ~$(offset_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air strict
$execute \
	positioned -29999999 0 $(compare_z) \
	run fill ~ 0 ~ ~$(offset_x) 2 ~$(offset_z) minecraft:barrier strict
$place template $(structure_id) -29999999 $(compare_y) $(compare_z) none none 1 1 strict
$execute \
	positioned $(old_x) $(old_y) $(old_z) \
	run clone ~ ~ ~ \
		~$(offset_x) ~$(offset_y) ~$(offset_z) \
		$(clone_x) $(old_y) $(old_z) \
		strict
#NEUN_SCRIPT end
data modify storage tmp.fetchr:init/update_lobby compare_coordinates set value [{\
	compare_x: -29999999,\
	compare_z: -30000000\
}]

execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].y int 1 \
	run scoreboard players get $init/lobby/update.y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].size_x int 1 \
	run scoreboard players get $init/lobby/update.new_size_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].size_y int 1 \
	run scoreboard players get $init/lobby/update.size_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].size_z int 1 \
	run scoreboard players get $init/lobby/update.size_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].offset_x int 1 \
	run scoreboard players get $init/lobby/update.offset_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].offset_y int 1 \
	run scoreboard players get $init/lobby/update.offset_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].offset_z int 1 \
	run scoreboard players get $init/lobby/update.offset_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].reference_x int 1 \
	run scoreboard players get $init/lobby/update.reference_for_clone_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].reference_z int 1 \
	run scoreboard players get $init/lobby/update.z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].clone_x int 1 \
	run scoreboard players get $init/lobby/update.clone_x fetchr.tmp

function fetchr:init/update_lobby/compare_and_update/x_iter \
	with storage tmp.fetchr:init/update_lobby compare_coordinates[0]

scoreboard players operation \
	$init/lobby/update.reference_to_old_x_offset fetchr.tmp \
	= $init/lobby/update.old_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.reference_to_old_x_offset int 1 \
	run scoreboard players operation \
		$init/lobby/update.reference_to_old_x_offset fetchr.tmp \
		-= $init/lobby/update.reference_x fetchr.tmp

scoreboard players operation \
	$init/lobby/update.compare_to_clone_x_offset fetchr.tmp \
	= $init/lobby/update.clone_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.compare_to_clone_x_offset int 1 \
	run scoreboard players add $init/lobby/update.compare_to_clone_x_offset fetchr.tmp 29999999
scoreboard players operation \
	$init/lobby/update.compare_to_clone_z_offset fetchr.tmp \
	= $init/lobby/update.z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.compare_to_clone_z_offset int 1 \
	run scoreboard players add $init/lobby/update.compare_to_clone_z_offset fetchr.tmp 30000000

execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.y int 1 \
	run scoreboard players get $init/lobby/update.y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.size_x int 1 \
	run scoreboard players get $init/lobby/update.new_size_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.size_y int 1 \
	run scoreboard players get $init/lobby/update.size_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.size_z int 1 \
	run scoreboard players get $init/lobby/update.size_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.reference_x int 1 \
	run scoreboard players get $init/lobby/update.reference_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.z int 1 \
	run scoreboard players get $init/lobby/update.z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.clone_x int 1 \
	run scoreboard players get $init/lobby/update.clone_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.old_x int 1 \
	run scoreboard players get $init/lobby/update.old_x fetchr.tmp

$execute \
	positioned -29999999 $(compare_y) $(compare_z) \
	as @e[dx=$(size_x),dy=$(size_y),dz=$(size_z)] \
	at @s \
	run function fetchr:init/update_lobby/update_entity/exec \
		with storage tmp.fetchr:init/update_lobby update_entity

$execute \
	positioned $(reference_x) $(old_y) $(old_z) \
	as @e[tag=!fetchr.matched,dx=$(size_x),dy=$(size_y),dz=$(size_z)] \
	run function fetchr:init/update_lobby/update_entity/kill_removed_entity

$execute \
	positioned -29999999 $(compare_y) $(compare_z) \
	run teleport @e[dx=$(size_x),dy=$(size_y),dz=$(size_z)] 0 -127 0
kill @e[x=0,y=-127,z=0,distance=...1]

scoreboard players operation $init/lobby/update.clone_x fetchr.tmp += $init/lobby/update.new_size_x fetchr.tmp

data remove storage tmp.fetchr:init/update_lobby structures[-1]
execute \
	if data storage tmp.fetchr:init/update_lobby structures[0] \
	run function fetchr:init/update_lobby/setup_structure