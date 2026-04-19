#> fetchr:init/update_lobby/compare_and_update/clone
#
# Compares the current coordinates and clones to the clone location if they differ
#
# @within fetchr:init/update_lobby/update_structure
# @context dimension fetchr:lobby
# @params
# 	y: int @ 0..64,
# 	compare_x: int @ -30000000..29999999,
# 	compare_z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,
# 	reference_z: int @ -30000000..29999999,
# 	clone_x: int @ -30000000..29999999,

$execute \
	if blocks $(compare_x) $(y) $(compare_z) $(compare_x) $(y) $(compare_z) $(reference_x) $(y) $(reference_z) all \
	run return 0

$execute \
	if block $(reference_x) $(y) $(reference_z) #fetchr:player_head \
	if block $(clone_x) $(y) $(reference_z) #fetchr:player_head \
	run function fetchr:init/update_lobby/compare_and_update/remove_additional_player_head_properties \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]

$execute \
	unless blocks $(clone_x) $(y) $(reference_z) $(clone_x) $(y) $(reference_z) $(reference_x) $(y) $(reference_z) all \
	if block $(clone_x) $(y) $(reference_z) #fetchr:blocks_with_inventory \
	run setblock $(clone_x) $(y) $(reference_z) minecraft:air destroy
$execute \
	unless blocks $(clone_x) $(y) $(reference_z) $(clone_x) $(y) $(reference_z) $(reference_x) $(y) $(reference_z) all \
	unless block $(clone_x) $(y) $(reference_z) #fetchr:blocks_with_inventory \
	run loot spawn $(clone_x) $(y) $(reference_z) mine $(clone_x) $(y) $(reference_z) minecraft:shears[minecraft:enchantments={"minecraft:silk_touch":1}]

#NEUN_SCRIPT until 62
#$clone $(compare_x) $(y) $(compare_z) $(compare_x) $(y) $(compare_z) $(clone_x) $(y) $(reference_z)
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$clone $(compare_x) $(y) $(compare_z) $(compare_x) $(y) $(compare_z) $(clone_x) $(y) $(reference_z) strict
#NEUN_SCRIPT end
