#> fetchr:custom_hud/components/timer/update/19740_20702
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/17843_20702

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..20058 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0126"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 20059..20379 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0127"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 20380.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0128"'
