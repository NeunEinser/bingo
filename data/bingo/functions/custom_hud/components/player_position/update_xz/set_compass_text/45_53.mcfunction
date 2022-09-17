#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/45_53
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/27_53

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..47 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/45_47
execute if score $custom_hud/player_pos.rot bingo.tmp matches 48..50 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/48_50
execute if score $custom_hud/player_pos.rot bingo.tmp matches 51.. run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/51_53
