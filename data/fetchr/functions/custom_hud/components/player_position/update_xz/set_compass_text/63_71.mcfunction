#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/63_71
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/54_80

execute if score $custom_hud/player_pos.rot fetchr.tmp matches ..65 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/63_65
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 66..68 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/66_68
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 69.. run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/69_71
