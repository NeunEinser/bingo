#> fetchr:custom_hud/component_eval/padding/6_8
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/0_8

execute if score $custom_hud/width.padding fetchr.io matches 6 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0006"'
execute if score $custom_hud/width.padding fetchr.io matches 7 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0007"'
execute if score $custom_hud/width.padding fetchr.io matches 8 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0008"'
