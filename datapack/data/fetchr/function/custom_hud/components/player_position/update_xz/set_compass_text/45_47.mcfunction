#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/45_47
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/45_53

execute if score $custom_hud/player_pos.rot fetchr.tmp matches 45 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0233"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 46 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0232"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 47 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0231"'
