#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/18_26
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_26

execute if score $custom_hud/player_pos.rot fetchr.tmp matches ..20 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/18_20
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 21..23 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/21_23
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 24.. run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/24_26
