#> fetchr:custom_hud/components/player_position/emerald_detection/chunk/detect_in_y_column
#
# This function is executed at chunk position 10 10. For every spot on that
# chunk coordinate, it is extremely likely to contain the correct biome which
# is checked for feature generation.
#
# To be sure, 8 spots with different y coordinates are checked. If most of them
# are mountain, it's an emerald chunk.
#
# @within function fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_z/3
# @context
# 	entity Player who is checked if they are located in an emerald chunk
# 	position Chunk coordinate 10 10 of the chunk @s occupies

#>
# @private
#declare score_holder $emerald_detection.mountain_count
scoreboard players set $emerald_detection.mountain_count fetchr.tmp 0

tag @s remove fetchr.emerald

execute positioned ~ 0 ~ if predicate fetchr:can_generate_emerald run scoreboard players add $emerald_detection.mountain_count fetchr.tmp 1
execute positioned ~ 1 ~ if predicate fetchr:can_generate_emerald run scoreboard players add $emerald_detection.mountain_count fetchr.tmp 1
execute positioned ~ 2 ~ if predicate fetchr:can_generate_emerald run scoreboard players add $emerald_detection.mountain_count fetchr.tmp 1
execute positioned ~ 3 ~ if predicate fetchr:can_generate_emerald run scoreboard players add $emerald_detection.mountain_count fetchr.tmp 1
execute positioned ~ 4 ~ if predicate fetchr:can_generate_emerald run scoreboard players add $emerald_detection.mountain_count fetchr.tmp 1
execute positioned ~ 5 ~ if predicate fetchr:can_generate_emerald run scoreboard players add $emerald_detection.mountain_count fetchr.tmp 1
execute positioned ~ 6 ~ if predicate fetchr:can_generate_emerald run scoreboard players add $emerald_detection.mountain_count fetchr.tmp 1
execute positioned ~ 7 ~ if predicate fetchr:can_generate_emerald run scoreboard players add $emerald_detection.mountain_count fetchr.tmp 1

execute if score $emerald_detection.mountain_count fetchr.tmp matches 4.. run tag @s add fetchr.emerald