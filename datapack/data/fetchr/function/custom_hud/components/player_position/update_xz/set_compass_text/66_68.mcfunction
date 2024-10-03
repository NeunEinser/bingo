#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/66_68
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/63_71

execute if score $custom_hud/player_pos.rot fetchr.tmp matches 66 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u021E"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 67 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u021D"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 68 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u021C"'
