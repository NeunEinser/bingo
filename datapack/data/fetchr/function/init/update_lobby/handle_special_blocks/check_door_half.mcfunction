#> fetchr:init/update_lobby/compare_and_update/doors/check_half
#
# Compares doors more leniently to not drop them when they are for example open
#
# @within fetchr:init/update_lobby/compare_and_update/clone
# @context dimension fetchr:lobby
# @params
# 	y: int @ 0..64,
# 	z: int @ -30000000..29999999,
# 	compare_x: int @ -30000000..29999999,
# 	compare_z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,

#NEUN_SCRIPT until 62
#$execute \
	if block ~ ~ ~ #minecraft:doors[half=lower] \
	if block $(reference_x) ~ ~ #minecraft:doors[half=lower] \
	run setblock ~ ~ ~ air
#$execute \
	if block ~ ~ ~ #minecraft:doors[half=upper] \
	if block $(reference_x) ~ ~ #minecraft:doors[half=upper] \
	run setblock ~ ~-1 ~ air
#$execute \
	if block ~ ~ ~ minecraft:air \
	if block $(reference_x) ~ ~ #minecraft:doors[half=lower] \
	run clone $(reference_x) ~ ~ $(reference_x) ~1 ~ ~ ~ ~
#$execute \
	if block ~ ~ ~ minecraft:air \
	if block $(reference_x) ~ ~ #minecraft:doors[half=upper] \
	run clone $(reference_x) ~ ~ $(reference_x) ~-1 ~ ~ ~-1 ~
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	if block ~ ~ ~ #minecraft:doors[half=lower] \
	if block $(reference_x) ~ ~ #minecraft:doors[half=lower] \
	run clone $(reference_x) ~ ~ $(reference_x) ~ ~ ~ ~ ~ strict
$execute \
	if block ~ ~ ~ #minecraft:doors[half=upper] \
	if block $(reference_x) ~ ~ #minecraft:doors[half=upper] \
	run clone $(reference_x) ~ ~ $(reference_x) ~ ~ ~ ~ ~ strict
#NEUN_SCRIPT end