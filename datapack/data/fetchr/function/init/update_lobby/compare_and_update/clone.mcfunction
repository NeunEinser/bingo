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
	positioned $(compare_x) $(y) $(compare_z) \
	unless blocks ~ ~ ~ ~ ~ ~ $(reference_x) $(y) $(reference_z) all \
	run clone ~ ~ ~ ~ ~ ~ $(clone_x) $(y) $(reference_z)
$clone $(compare_x) $(y) $(compare_z) $(compare_x) $(y) $(compare_z) $(reference_x) $(y) $(reference_z) 
