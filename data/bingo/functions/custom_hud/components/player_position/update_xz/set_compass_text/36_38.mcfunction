#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/36_38
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/36_44

execute if score $custom_hud/player_pos.rot bingo.tmp matches 36 run data modify storage io.bingo:custom_hud component.icon set value '"\\u023C"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 37 run data modify storage io.bingo:custom_hud component.icon set value '"\\u023B"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 38 run data modify storage io.bingo:custom_hud component.icon set value '"\\u023A"'
