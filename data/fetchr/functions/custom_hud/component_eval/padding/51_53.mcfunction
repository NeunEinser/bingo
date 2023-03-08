#> fetchr:custom_hud/component_eval/padding/51_53
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/45_53

execute if score $custom_hud/width.padding fetchr.io matches 51 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0033"'
execute if score $custom_hud/width.padding fetchr.io matches 52 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0034"'
execute if score $custom_hud/width.padding fetchr.io matches 53 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0035"'
