#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/9_17
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/0_26

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..11 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/9_11
execute if score $custom_hud/player_pos.rot bingo.tmp matches 12..14 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/12_14
execute if score $custom_hud/player_pos.rot bingo.tmp matches 15.. run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/15_17
