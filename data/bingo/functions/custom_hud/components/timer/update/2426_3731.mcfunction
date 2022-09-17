#> bingo:custom_hud/components/timer/update/2426_3731
#
# Command Tree
#
# @within function bingo:custom_hud/components/timer/update/106_3731

execute if score $custom_hud/timer.daytime bingo.tmp matches ..2847 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0139"'
execute if score $custom_hud/timer.daytime bingo.tmp matches 2848..3282 run data modify storage io.bingo:custom_hud component.icon set value '"\\u013A"'
execute if score $custom_hud/timer.daytime bingo.tmp matches 3283.. run data modify storage io.bingo:custom_hud component.icon set value '"\\u013B"'
