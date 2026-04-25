#> fetchr:init/update_lobby/clear_target_area/clear_block
#
# Clears the block by either moving to the clone, or spawning an item
#
# @within function fetchr:init/update_lobby/update_structure/clear_target_area/y_iter
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
	if blocks $(new_x) $(y) $(z) $(new_x) $(y) $(z) $(reference_x) $(y) $(z) all \
	run return 0
#NEUN_SCRIPT until 62
#$execute \
	if block $(clone_x) $(y) $(z) minecraft:air \
	run return run clone $(new_x) $(y) $(z) $(new_x) $(y) $(z) $(clone_x) $(y) $(z) replace move
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	if block $(clone_x) $(y) $(z) minecraft:air \
	run return run clone $(new_x) $(y) $(z) $(new_x) $(y) $(z) $(clone_x) $(y) $(z) strict replace move
#NEUN_SCRIPT end

execute \
	store result score $init/lobby/update/clear_target.y fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby clear_target_area_coordinates[-1].y
#NEUN_SCRIPT until 62
#$execute \
	if score $init/lobby/update/clear_target.y fetchr.tmp matches 0..2 \
	if block $(clone_x) $(y) $(z) minecraft:barrier \
	run return run clone $(new_x) $(y) $(z) $(new_x) $(y) $(z) $(clone_x) $(y) $(z) replace move
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	if score $init/lobby/update/clear_target.y fetchr.tmp matches 0..2 \
	if block $(clone_x) $(y) $(z) minecraft:barrier \
	run return run clone $(new_x) $(y) $(z) $(new_x) $(y) $(z) $(clone_x) $(y) $(z) strict replace move
#NEUN_SCRIPT end

$execute \
	if block $(new_x) $(y) $(z) #fetchr:blocks_with_inventory \
	run setblock $(new_x) $(y) $(z) minecraft:air destroy
$execute \
	unless block $(new_x) $(y) $(z) #fetchr:blocks_with_inventory \
	run loot spawn $(new_x).5 $(y) $(z).5 mine $(new_x) $(y) $(z) minecraft:shears[minecraft:enchantments={"minecraft:silk_touch":1}]
