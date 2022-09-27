#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/42_44
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/36_44

execute if score $custom_hud/player_pos.rot fetchr.tmp matches 42 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0236"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 43 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0235"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 44 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0234"'
