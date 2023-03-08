#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/30_32
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/27_35

execute if score $custom_hud/player_pos.rot fetchr.tmp matches 30 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0242"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 31 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0241"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 32 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0240"'
