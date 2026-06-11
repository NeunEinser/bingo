#> fetchr:init/update_lobby/move_clone
#
# Moves back the cloned updated structure to the normal lobby position.
#
# @within
#	function fetchr:init/update_lobby/move_clone_callback

data modify storage tmp.fetchr:init/update_lobby clear_target_area_coordinates set value [{}]
execute \
	store result storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[0].y int 1 \
	run scoreboard players get $init/lobby/update.y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[0].z int 1 \
	run scoreboard players get $init/lobby/update.z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[0].offset_x int 1 \
	run scoreboard players get $init/lobby/update.offset_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[0].offset_y int 1 \
	run scoreboard players get $init/lobby/update.offset_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[0].offset_z int 1 \
	run scoreboard players get $init/lobby/update.offset_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[0].new_x int 1 \
	run scoreboard players get $init/lobby/update.new_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[0].clone_x int 1 \
	run scoreboard players get $init/lobby/update.clone_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[0].reference_x int 1 \
	run scoreboard players get $init/lobby/update.reference_x fetchr.tmp

function fetchr:init/update_lobby/clear_target_area/x_iter \
	with storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[0]

#NEUN_SCRIPT until 62
#$execute \
	positioned $(clone_x) $(y) $(z) \
	run clone ~ ~ ~ ~$(offset_x) ~$(offset_y) ~$(offset_z) $(new_x) ~ ~
#$execute \
	if score $init/lobby/update.y fetchr.tmp matches ..2 \
	positioned $(clone_x) $(y) $(z) \
	run fill ~ ~ ~ ~$(offset_x) 2 ~$(offset_z) minecraft:barrier
#$execute \
	if score $init/lobby/update.offset_y_above_barriers fetchr.tmp matches 0.. \
	positioned $(clone_x) $(y_above_barriers) $(z) \
	run fill ~ ~ ~ ~$(offset_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	positioned $(clone_x) $(y) $(z) \
	run clone ~ ~ ~ ~$(offset_x) ~$(offset_y) ~$(offset_z) $(new_x) ~ ~ strict
$execute \
	if score $init/lobby/update.y fetchr.tmp matches ..2 \
	positioned $(clone_x) $(y) $(z) \
	run fill ~ ~ ~ ~$(offset_x) 2 ~$(offset_z) minecraft:barrier strict
$execute \
	if score $init/lobby/update.offset_y_above_barriers fetchr.tmp matches 0.. \
	positioned $(clone_x) $(y_above_barriers) $(z) \
	run fill ~ ~ ~ ~$(offset_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air strict
#NEUN_SCRIPT end
$execute \
	as @e[x=$(clone_x),y=$(y),z=$(z),dx=$(offset_x),dy=$(offset_y),dz=$(offset_z)] \
	run function fetchr:util/find_root_vehicle
$execute \
	as @e[x=$(clone_x),y=$(y),z=$(z),dx=$(offset_x),dy=$(offset_y),dz=$(offset_z),tag=fetchr.root_vehicle] \
	at @s \
	run teleport @s ~$(clone_to_new_x_offset) ~ ~
$execute \
	as @e[x=$(new_x),y=$(y),z=$(z),dx=$(offset_x),dy=$(offset_y),dz=$(offset_z)] \
	run tag @s remove fetchr.root_vehicle

data remove storage tmp.fetchr:init/update_lobby structures[0]
execute \
	unless data storage tmp.fetchr:init/update_lobby structures[0] \
	run function fetchr:init/update_lobby/end

execute \
	if data storage tmp.fetchr:init/update_lobby structures[0] \
	run function fetchr:init/update_lobby/setup_clone_move