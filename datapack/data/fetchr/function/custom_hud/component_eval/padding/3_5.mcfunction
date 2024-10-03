#> fetchr:custom_hud/component_eval/padding/3_5
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/0_8

execute if score $custom_hud/width.padding fetchr.io matches 3 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0003"'
execute if score $custom_hud/width.padding fetchr.io matches 4 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0004"'
execute if score $custom_hud/width.padding fetchr.io matches 5 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0005"'
