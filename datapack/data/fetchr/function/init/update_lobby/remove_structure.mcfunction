#> fetchr:init/update_lobby/remove_structure
#
# Removes the old and reference structures
#
# @within function fetchr:init/update_lobby/remove_structure_callback
# @context dimension fetchr:lobby

execute \
	at @e[type=#fetchr:marker_entity, tag=fetchr.lobby_sign] \
	run setblock ~ ~ ~ minecraft:air
execute \
	at @e[type=#fetchr:marker_entity, tag=fetchr.lobby_lectern] \
	run setblock ~ ~ ~ minecraft:air
execute \
	at @e[type=#fetchr:marker_entity, tag=fetchr.chest_generation_marker] \
	run function fetchr:init/update_lobby/reset_category_chests
execute \
	at @e[type=#fetchr:marker_entity, tag=fetchr.lobby_enderchest] \
	run setblock ~ ~ ~ minecraft:air
execute \
	at @e[type=#fetchr:marker_entity, tag=fetchr.multiplayer_door] \
	run fill ~ ~ ~ ~ ~1 ~ minecraft:air
execute \
	at @e[type=#fetchr:marker_entity, tag=fetchr.mangrove_button_south] \
	run setblock ~ ~ ~ minecraft:air

# Delete old and reference
data modify storage tmp.fetchr:init/update_lobby spawn_items_coordinates set value [{}]

execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].y int 1 \
	run scoreboard players get $init/lobby/update.old_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].z int 1 \
	run scoreboard players get $init/lobby/update.old_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].offset_x int 1 \
	run scoreboard players get $init/lobby/update.offset_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].offset_y int 1 \
	run scoreboard players get $init/lobby/update.offset_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].offset_z int 1 \
	run scoreboard players get $init/lobby/update.offset_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].old_x int 1 \
	run scoreboard players get $init/lobby/update.old_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].reference_x int 1 \
	run scoreboard players get $init/lobby/update.reference_x fetchr.tmp

function fetchr:init/update_lobby/spawn_items_for_player_placed_blocks/x_iter \
	with storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0]

$execute \
	as @e[x=$(reference_x),y=$(y),z=$(z),dx=$(offset_x),dy=$(offset_y),dz=$(offset_z)] \
	run function fetchr:init/update_lobby/update_entity/kill_removed_entity

#NEUN_SCRIPT until 62
#$execute \
	if score $init/lobby/update.old_y fetchr.tmp matches ..2 \
	positioned $(old_x) $(y) $(z) \
	run fill ~ ~ ~ ~$(offset_x) 2 ~$(offset_z) minecraft:barrier
#$execute \
	if score $init/lobby/update.offset_y_above_barriers fetchr.tmp matches 0.. \
	positioned $(old_x) $(y_above_barriers) $(z) \
	run fill ~ ~ ~ ~$(offset_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	if score $init/lobby/update.old_y fetchr.tmp matches ..2 \
	positioned $(old_x) $(y) $(z) \
	run fill ~ ~ ~ ~$(offset_x) 2 ~$(offset_z) minecraft:barrier strict
$execute \
	if score $init/lobby/update.offset_y_above_barriers fetchr.tmp matches 0.. \
	positioned $(old_x) $(y_above_barriers) $(z) \
	run fill ~ ~ ~ ~$(offset_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air strict
#NEUN_SCRIPT end
$kill @e[type=#fetchr:marker_entity,x=$(old_x),y=$(y),z=$(z),dx=$(offset_x),dy=$(offset_y),dz=$(offset_z)]

#NEUN_SCRIPT until 62
#$execute \
	if score $init/lobby/update.old_y fetchr.tmp matches ..2 \
	positioned $(reference_x) $(y) $(z) \
	run fill ~ ~ ~ ~$(offset_x) 2 ~$(offset_z) minecraft:barrier
#$execute \
	if score $init/lobby/update.offset_y_above_barriers fetchr.tmp matches 0.. \
	positioned $(reference_x) $(y_above_barriers) $(z) \
	run fill ~ ~ ~ ~$(offset_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	if score $init/lobby/update.old_y fetchr.tmp matches ..2 \
	positioned $(reference_x) $(y) $(z) \
	run fill ~ ~ ~ ~$(offset_x) 2 ~$(offset_z) minecraft:barrier strict
$execute \
	if score $init/lobby/update.offset_y_above_barriers fetchr.tmp matches 0.. \
	positioned $(reference_x) $(y_above_barriers) $(z) \
	run fill ~ ~ ~ ~$(offset_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air strict
#NEUN_SCRIPT end

$teleport @e[x=$(reference_x),y=$(y),z=$(z),dx=$(offset_x),dy=$(offset_y),dz=$(offset_z)] 0 -127 0
kill @e[x=0.5,y=-127,z=0.5,distance=...1]

data remove storage tmp.fetchr:init/update_lobby old_structures[0]

execute \
	unless data storage tmp.fetchr:init/update_lobby old_structures[0] \
	run function fetchr:init/update_lobby/update_structures
execute \
	if data storage tmp.fetchr:init/update_lobby old_structures[0] \
	run function fetchr:init/update_lobby/remove_non_exiting_old