#> fetchr:custom_hud/components/timer/update/15942_16895
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/14973_17842

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..16260 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011A"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 16261..16578 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011B"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 16579.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011C"'
