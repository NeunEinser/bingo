#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/9_11
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/9_17

execute if score $custom_hud/player_pos.rot bingo.tmp matches 9 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0257"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 10 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0256"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 11 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0255"'
