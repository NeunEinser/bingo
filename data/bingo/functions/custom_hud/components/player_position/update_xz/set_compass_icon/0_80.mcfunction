#> bingo:custom_hud/components/player_position/update_xz/set_compass_icon/0_80
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_icon

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..26 run function bingo:custom_hud/components/player_position/update_xz/set_compass_icon/0_26
execute if score $custom_hud/player_pos.rot bingo.tmp matches 27..53 run function bingo:custom_hud/components/player_position/update_xz/set_compass_icon/27_53
execute if score $custom_hud/player_pos.rot bingo.tmp matches 54.. run function bingo:custom_hud/components/player_position/update_xz/set_compass_icon/54_80
