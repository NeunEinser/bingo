#> fetchr:custom_hud/components/timer/update/1228_2425
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/106_3731

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..1616 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0136"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 1617..2016 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0137"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 2017.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0138"'
