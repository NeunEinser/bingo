#> bingo:custom_hud/components/player_position/emerald_detection/chunk/move_z/2
#
# Makes sure 2-bit is set for the z coordinate
#
# @context
# 	entity Player
# 	position @s
# @within function bingo:custom_hud/components/player_position/emerald_detection/chunk/move_z/1

execute if score $custom_hud/player_pos.z bingo.tmp matches 4.. run scoreboard players remove $custom_hud/player_pos.z bingo.tmp 4
execute if score $custom_hud/player_pos.z bingo.tmp matches ..1 positioned ~ ~ ~2 run function bingo:custom_hud/components/player_position/emerald_detection/chunk/move_z/3
execute if score $custom_hud/player_pos.z bingo.tmp matches 2.. run function bingo:custom_hud/components/player_position/emerald_detection/chunk/move_z/3