#> fetchr:game/skybox/player_tick
#
# This function is executed for every player during the skybox phase
#
# @within function fetchr:game/skybox/tick

execute \
	align y \
	if block ~ ~ ~ minecraft:void_air \
	run tp ~ ~1.2 ~
execute \
	align y \
	if block ~ ~-1 ~ minecraft:void_air \
	unless entity @s[distance=...01] \
	run tp ~ ~.2 ~
execute \
	align y \
	if block ~ ~-1 ~-1 minecraft:void_air \
	run tp ~ ~ ~
#NEUN_SCRIPT until 49
# execute \
	if block ~ ~-1 ~ minecraft:void_air \
	run attribute @s generic.gravity base set 0
# execute \
	if block ~ ~-1 ~-1 minecraft:void_air \
	run attribute @s generic.gravity base set 0
# execute \
	unless block ~ ~-1 ~ minecraft:void_air \
	unless block ~ ~-1 ~-1 minecraft:void_air \
	run attribute @s generic.gravity base set 0.08
#NEUN_SCRIPT end
#NEUN_SCRIPT since 49
execute \
	if block ~ ~-1 ~ minecraft:void_air \
	run attribute @s gravity base set 0
execute \
	if block ~ ~-1 ~-1 minecraft:void_air \
	run attribute @s gravity base set 0
execute \
	unless block ~ ~-1 ~ minecraft:void_air \
	unless block ~ ~-1 ~-1 minecraft:void_air \
	run attribute @s gravity base set 0.08
#NEUN_SCRIPT end