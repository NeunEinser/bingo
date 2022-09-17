#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/63_71
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/54_80

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..65 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/63_65
execute if score $custom_hud/player_pos.rot bingo.tmp matches 66..68 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/66_68
execute if score $custom_hud/player_pos.rot bingo.tmp matches 69.. run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/69_71
