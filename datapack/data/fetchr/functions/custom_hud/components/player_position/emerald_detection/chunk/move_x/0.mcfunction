#> fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_x/0
#
# Makes sure 8-bit is set for the x coordinate
#
# @context
# 	entity Player
# 	position @s
# @within function fetchr:custom_hud/components/player_position/emerald_detection/**

execute if score $custom_hud/player_pos.x fetchr.tmp matches ..7 positioned ~8 ~ ~ run function fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_x/1
execute if score $custom_hud/player_pos.x fetchr.tmp matches 8.. run function fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_x/1