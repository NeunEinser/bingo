#> fetchr:custom_hud/component_eval/padding/48_50
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/45_53

execute if score $custom_hud/width.padding fetchr.io matches 48 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0030"'
execute if score $custom_hud/width.padding fetchr.io matches 49 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0031"'
execute if score $custom_hud/width.padding fetchr.io matches 50 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0032"'
