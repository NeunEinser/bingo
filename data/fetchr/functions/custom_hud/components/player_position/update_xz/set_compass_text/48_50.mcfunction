#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/48_50
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/45_53

execute if score $custom_hud/player_pos.rot fetchr.tmp matches 48 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0230"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 49 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u022F"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 50 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u022E"'
