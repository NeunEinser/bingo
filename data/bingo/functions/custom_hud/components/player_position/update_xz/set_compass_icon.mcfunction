#> bingo:custom_hud/components/player_position/update_xz/set_compass_icon
#
# This function sets the compass icon for the component
#
# @within function bingo:custom_hud/components/player_position/update_xz
# @context entity Player whose hud is currently being updated

data modify storage io.bingo:custom_hud component.iconWidth set value '{"translate": "space.10"}'
scoreboard players operation $custom_hud/player_pos.rot bingo.tmp /= 3 bingo.const

execute if score $custom_hud/player_pos.rot bingo.tmp matches 0 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0100"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 1 run data modify storage io.bingo:custom_hud component.icon set value '"\\u011F"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 2 run data modify storage io.bingo:custom_hud component.icon set value '"\\u011E"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 3 run data modify storage io.bingo:custom_hud component.icon set value '"\\u011D"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 4 run data modify storage io.bingo:custom_hud component.icon set value '"\\u011C"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 5 run data modify storage io.bingo:custom_hud component.icon set value '"\\u011B"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 6 run data modify storage io.bingo:custom_hud component.icon set value '"\\u011A"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 7 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0119"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 8 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0118"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 9 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0117"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 10 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0116"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 11 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0115"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 12 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0114"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 13 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0113"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 14 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0112"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 15 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0111"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 16 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0110"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 17 run data modify storage io.bingo:custom_hud component.icon set value '"\\u010F"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 18 run data modify storage io.bingo:custom_hud component.icon set value '"\\u010E"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 19 run data modify storage io.bingo:custom_hud component.icon set value '"\\u010D"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 20 run data modify storage io.bingo:custom_hud component.icon set value '"\\u010C"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 21 run data modify storage io.bingo:custom_hud component.icon set value '"\\u010B"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 22 run data modify storage io.bingo:custom_hud component.icon set value '"\\u010A"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 23 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0109"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 24 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0108"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 25 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0107"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 26 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0106"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 27 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0105"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 28 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0104"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 29 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0103"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 30 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0102"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 31 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0101"'