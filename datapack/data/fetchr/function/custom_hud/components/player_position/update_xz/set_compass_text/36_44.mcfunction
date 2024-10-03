#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/36_44
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/27_53

execute if score $custom_hud/player_pos.rot fetchr.tmp matches ..38 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/36_38
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 39..41 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/39_41
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 42.. run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/42_44
