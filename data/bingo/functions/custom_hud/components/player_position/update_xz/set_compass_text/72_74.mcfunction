#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/72_74
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/72_80

execute if score $custom_hud/player_pos.rot bingo.tmp matches 72 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0218"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 73 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0217"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 74 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0216"'
