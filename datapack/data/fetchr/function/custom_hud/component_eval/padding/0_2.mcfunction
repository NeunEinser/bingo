#> fetchr:custom_hud/component_eval/padding/0_2
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/0_8

execute if score $custom_hud/width.padding fetchr.io matches 0 run data modify storage io.fetchr:custom_hud component.padding set value '""'
execute if score $custom_hud/width.padding fetchr.io matches 1 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0001"'
execute if score $custom_hud/width.padding fetchr.io matches 2 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0002"'
