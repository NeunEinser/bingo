#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/6_8
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/0_8

execute if score $custom_hud/player_pos.rot bingo.tmp matches 6 run data modify storage io.bingo:custom_hud component.icon set value '"\\u025A"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 7 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0259"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 8 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0258"'
