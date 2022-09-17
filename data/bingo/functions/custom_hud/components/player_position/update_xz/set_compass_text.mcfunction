#> bingo:custom_hud/components/player_position/update_xz/set_compass_text
#
# This function sets the compass text icon for the component
#
# @within function bingo:custom_hud/components/player_position/update_xz
# @context entity Player whose hud is currently being updated

scoreboard players remove $custom_hud/width.padding bingo.io 4
data modify storage io.bingo:custom_hud component.iconWidth set value '{"translate": "space.14"}'

execute if score $custom_hud/player_pos.rot bingo.tmp matches 0..80 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/0_80
execute if score $custom_hud/player_pos.rot bingo.tmp matches 81..95 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/81_95