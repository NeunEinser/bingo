#> bingo:custom_hud/components/timer/update/9575_10772
#
# Command Tree
#
# @within function bingo:custom_hud/components/timer/update/8269_11894

execute if score $custom_hud/timer.daytime bingo.tmp matches ..9983 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0108"'
execute if score $custom_hud/timer.daytime bingo.tmp matches 9984..10383 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0109"'
execute if score $custom_hud/timer.daytime bingo.tmp matches 10384.. run data modify storage io.bingo:custom_hud component.icon set value '"\\u010A"'
