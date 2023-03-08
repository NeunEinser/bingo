#> fetchr:custom_hud/component_eval/padding/24_26
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/18_26

execute if score $custom_hud/width.padding fetchr.io matches 24 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0018"'
execute if score $custom_hud/width.padding fetchr.io matches 25 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0019"'
execute if score $custom_hud/width.padding fetchr.io matches 26 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u001a"'
