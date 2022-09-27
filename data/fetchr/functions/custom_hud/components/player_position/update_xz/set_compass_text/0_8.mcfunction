#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_8
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_26

execute if score $custom_hud/player_pos.rot fetchr.tmp matches ..2 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_2
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 3..5 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/3_5
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 6.. run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/6_8
