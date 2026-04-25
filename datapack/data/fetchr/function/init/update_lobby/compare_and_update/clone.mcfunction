#> fetchr:init/update_lobby/compare_and_update/clone
#
# Compares the current coordinates and clones to the clone location if they differ
#
# @within fetchr:init/update_lobby/update_structure
# @context dimension fetchr:lobby
# @params
# 	y: int @ 0..64,
# 	z: int @ -30000000..29999999,
# 	compare_x: int @ -30000000..29999999,
# 	compare_z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,
# 	clone_x: int @ -30000000..29999999,

$execute \
	unless block $(compare_x) $(y) $(compare_z) #fetchr:forces_lobby_update \
	if blocks $(compare_x) $(y) $(compare_z) $(compare_x) $(y) $(compare_z) $(reference_x) $(y) $(z) all \
	run return 0

$execute \
	positioned $(clone_x) $(y) $(z) \
	if block $(reference_x) $(y) $(z) #fetchr:has_special_lobby_update_behavior \
	if block ~ ~ ~ #fetchr:has_special_lobby_update_behavior \
	run function #fetchr:lobby_update/manipulate_special_block \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(compare_x) $(y) $(compare_z) #fetchr:has_special_lobby_update_behavior \
	if blocks $(compare_x) $(y) $(compare_z) $(compare_x) $(y) $(compare_z) $(reference_x) $(y) $(z) all \
	run return 0


$execute \
	unless blocks $(clone_x) $(y) $(z) $(clone_x) $(y) $(z) $(reference_x) $(y) $(z) all \
	if block $(clone_x) $(y) $(z) #fetchr:blocks_with_inventory \
	run setblock $(clone_x) $(y) $(z) minecraft:air destroy
$execute \
	unless blocks $(clone_x) $(y) $(z) $(clone_x) $(y) $(z) $(reference_x) $(y) $(z) all \
	unless block $(clone_x) $(y) $(z) #fetchr:blocks_with_inventory \
	run loot spawn $(clone_x) $(y) $(z) mine $(clone_x) $(y) $(z) minecraft:shears[minecraft:enchantments={"minecraft:silk_touch":1}]

#NEUN_SCRIPT until 62
#$clone $(compare_x) $(y) $(compare_z) $(compare_x) $(y) $(compare_z) $(clone_x) $(y) $(z)
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$clone $(compare_x) $(y) $(compare_z) $(compare_x) $(y) $(compare_z) $(clone_x) $(y) $(z) strict
#NEUN_SCRIPT end
