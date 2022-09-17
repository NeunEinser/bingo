#> bingo:custom_hud/components/timer/update/106_3731
#
# Command Tree
#
# @within function bingo:custom_hud/components/timer/update/106_11894

execute if score $custom_hud/timer.daytime bingo.tmp matches ..1227 run function bingo:custom_hud/components/timer/update/106_1227
execute if score $custom_hud/timer.daytime bingo.tmp matches 1228..2425 run function bingo:custom_hud/components/timer/update/1228_2425
execute if score $custom_hud/timer.daytime bingo.tmp matches 2426.. run function bingo:custom_hud/components/timer/update/2426_3731
