#> fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/18_26
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/0_26

execute if score $custom_hud/player_pos.rot fetchr.tmp matches ..20 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011A"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 21..23 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0119"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 24.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0118"'
