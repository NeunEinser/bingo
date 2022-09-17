#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/81_89
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/81_95

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..83 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/81_83
execute if score $custom_hud/player_pos.rot bingo.tmp matches 84..86 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/84_86
execute if score $custom_hud/player_pos.rot bingo.tmp matches 87.. run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/87_89
