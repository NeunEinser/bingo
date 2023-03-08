#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/90_92
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/90_95

execute if score $custom_hud/player_pos.rot fetchr.tmp matches 90 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0206"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 91 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0205"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 92 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0204"'
