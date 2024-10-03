#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_26
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_80

execute if score $custom_hud/player_pos.rot fetchr.tmp matches ..8 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_8
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 9..17 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/9_17
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 18.. run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/18_26
