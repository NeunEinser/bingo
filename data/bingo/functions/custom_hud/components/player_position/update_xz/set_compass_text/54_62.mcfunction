#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/54_62
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/54_80

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..56 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/54_56
execute if score $custom_hud/player_pos.rot bingo.tmp matches 57..59 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/57_59
execute if score $custom_hud/player_pos.rot bingo.tmp matches 60.. run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/60_62
