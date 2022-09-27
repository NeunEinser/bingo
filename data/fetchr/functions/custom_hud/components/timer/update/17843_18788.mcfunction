#> fetchr:custom_hud/components/timer/update/17843_18788
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/17843_20702

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..18157 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0120"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 18158..18472 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0121"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 18473.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0122"'
