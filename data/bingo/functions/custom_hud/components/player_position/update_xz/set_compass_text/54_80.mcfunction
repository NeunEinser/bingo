#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/54_80
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/0_80

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..62 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/54_62
execute if score $custom_hud/player_pos.rot bingo.tmp matches 63..71 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/63_71
execute if score $custom_hud/player_pos.rot bingo.tmp matches 72.. run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/72_80
