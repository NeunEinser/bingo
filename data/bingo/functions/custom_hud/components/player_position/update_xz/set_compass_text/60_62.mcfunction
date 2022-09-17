#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/60_62
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/54_62

execute if score $custom_hud/player_pos.rot bingo.tmp matches 60 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0224"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 61 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0223"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 62 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0222"'
