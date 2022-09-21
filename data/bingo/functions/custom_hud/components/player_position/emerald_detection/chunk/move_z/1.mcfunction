#> bingo:custom_hud/components/player_position/emerald_detection/chunk/move_z/1
#
# Makes sure 4-bit is not set for the z coordinate
#
# @context
# 	entity Player
# 	position @s
# @within function bingo:custom_hud/components/player_position/emerald_detection/chunk/move_z/0

execute if score $custom_hud/player_pos.z bingo.tmp matches 8.. run scoreboard players remove $custom_hud/player_pos.z bingo.tmp 8
execute if score $custom_hud/player_pos.z bingo.tmp matches ..3 run function bingo:custom_hud/components/player_position/emerald_detection/chunk/move_z/2
execute if score $custom_hud/player_pos.z bingo.tmp matches 4.. positioned ~ ~ ~-4 run function bingo:custom_hud/components/player_position/emerald_detection/chunk/move_z/2