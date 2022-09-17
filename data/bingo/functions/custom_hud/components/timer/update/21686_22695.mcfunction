#> bingo:custom_hud/components/timer/update/21686_22695
#
# Command Tree
#
# @within function bingo:custom_hud/components/timer/update/20703_23745

execute if score $custom_hud/timer.daytime bingo.tmp matches ..22018 run data modify storage io.bingo:custom_hud component.icon set value '"\\u012C"'
execute if score $custom_hud/timer.daytime bingo.tmp matches 22019..22355 run data modify storage io.bingo:custom_hud component.icon set value '"\\u012D"'
execute if score $custom_hud/timer.daytime bingo.tmp matches 22356.. run data modify storage io.bingo:custom_hud component.icon set value '"\\u012E"'
