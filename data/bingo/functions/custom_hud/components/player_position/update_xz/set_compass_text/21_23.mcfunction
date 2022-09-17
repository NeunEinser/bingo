#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/21_23
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/18_26

execute if score $custom_hud/player_pos.rot bingo.tmp matches 21 run data modify storage io.bingo:custom_hud component.icon set value '"\\u024B"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 22 run data modify storage io.bingo:custom_hud component.icon set value '"\\u024A"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 23 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0249"'
