#> fetchr:init/update_lobby/compare_and_update/remove_additional_player_head_properties
#
# Removes additional properties from player head to have correct comparision
# in case both Fetchr version and Minecraft version were upgraded
#
# @within fetchr:init/update_lobby/compare_and_update/clone
# @context dimension fetchr:lobby
# @params
# 	y: int @ 0..64,
# 	compare_x: int @ -30000000..29999999,
# 	compare_z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,
# 	reference_z: int @ -30000000..29999999,
# 	clone_x: int @ -30000000..29999999,

$execute \
	unless data block $(reference_x) $(y) $(reference_z) profile.properties \
	if data block $(clone_x) $(y) $(reference_z) profile.properties \
	run data remove block $(clone_x) $(y) $(reference_z) profile.properties
$execute \
	unless data block $(reference_x) $(y) $(reference_z) profile.name \
	if data block $(clone_x) $(y) $(reference_z) profile.name \
	run data remove block $(clone_x) $(y) $(reference_z) profile.name
$execute \
	unless data block $(reference_x) $(y) $(reference_z) profile.id \
	if data block $(clone_x) $(y) $(reference_z) profile.id \
	run data remove block $(clone_x) $(y) $(reference_z) profile.id