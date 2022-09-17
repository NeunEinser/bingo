#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/63_65
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/63_71

execute if score $custom_hud/player_pos.rot bingo.tmp matches 63 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0221"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 64 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0220"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 65 run data modify storage io.bingo:custom_hud component.icon set value '"\\u021F"'
