#> bingo:custom_hud/components/player_position/update_xz/set_compass_icon
#
# This function sets the compass icon for the component
#
# @within function bingo:custom_hud/components/player_position/update_xz
# @context entity Player whose hud is currently being updated

data modify storage io.bingo:custom_hud component.iconWidth set value '{"translate": "space.10"}'

execute if score $custom_hud/player_pos.rot bingo.tmp matches 0..80 run function bingo:custom_hud/components/player_position/update_xz/set_compass_icon/0_80
execute if score $custom_hud/player_pos.rot bingo.tmp matches 81..95 run function bingo:custom_hud/components/player_position/update_xz/set_compass_icon/81_95