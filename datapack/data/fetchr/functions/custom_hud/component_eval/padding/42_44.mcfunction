#> fetchr:custom_hud/component_eval/padding/42_44
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/36_44

execute if score $custom_hud/width.padding fetchr.io matches 42 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u002a"'
execute if score $custom_hud/width.padding fetchr.io matches 43 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u002b"'
execute if score $custom_hud/width.padding fetchr.io matches 44 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u002c"'
