#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/18_20
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/18_26

execute if score $custom_hud/player_pos.rot fetchr.tmp matches 18 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u024E"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 19 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u024D"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 20 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u024C"'
