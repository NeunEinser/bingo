#> fetchr:custom_hud/components/timer/update/3732_5189
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/3732_8268

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..4197 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u013C"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 4198..4682 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u013D"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 4683.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u013E"'
