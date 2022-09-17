#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/84_86
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/81_89

execute if score $custom_hud/player_pos.rot bingo.tmp matches 84 run data modify storage io.bingo:custom_hud component.icon set value '"\\u020C"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 85 run data modify storage io.bingo:custom_hud component.icon set value '"\\u020B"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 86 run data modify storage io.bingo:custom_hud component.icon set value '"\\u020A"'
