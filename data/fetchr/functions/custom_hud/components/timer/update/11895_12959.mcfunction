#> fetchr:custom_hud/components/timer/update/11895_12959
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/11895_14972

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..12254 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010E"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 12255..12609 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010F"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 12610.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0110"'
