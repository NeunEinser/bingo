#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/0_8
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/0_26

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..2 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/0_2
execute if score $custom_hud/player_pos.rot bingo.tmp matches 3..5 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/3_5
execute if score $custom_hud/player_pos.rot bingo.tmp matches 6.. run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/6_8
