#> fetchr:game/spawn_preview/on_spyglass_dropped
#
# This function is called when a player drops a spyglass in the spawn preview
#
# @within function fetchr:game/spawn_preview/tick
# @context entity Player

execute \
	as @e[type=minecraft:item, distance=..20] \
	if items entity @s contents minecraft:spyglass[minecraft:custom_data={ fetchr: { spawn_preview_spyglass: true } }] \
	run data modify entity @s PickupDelay set value 0s

scoreboard players set @s fetchr.spyglass_dropped 0