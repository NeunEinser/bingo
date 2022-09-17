#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/54_56
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/54_62

execute if score $custom_hud/player_pos.rot bingo.tmp matches 54 run data modify storage io.bingo:custom_hud component.icon set value '"\\u022A"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 55 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0229"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 56 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0228"'
