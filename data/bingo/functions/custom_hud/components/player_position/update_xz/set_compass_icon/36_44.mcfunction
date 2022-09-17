#> bingo:custom_hud/components/player_position/update_xz/set_compass_icon/36_44
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_icon/27_53

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..38 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0114"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 39..41 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0113"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 42.. run data modify storage io.bingo:custom_hud component.icon set value '"\\u0112"'
