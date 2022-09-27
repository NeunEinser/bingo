#> fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_x/3
#
# Makes sure 1-bit is not set for the x coordinate
#
# @context
# 	entity Player
# 	position @s
# @within function fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_x/2

execute if score $custom_hud/player_pos.x fetchr.tmp matches 2.. run scoreboard players remove $custom_hud/player_pos.x fetchr.tmp 2
execute if score $custom_hud/player_pos.x fetchr.tmp matches 0 run function fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_z/0
execute if score $custom_hud/player_pos.x fetchr.tmp matches 1 positioned ~-1 ~ ~ run function fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_z/0