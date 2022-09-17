#> bingo:custom_hud/components/timer/update/22696_23745
#
# Command Tree
#
# @within function bingo:custom_hud/components/timer/update/20703_23745

execute if score $custom_hud/timer.daytime bingo.tmp matches ..23040 run data modify storage io.bingo:custom_hud component.icon set value '"\\u012F"'
execute if score $custom_hud/timer.daytime bingo.tmp matches 23041..23390 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0130"'
execute if score $custom_hud/timer.daytime bingo.tmp matches 23391.. run data modify storage io.bingo:custom_hud component.icon set value '"\\u0131"'
