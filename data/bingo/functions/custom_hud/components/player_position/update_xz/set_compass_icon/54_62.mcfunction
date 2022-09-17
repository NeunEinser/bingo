#> bingo:custom_hud/components/player_position/update_xz/set_compass_icon/54_62
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_icon/54_80

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..56 run data modify storage io.bingo:custom_hud component.icon set value '"\\u010E"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 57..59 run data modify storage io.bingo:custom_hud component.icon set value '"\\u010D"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 60.. run data modify storage io.bingo:custom_hud component.icon set value '"\\u010C"'
