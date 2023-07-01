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
execute at @e[type=minecraft:marker, tag=fetchr.card_frame_start] run function fetchr:card_frames/spawn_frames