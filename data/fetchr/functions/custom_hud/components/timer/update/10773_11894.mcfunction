#> fetchr:custom_hud/components/timer/update/10773_11894
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/8269_11894

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..11154 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010B"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 11155..11527 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010C"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 11528.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010D"'
