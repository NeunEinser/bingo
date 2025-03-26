#> fetchr:game/skybox/player_tick
#
# This function is called for every player during the skybox phase
#
# @within function fetchr:game/skybox/tick
# @context entity Player

execute \
	if score @s fetchr.spyglass_dropped matches 1 \
	as @n[type=minecraft:item, distance=..5] \
	if items entity @s contents minecraft:spyglass[minecraft:custom_data={ fetchr: { skybox_spyglass: true } }] \
	run data modify entity @s PickupDelay set value 0s

scoreboard players set @s fetchr.spyglass_dropped 0