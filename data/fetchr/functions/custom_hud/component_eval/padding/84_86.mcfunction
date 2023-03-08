#> fetchr:custom_hud/component_eval/padding/84_86
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/81_89

execute if score $custom_hud/width.padding fetchr.io matches 84 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0054"'
execute if score $custom_hud/width.padding fetchr.io matches 85 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0055"'
execute if score $custom_hud/width.padding fetchr.io matches 86 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0056"'
