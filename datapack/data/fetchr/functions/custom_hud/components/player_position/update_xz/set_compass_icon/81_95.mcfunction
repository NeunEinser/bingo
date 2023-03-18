#> fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/81_95
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon

execute if score $custom_hud/player_pos.rot fetchr.tmp matches ..89 run function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/81_89
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 90.. run function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/90_95
