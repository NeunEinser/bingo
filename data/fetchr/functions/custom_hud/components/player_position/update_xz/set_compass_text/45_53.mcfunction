#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/45_53
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/27_53

execute if score $custom_hud/player_pos.rot fetchr.tmp matches ..47 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/45_47
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 48..50 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/48_50
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 51.. run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/51_53
