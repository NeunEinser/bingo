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
data modify storage temp:bingo.input/spawn_frames slots set from storage bingo:card slots
execute in bingo:lobby positioned -4 68 -13 run function bingo:card_frames/spawn_iter