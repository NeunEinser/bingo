#> bingo:custom_hud/components/player_position/update_xz/set_compass_icon/27_35
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_icon/27_53

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..29 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0117"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 30..32 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0116"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 33.. run data modify storage io.bingo:custom_hud component.icon set value '"\\u0115"'
