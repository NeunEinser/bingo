#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/69_71
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/63_71

execute if score $custom_hud/player_pos.rot bingo.tmp matches 69 run data modify storage io.bingo:custom_hud component.icon set value '"\\u021B"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 70 run data modify storage io.bingo:custom_hud component.icon set value '"\\u021A"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 71 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0219"'
