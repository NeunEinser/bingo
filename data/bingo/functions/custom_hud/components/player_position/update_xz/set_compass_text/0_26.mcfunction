#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/0_26
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/0_80

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..8 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/0_8
execute if score $custom_hud/player_pos.rot bingo.tmp matches 9..17 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/9_17
execute if score $custom_hud/player_pos.rot bingo.tmp matches 18.. run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/18_26
