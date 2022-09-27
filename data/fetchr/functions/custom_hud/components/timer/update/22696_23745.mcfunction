#> fetchr:custom_hud/components/timer/update/22696_23745
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/20703_23745

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..23040 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u012F"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 23041..23390 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0130"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 23391.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0131"'
