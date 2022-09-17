#> bingo:custom_hud/components/player_position/update_xz/set_compass_icon/63_71
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_icon/54_80

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..65 run data modify storage io.bingo:custom_hud component.icon set value '"\\u010B"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 66..68 run data modify storage io.bingo:custom_hud component.icon set value '"\\u010A"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 69.. run data modify storage io.bingo:custom_hud component.icon set value '"\\u0109"'
