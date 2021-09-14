#> bingo:card_frames/spawn
#
# Resummons all card frames
#
# @internal
# @context
# 	dimension bingo:lobby
# 	location Location where next item frame needs to be placed, starting from
# 		top left
#>

kill @e[type=minecraft:item_frame, tag=bingo.card_frame]
scoreboard players set $card_frames/spawn.i bingo.tmp 0
data modify storage tmp.bingo:input/spawn_frames slots set from storage bingo:card slots
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.card_generation_frame_start, limit=1] run function bingo:card_frames/spawn_iter