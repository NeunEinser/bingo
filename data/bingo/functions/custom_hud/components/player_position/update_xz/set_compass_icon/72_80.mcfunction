#> bingo:custom_hud/components/player_position/update_xz/set_compass_icon/72_80
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_icon/54_80

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..74 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0108"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 75..77 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0107"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 78.. run data modify storage io.bingo:custom_hud component.icon set value '"\\u0106"'
