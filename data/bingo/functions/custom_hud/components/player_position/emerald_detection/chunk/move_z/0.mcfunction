#> bingo:custom_hud/components/player_position/emerald_detection/chunk/move_z/0
#
# Makes sure 8-bit is set for the z coordinate
#
# @context
# 	entity Player
# 	position @s
# @within function bingo:custom_hud/components/player_position/emerald_detection/chunk/move_x/3

execute if score $custom_hud/player_pos.z bingo.tmp matches ..7 positioned ~ ~ ~8 run function bingo:custom_hud/components/player_position/emerald_detection/chunk/move_z/1
execute if score $custom_hud/player_pos.z bingo.tmp matches 8.. run function bingo:custom_hud/components/player_position/emerald_detection/chunk/move_z/1