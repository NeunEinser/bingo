#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/72_80
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/54_80

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..74 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/72_74
execute if score $custom_hud/player_pos.rot bingo.tmp matches 75..77 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/75_77
execute if score $custom_hud/player_pos.rot bingo.tmp matches 78.. run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/78_80
