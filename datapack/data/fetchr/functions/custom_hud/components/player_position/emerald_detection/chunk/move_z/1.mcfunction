#> fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_z/1
#
# Makes sure 4-bit is not set for the z coordinate
#
# @context
# 	entity Player
# 	position @s
# @within function fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_z/0

execute if score $custom_hud/player_pos.z fetchr.tmp matches 8.. run scoreboard players remove $custom_hud/player_pos.z fetchr.tmp 8
execute if score $custom_hud/player_pos.z fetchr.tmp matches ..3 run function fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_z/2
execute if score $custom_hud/player_pos.z fetchr.tmp matches 4.. positioned ~ ~ ~-4 run function fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_z/2