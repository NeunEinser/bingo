#> bingo:custom_hud/components/timer/update/106_11894
#
# Command Tree
#
# @within function bingo:custom_hud/components/timer/update

execute if score $custom_hud/timer.daytime bingo.tmp matches ..3731 run function bingo:custom_hud/components/timer/update/106_3731
execute if score $custom_hud/timer.daytime bingo.tmp matches 3732..8268 run function bingo:custom_hud/components/timer/update/3732_8268
execute if score $custom_hud/timer.daytime bingo.tmp matches 8269.. run function bingo:custom_hud/components/timer/update/8269_11894
