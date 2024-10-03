#> fetchr:custom_hud/components/timer/update/18789_19739
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/17843_20702

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..19104 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0123"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 19105..19421 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0124"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 19422.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0125"'
