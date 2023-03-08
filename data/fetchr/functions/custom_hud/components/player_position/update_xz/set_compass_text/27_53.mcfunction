#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/27_53
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_80

execute if score $custom_hud/player_pos.rot fetchr.tmp matches ..35 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/27_35
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 36..44 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/36_44
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 45.. run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/45_53
