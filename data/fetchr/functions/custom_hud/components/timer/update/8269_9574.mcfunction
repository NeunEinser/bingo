#> fetchr:custom_hud/components/timer/update/8269_9574
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/8269_11894

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..8717 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0105"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 8718..9152 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0106"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 9153.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0107"'
