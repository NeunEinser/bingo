#> fetchr:custom_hud/component_eval/padding/63_65
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/63_71

execute if score $custom_hud/width.padding fetchr.io matches 63 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u003f"'
execute if score $custom_hud/width.padding fetchr.io matches 64 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0040"'
execute if score $custom_hud/width.padding fetchr.io matches 65 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0041"'
