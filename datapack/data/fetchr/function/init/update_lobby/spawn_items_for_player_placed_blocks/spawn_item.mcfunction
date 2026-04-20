#> fetchr:init/update_lobby/spawn_items_for_player_placed_blocks/spawn_item
#
# Spawns items for player-placed blocks in coordinates that are completely \
# removed.
#
# @within function fetchr:init/update_lobby/update_structure/spawn_items/y_iter
# @context dimension fetchr:lobby
# @params
# 	y: int @ 0..64,
# 	z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,
# 	old_x: int @ -30000000..29999999,
# 	offset_x: int @ 0..60000000,
# 	offset_y: int @ 0..64,
# 	offset_z: int @ 0..60000000
$execute \
	if blocks $(old_x) $(y) $(z) $(old_x) $(y) $(z) $(reference_x) $(y) $(z) all \
	run return 0

$execute \
	if block $(old_x) $(y) $(z) #fetchr:blocks_with_inventory \
	run setblock $(old_x) $(y) $(z) minecraft:air destroy
$teleport @e[x=$(old_x),y=$(y),z=$(z),distance=..1, type=minecraft:item] 7.5 3 7.5
$execute \
	unless block $(old_x) $(y) $(z) #fetchr:blocks_with_inventory \
	run loot spawn 7.5 3 7.5 mine $(old_x) $(y) $(z) minecraft:shears[minecraft:enchantments={"minecraft:silk_touch":1}]
