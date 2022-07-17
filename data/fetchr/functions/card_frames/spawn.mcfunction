#> fetchr:card_frames/spawn
#
# Resummons all card frames
#
# @internal
# @context
# 	dimension fetchr:lobby
# 	location Location where next item frame needs to be placed, starting from
# 		top left
#>

kill @e[type=minecraft:item_frame, tag=fetchr.card_frame]
scoreboard players set $card_frames/spawn.i fetchr.tmp 0
data modify storage tmp.fetchr:card_frames/spawn_frames slots set from storage fetchr:card slots
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.card_generation_frame_start, limit=1] run function fetchr:card_frames/spawn_iter