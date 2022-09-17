#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/15_17
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/9_17

execute if score $custom_hud/player_pos.rot bingo.tmp matches 15 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0251"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 16 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0250"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 17 run data modify storage io.bingo:custom_hud component.icon set value '"\\u024F"'
