#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/0_2
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/0_8

execute if score $custom_hud/player_pos.rot bingo.tmp matches 0 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0200"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 1 run data modify storage io.bingo:custom_hud component.icon set value '"\\u025F"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 2 run data modify storage io.bingo:custom_hud component.icon set value '"\\u025E"'
