#> fetchr:custom_hud/component_eval/padding/36_38
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/36_44

execute if score $custom_hud/width.padding fetchr.io matches 36 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0024"'
execute if score $custom_hud/width.padding fetchr.io matches 37 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0025"'
execute if score $custom_hud/width.padding fetchr.io matches 38 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0026"'
