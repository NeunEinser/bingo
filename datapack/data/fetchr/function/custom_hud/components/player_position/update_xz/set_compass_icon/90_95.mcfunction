#> fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/90_95
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/81_95

execute if score $custom_hud/player_pos.rot fetchr.tmp matches ..92 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0102"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 93.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0101"'
