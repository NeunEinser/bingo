#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/27_35
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/27_53

execute if score $custom_hud/player_pos.rot fetchr.tmp matches ..29 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/27_29
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 30..32 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/30_32
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 33.. run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/33_35
