#> fetchr:custom_hud/component_eval/padding/45_47
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/45_53

execute if score $custom_hud/width.padding fetchr.io matches 45 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u002d"'
execute if score $custom_hud/width.padding fetchr.io matches 46 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u002e"'
execute if score $custom_hud/width.padding fetchr.io matches 47 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u002f"'
