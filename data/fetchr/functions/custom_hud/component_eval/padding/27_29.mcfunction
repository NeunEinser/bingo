#> fetchr:custom_hud/component_eval/padding/27_29
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/27_35

execute if score $custom_hud/width.padding fetchr.io matches 27 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u001b"'
execute if score $custom_hud/width.padding fetchr.io matches 28 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u001c"'
execute if score $custom_hud/width.padding fetchr.io matches 29 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u001d"'
