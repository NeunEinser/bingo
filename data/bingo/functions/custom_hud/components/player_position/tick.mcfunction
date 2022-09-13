#> bingo:custom_hud/components/player_position/tick
#
# @within tag/function bingo:tick_hud_components
# @handles #bingo:tick_hud_components

execute if score @s bingo.update_hud matches 1 run function bingo:custom_hud/components/player_position/update
execute unless score @s bingo.update_hud matches 1 if entity @s[tag=bingo.position_changed] run function bingo:custom_hud/components/player_position/update