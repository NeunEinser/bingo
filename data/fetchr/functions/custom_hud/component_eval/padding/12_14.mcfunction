#> fetchr:custom_hud/component_eval/padding/12_14
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/9_17

execute if score $custom_hud/width.padding fetchr.io matches 12 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u000c"'
execute if score $custom_hud/width.padding fetchr.io matches 13 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u000d"'
execute if score $custom_hud/width.padding fetchr.io matches 14 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u000e"'
