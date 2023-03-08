#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/75_77
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/72_80

execute if score $custom_hud/player_pos.rot fetchr.tmp matches 75 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0215"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 76 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0214"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 77 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0213"'
