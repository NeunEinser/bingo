#> fetchr:custom_hud/component_eval/padding/9_11
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/9_17

execute if score $custom_hud/width.padding fetchr.io matches 9 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0009"'
execute if score $custom_hud/width.padding fetchr.io matches 10 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u000a"'
execute if score $custom_hud/width.padding fetchr.io matches 11 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u000b"'
