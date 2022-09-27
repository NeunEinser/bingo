#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/81_83
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/81_89

execute if score $custom_hud/player_pos.rot fetchr.tmp matches 81 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u020F"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 82 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u020E"'
execute if score $custom_hud/player_pos.rot fetchr.tmp matches 83 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u020D"'
