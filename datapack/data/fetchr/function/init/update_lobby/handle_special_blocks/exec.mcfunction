#> fetchr:init/update_lobby/handle_special_blocks/special_blocks
#
# Removes additional properties from player head to have correct comparision
# in case both Fetchr version and Minecraft version were upgraded
#
# @within fetchr:init/update_lobby/handle_special_blocks/clone
# @context dimension fetchr:lobby
# @params
# 	y: int @ 0..64,
# 	z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,

$execute \
	if block $(reference_x) ~ ~ #minecraft:doors \
	if block ~ ~ ~ #minecraft:doors \
	run return run function fetchr:init/update_lobby/handle_special_blocks/check_door_id {reference_x:$(reference_x)}

$execute \
	unless block $(reference_x) ~ ~ #fetchr:player_heads \
	run return 0
execute \
	unless block ~ ~ ~ #fetchr:player_heads \
	run return 0

# Tod_NL changed their minecraft name at some point in time, leading to
# inconcistencies depending on when the world was first loaded.
$execute \
	if data block $(reference_x) ~ ~ profile{id:[I;182513704,786974462,-1481547670,-1612754648]} \
	if data block ~ ~ ~ profile{name: "tod_nl"} \
	run data modify block ~ ~ ~ profile set from block $(reference_x) ~ ~ profile

# Remove additional data from refercence for most meaningful comparision
$execute \
	if data block $(reference_x) ~ ~ profile.id \
	run data remove block $(reference_x) ~ ~ profile.name
$execute \
	if data block $(reference_x) ~ ~ profile.id \
	run data remove block $(reference_x) ~ ~ profile.properties
$execute \
	if data block $(reference_x) ~ ~ profile.name \
	run data remove block $(reference_x) ~ ~ profile.properties

# Remove additional data from old lobby for most meaningful comparision
$execute \
	unless data block $(reference_x) ~ ~ profile.properties \
	if data block ~ ~ ~ profile.properties \
	run data remove block ~ ~ ~ profile.properties
$execute \
	unless data block $(reference_x) ~ ~ profile.name \
	if data block ~ ~ ~ profile.name \
	run data remove block ~ ~ ~ profile.name
$execute \
	unless data block $(reference_x) ~ ~ profile.id \
	if data block ~ ~ ~ profile.id \
	run data remove block ~ ~ ~ profile.id
