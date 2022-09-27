#> fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/9_17
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/0_26

execute if score $custom_hud/player_pos.rot fetchr.tmp matches ..11 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011D"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 12..14 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011C"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 15.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011B"'
